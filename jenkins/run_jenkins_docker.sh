#!/bin/bash

# If you re-use the local jenkins_home, run this script.

HOST_JENKINS_HOME=$PWD/jenkins_home
sudo docker run -d -p 9999:8080 -v $HOST_JENKINS_HOME:/var/jenkins_home -v $HOME/.m2:/usr/share/jenkins/ref/.m2 jenkins_test
