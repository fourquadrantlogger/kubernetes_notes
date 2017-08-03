+----------------------+--------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+---------+------------------------+---------+----------------------+----------------------+--------------------+
| Trigger              | Event  | Table         | Statement                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Timing | Created | sql_mode               | Definer | character_set_client | collation_connection | Database Collation |
+----------------------+--------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+---------+------------------------+---------+----------------------+----------------------+--------------------+
| insert_blacklistinfo | INSERT | BlackListInfo | begin

insert IGNORE into TableEvent(TableName,`Event`,Action) values('BlackListInfo',concat('BlackListInfo_',new.OpenId),1);

end                                                                                                                                                                                                                                                                                                                                           | AFTER  | NULL    | NO_ENGINE_SUBSTITUTION | admin@% | utf8                 | utf8_general_ci      | utf8_general_ci    |
| update_blacklistinfo | UPDATE | BlackListInfo | begin

insert IGNORE into TableEvent(TableName,`Event`,Action) values('BlackListInfo',concat('BlackListInfo_',new.OpenId),2);

end                                                                                                                                                                                                                                                                                                                                           | AFTER  | NULL    | NO_ENGINE_SUBSTITUTION | admin@% | utf8                 | utf8_general_ci      | utf8_general_ci    |
| insert_userinfo      | INSERT | UserInfo      | begin

if new.AttrType = 1 or new.AttrType = 2 or new.AttrType = 3 or new.AttrType = 5 or new.AttrType = 8 or new.AttrType = 11 or new.AttrType = 12 or new.AttrType = 14 then
     insert IGNORE into TableEvent(TableName,`Event`,Action) values('UserInfo',concat('UserInfo_',new.OpenId),1);
end if;

end                                                                                                                                                                | AFTER  | NULL    | NO_ENGINE_SUBSTITUTION | admin@% | latin1               | latin1_swedish_ci    | utf8_general_ci    |
| update_userinfo      | UPDATE | UserInfo      | begin

if new.AttrType = 1 or new.AttrType = 2 or new.AttrType = 3 or new.AttrType = 5 or new.AttrType = 8 or new.AttrType = 11 or new.AttrType = 12 or new.AttrType = 14 then
insert IGNORE into TableEvent(TableName,`Event`,Action) values('UserInfo',concat('UserInfo_',new.OpenId),1);
end if;


if new.AttrType = 12 then
     insert into user_level_debug(OpenId,`New`,Old,Ts,`User`) values(new.OpenId,new.ValueByInt,old.ValueByInt,now(),user());
end if;



end | AFTER  | NULL    | NO_ENGINE_SUBSTITUTION | admin@% | utf8                 | utf8_general_ci      | utf8_general_ci    |
+----------------------+--------+---------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+---------+------------------------+---------+----------------------+----------------------+--------------------+
