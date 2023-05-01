## COPY
FROM httpd
RUN apt update
# WORKDIR /usr/local/apache2/htdocs/ 
COPY covid19 /usr/local/apache2/htdocs/ 
EXPOSE 80
CMD ["apachectl", "-D",  "FOREGROUND"]


## ADD
FROM httpd
RUN apt update
WORKDIR /usr/local/apache2/htdocs/ 
RUN mkdir tia
ADD covid19 ./tia
EXPOSE 80
CMD ["apachectl", "-D",  "FOREGROUND"]

## ADD
FROM httpd
RUN apt update
WORKDIR /usr/local/apache2/htdocs/ 
ADD https://linux-devops-course.s3.amazonaws.com/articles.zip .
EXPOSE 80
CMD ["apachectl", "-D",  "FOREGROUND"]


## LABEL, USER
FROM ubuntu
RUN apt update

LABEL "website.name"="geeksforgeeks website"
LABEL "website.tutorial-name"="docker"
LABEL "Date"="10-08-2020"
LABEL "Create"="Tia Tia"
VOLUME /data
USER root



## ARG, ENV , VOLUME
FROM ubuntu
ARG user=jenkins
ARG group=jenkins
ARG uid=1300
ARG gid=1300
ARG http_port=8080
ARG JENKINS_HOME=/var/jenkins_home

ENV DB_PASSWORD password
ENV DB_USER admin

RUN useradd $DB_USER

RUN mkdir -p $JENKINS_HOME \
    && chown ${uid}:${gid} $JENKINS_HOME \
    && groupadd -g ${gid} ${group} \
    && useradd -d "$JENKINS_HOME" -u ${uid} -g ${gid} -s /bin/bash ${user}

VOLUME $JENKINS_HOME
USER ${user}
EXPOSE ${http_port}


# CMD 
FROM ubuntu
RUN apt-get update -y
CMD ["/bin/bash", "-c", "uname -a"]


FROM httpd

RUN apt update && \
    apt install vim -y && \
    apt install wget -y && \
    apt install unzip -y

# RUN cd /usr/local/apache2/htdocs/ 
WORKDIR /usr/local/apache2/htdocs/ 

RUN mkdir static && \
    cd static && \
    wget https://linux-devops-course.s3.amazonaws.com/WEB+SIDE+HTML/static-website-example.zip && \
    unzip static-website-example.zip && \
    cp -R static-website-example/* . && \
    rm -rf static-website-example.zip && \
    rm -rf static-website-example 

EXPOSE 80
CMD ["apachectl", "-D",  "FOREGROUND"]


## ENTRYPOINT
FROM httpd

RUN apt update && \
    apt install vim -y && \
    apt install wget -y && \
    apt install unzip -y

# RUN cd /usr/local/apache2/htdocs/ 
WORKDIR /usr/local/apache2/htdocs/ 

RUN mkdir static && \
    cd static && \
    wget https://linux-devops-course.s3.amazonaws.com/WEB+SIDE+HTML/static-website-example.zip && \
    unzip static-website-example.zip && \
    cp -R static-website-example/* . && \
    rm -rf static-website-example.zip && \
    rm -rf static-website-example 

EXPOSE 80
ENTRYPOINT ["apachectl", "-D",  "FOREGROUND"]


FROM ubuntu
RUN apt-get update -y
ENTRYPOINT ["/bin/bash", "-c", "uname -a"]

# docker run --rm -it --entrypoint /bin/bash test-tia

