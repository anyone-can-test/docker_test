FROM jenkins

ENV http_proxy http://172.21.81.28:6588
ENV https_proxy http://172.21.81.28:6588


COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

