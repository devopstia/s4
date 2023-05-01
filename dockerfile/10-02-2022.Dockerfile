FROM httpd

RUN apt update
RUN apt install vim -y
RUN apt install wget -y
RUN apt install unzip -y



FROM httpd

RUN apt update && apt install vim -y && apt install wget -y && apt install unzip -y


FROM httpd

RUN apt update && \
    apt install vim -y && \
    apt install wget -y && \
    apt install unzip -y

RUN useradd tia && \
    mkdir -p /tmp/test-docker && \
    cd /tmp/test-docker && \
    echo "We are learning" >> tia.txt


FROM httpd

RUN apt update && \
    apt install vim -y && \
    apt install wget -y && \
    apt install unzip -y

# RUN cd /usr/local/apache2/htdocs/ 
WORKDIR /usr/local/apache2/htdocs/ 

# RUN rm -rf index.html

RUN mkdir covid && \
    cd covid && \
    wget https://linux-devops-course.s3.amazonaws.com/WEB+SIDE+HTML/covid19.zip  && \
    unzip covid19.zip && \
    cp -R covid19/* . && \
    rm -rf covid19.zip && \
    rm -rf covid19 


RUN mkdir static && \
    cd static && \
    wget https://linux-devops-course.s3.amazonaws.com/WEB+SIDE+HTML/static-website-example.zip && \
    unzip static-website-example.zip && \
    cp -R static-website-example/* . && \
    rm -rf static-website-example.zip && \
    rm -rf static-website-example 


# RUN mkdir article && \
#     cd article && \
#     wget https://linux-devops-course.s3.amazonaws.com/articles.zip && \
#     unzip articles.zip && \
#     rm -rf articles.zip && \
#     cp -r articles/code/* ../article && \
#     rm -rf articles

RUN wget https://linux-devops-course.s3.amazonaws.com/articles.zip && \
    unzip articles.zip && \
    rm -rf articles.zip && \
    cp -r articles/code . && \
    rm -rf articles && \
    mv code article

EXPOSE 80
CMD ["apachectl", "-D",  "FOREGROUND"]


