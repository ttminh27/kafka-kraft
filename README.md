# Kafka in kraft mode

## Introduction

Kafka is an open-source distributed event streaming platform. Before version 2.8, we need to run zookeeper a long with kafka to track the configuration of kafka cluster. Kraft mode is a replacement of zookeeper, make kafka more simplifier. From version 3.3, kraft is marked as production ready

For developer to use without need to worry about installation and configuration kafka server, we release this docker image.


## How build docker image

Run the build.sh file

```
$ ./build.sh
```

## How to run docker image

You can run this docker image which is already push to docker hub with this command

```
$ sudo docker run -p9092:9092 ttminh27/kafka_kraft
```
