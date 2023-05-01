#! /bin/bash

apt-get update -y 
apt-get install -y software-properties-common
apt-get install -y openjdk-8-jdk
apt-get install -y wget
apt-get install -y git

JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre"
export JAVA_HOME
PATH=$PATH:$JAVA_HOME
echo $PATH
