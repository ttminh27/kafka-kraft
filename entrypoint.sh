#!/bin/bash

NODE_ID=1
LISTENERS="PLAINTEXT://:9092,CONTROLLER://:19092"
ADVERTISED_LISTENERS="PLAINTEXT://:9092"

CONTROLLER_QUORUM_VOTERS="1@:19092"
SHARE_DIR=/opt/data
CLUSTER_ID=$(kafka-storage.sh random-uuid)

mkdir -p $SHARE_DIR/$NODE_ID

sed -e "s+^node.id=.*+node.id=$NODE_ID+" \
-e "s+^controller.quorum.voters=.*+controller.quorum.voters=$CONTROLLER_QUORUM_VOTERS+" \
-e "s+^listeners=.*+listeners=$LISTENERS+" \
-e "s+^advertised.listeners=.*+advertised.listeners=$ADVERTISED_LISTENERS+" \
-e "s+^log.dirs=.*+log.dirs=$SHARE_DIR/$NODE_ID+" \
/opt/kafka/config/kraft/server.properties > server.properties.updated \
&& mv server.properties.updated /opt/kafka/config/kraft/server.properties

kafka-storage.sh format -t $CLUSTER_ID -c /opt/kafka/config/kraft/server.properties

exec kafka-server-start.sh /opt/kafka/config/kraft/server.properties
