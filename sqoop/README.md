# sqoop

## [guide](http://sqoop.apache.org/docs/1.4.6/SqoopUserGuide.html)

wget http://www-eu.apache.org/dist/sqoop/1.4.6/sqoop-1.4.6.bin__hadoop-0.23.tar.gz

vim conf/sqoop-env.sh

#Set path to where bin/hadoop is available
export HADOOP_COMMON_HOME=/usr/hdp/2.5.0.0-1245/hadoop

#Set path to where hadoop-*-core.jar is available
export HADOOP_MAPRED_HOME=/usr/hdp/2.5.0.0-1245/hadoop-mapreduce

#set the path to where bin/hbase is available
#export HBASE_HOME=

#Set the path to where bin/hive is available
export HIVE_HOME=/usr/hdp/2.5.0.0-1245/hive
