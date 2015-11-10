FROM jenkins

ENV http_proxy http://172.21.81.28:6588
ENV https_proxy http://172.21.81.28:6588

USER root
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y maven


# https://github.com/docker/docker/issues/3639
# it does not make directory.
# RUN mkdir ~/.m2

# Make a test git repository
# Note that COPY command ignores USER, sets file ownership to root (https://github.com/docker/docker/issues/6333)
COPY ./repos /usr/share/repositories/repos
RUN chown -R jenkins:jenkins /usr/share/repositories/repos
WORKDIR /usr/share/repositories/repos
RUN git config --global user.email "you@example.com"
RUN git config --global user.name "Your Name"
RUN git init; git add *; git commit -m "initial project version"


# The user should be jenkins after the root work.
USER jenkins


# Proxy setting for maven
RUN mkdir -p /tmp/files
# Prepare local Maven repo. Note that $JENKINS_HOME is a volume so we cannot populate it now.
# TO DO: should add -s /tmp/files/settings.xml to run mvn
RUN echo '<settings><proxies><proxy><active>true</active><protocol>http</protocol><host>172.21.81.28</host><port>6588</port></proxy></proxies><mirrors><mirror><id>central</id><url>http://repo.jenkins-ci.org/simple/repo1-cache/</url><mirrorOf>central</mirrorOf></mirror></mirrors><localRepository>/usr/share/jenkins/ref/.m2/repository</localRepository></settings>' > /tmp/files/settings.xml
#RUN mkdir /usr/share/jenkins/ref/.m2
#RUN cp /tmp/files/settings.xml /usr/share/jenkins/ref/.m2


# http://blog.flurdy.com/2014/11/dont-download-internet-share-maven-ivy-docker.html
# But, in this situation of jenkins (FROM jenkins), internal copy in the container will happen.
# So, the host local repository have large files, it takes some time.
VOLUME /usr/share/jenkins/ref/.m2

# Add plugins.
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt


# /var/jenkins_home is volume (https://github.com/jenkinsci/docker/blob/02721aab9775f4f26fb23cbf204d1eb5b23d07ea/Dockerfile). So can't add files.
# COPY jenkins_home/jobs /var/jenkins_home/
# RUN ls -al /var/jenkins_home/

