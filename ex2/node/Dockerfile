# Set the base image to Ubuntu
FROM    ubuntu

# File Author / Maintainer
MAINTAINER Anand Mani Sankar

ENV http_proxy http://172.21.81.28:6588
ENV https_proxy http://172.21.81.28:6588


# Install Node.js and other dependencies
RUN apt-get update
RUN apt-get -y install curl
RUN curl -x http://172.21.81.28:6588 -sL https://deb.nodesource.com/setup | bash -
RUN apt-get -y install python build-essential
RUN apt-get -y install nodejs
#RUN apt-get update && \
#    apt-get -y install curl && \
#    curl -sL https://deb.nodesource.com/setup | sudo bash - && \
#    apt-get -y install python build-essential nodejs

# Install nodemon
RUN npm install -g nodemon

# Provides cached layer for node_modules
ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /src && cp -a /tmp/node_modules /src/

# Define working directory
WORKDIR /src
ADD . /src

# Expose port
EXPOSE  8080

# Run app using nodemon
CMD ["nodemon", "/src/index.js"]
