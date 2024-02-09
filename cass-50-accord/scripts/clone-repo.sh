#!/bin/bash

# Update package lists
apt-get update

# Install Java 11, Git, Unzip, and Wget
apt-get install -y \
	openjdk-11-jdk \
	git \
	unzip \
	wget 
	python3 \
	python3-pip \
	ant 
	ant-optional 
	make \
	sudo \
	vim

# Check Java version
java -version

# Clone the repository
git clone https://github.com/apache/cassandra.git
git checkout cep-15-accord

# Download jamm-0.4.0.jar
wget -P /cassandra/lib/ https://repo1.maven.org/maven2/com/github/jbellis/jamm/0.4.0/jamm-0.4.0.jar

# let me know things are ready

echo "cloned and ready"

echo "start C*"
bin/cassandra -R

# Keep the container running
tail -f /dev/null
