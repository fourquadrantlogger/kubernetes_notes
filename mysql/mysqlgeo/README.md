# mysql geo

```
创建一个包含空间数据的名为points的表。

CREATE TABLE points(

longitude DOUBLE,

latitude DOUBLE,

point POINT

);
```

```
delimiter // -- 将SQL标识符设为 '//'
CREATE PROCEDURE fill_points(
IN size INT(10)

)
BEGIN
DECLARE i DOUBLE(10,1) DEFAULT size;

DECLARE lon FLOAT(7,4);
DECLARE lat FLOAT(6,4);

DECLARE position VARCHAR(100);
DELETE FROM Points;
WHILE i > 0 DO
SET lon = RAND() * 360 - 180;

SET lat = RAND() * 180 - 90;
SET position = CONCAT( 'POINT(', lon, ' ', lat, ')' );
INSERT INTO Points(name, location) VALUES ( CONCAT('name_', i), GeomFromText(position) );
SET i = i - 1;
END WHILE;

END

3、生成数据

CALL fill_points(10000);
```

4、查找区域内的点

``` 
SET @center = GeomFromText('POINT(10 10)');

SET @radius = 30;

SET @bbox = CONCAT('POLYGON((',

X(@center) - @radius, ' ', Y(@center) - @radius, ',',

X(@center) + @radius, ' ', Y(@center) - @radius, ',',

X(@center) + @radius, ' ', Y(@center) + @radius, ',',

X(@center) - @radius, ' ', Y(@center) + @radius, ',',

X(@center) - @radius, ' ', Y(@center) - @radius, '))'

);
```

查询

```
SELECT name, AsText(location)

FROM Points

WHERE Intersects( location, GeomFromText(@bbox) )

AND SQRT(POW( ABS( X(location) - X(@center)), 2) + POW( ABS(Y(location) - Y(@center)), 2 )) < @radius;
 
```
 
``` 
SELECT name, AsText(location), SQRT(POW( ABS( X(location) - X(@center)), 2) + POW( ABS(Y(location) - Y(@center)), 2 )) AS distance

FROM Points

WHERE Intersects( location, GeomFromText(@bbox) )

AND SQRT(POW( ABS( X(location) - X(@center)), 2) + POW( ABS(Y(location) - Y(@center)), 2 )) < @radius

ORDER BY distance;


```