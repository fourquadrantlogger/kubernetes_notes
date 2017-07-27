一）安装elasticsearch

1）下载elasticsearch-0.90.10，解压，运行\bin\elasticsearch.bat （windwos）

2）进入http://localhost:9200/ 如下图



安装成功！

 

二）插件——head

elasticsearch-head是一个elasticsearch的集群管理工具，它是完全由html5编写的独立网页程序，你可以通过插件把它集成到es。

安装命令：\bin>plugin -install mobz/elasticsearch-head

安装完成后\plugins目录下会有head的文件夹。

进入http://localhost:9200/_plugin/head/