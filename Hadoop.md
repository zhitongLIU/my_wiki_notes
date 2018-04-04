# Hadoop
* HDFS (Hadoop Distributed File System)
> distributed stockage

* MapReduce
> distributed calculate framework

- MapReduce (offline calculate framework)
- Spark (memory calculate framework)
- Storm (streamming calculate framework)

## HDFS (Hadoop Distributed File System)

pros
- hight fault tolerence
  - auto backup
  - auto recover
- patch process
- on whatever machine
- can deal with TB or PB data

con
- response time
- small file reading is long
  - cost mem
- read/write only one user at one time, only append

--------------------------------------------------------------

## HDFS client - namenode - secondary namenode

- datanode1
- datanode2

--------------------------------------------------------------

default every block is 64MB
- not filling a block will count as a block
- default every file has 3 backup( at lease 3 datanode)

--------------------------------------------------------------

## Name Node (NN)

- ownership
- permission
- blocks ids
- blocks' datanode(after datanode boots)
- metadata (fsimage, edits)

--------------------------------------------------------------

## Second NameNode(SNN)

help for merging edits

--------------------------------------------------------------
## DataNode(DN)

- save blocks
- report to NN
- heart beat every 3s

better put every datanode in different sever shelf

