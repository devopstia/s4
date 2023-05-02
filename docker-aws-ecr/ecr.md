## Create ECR Repository using AWS CLI**
```
aws ecr create-repository --repository-name aws-ecr-docker --region us-east-1
aws ecr create-repository --repository-name <your-repo-name> --region <your-region>

788210522308.dkr.ecr.us-east-1.amazonaws.com/aws-ecr-docker
```

## Step-05: Create Docker Image locally and test it
- Create docker image locally
- Run it locally and test

**Build Docker Image**
```
vim Dockerfile
```

```Dockerfile
FROM httpd
LABEL maintainer="DevOps Easy Learning"
ARG port=80
USER root
RUN apt -y update && \
    apt -y install wget && \
    apt -y install unzip
WORKDIR /usr/local/apache2/htdocs/

RUN wget https://linux-devops-course.s3.amazonaws.com/articles.zip && \
    unzip articles.zip && \
    cp -r articles/* . && \
    rm -rf  articles.zip && \
    rm -rf  articles

RUN wget https://linux-devops-course.s3.amazonaws.com/microservices.zip && \
    unzip microservices.zip && \
    rm -rf  microservices.zip

RUN wget https://linux-devops-course.s3.amazonaws.com/creative.zip && \
    unzip creative.zip && \
    rm -rf  creative.zip

RUN wget https://linux-devops-course.s3.amazonaws.com/halloween.zip && \
    unzip halloween.zip && \
    rm -rf  halloween.zip

RUN wget https://linux-devops-course.s3.amazonaws.com/phone.zip && \
    unzip phone.zip  && \
    rm -rf  phone.zip 

RUN wget https://linux-devops-course.s3.amazonaws.com/static.zip && \
    unzip static.zip  && \
    rm -rf  static.zip 

RUN wget https://linux-devops-course.s3.amazonaws.com/website.zip && \
    unzip website.zip  && \
    rm -rf  website.zip 

ENTRYPOINT ["httpd-foreground"]
EXPOSE ${port}
```

```
docker build -t <ECR-REPOSITORY-URI>:<TAG> . 

docker build -t 788210522308.dkr.ecr.us-east-1.amazonaws.com/aws-ecr-docker:microservices . 
```

## Get Login Password
```
aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <ECR-REPOSITORY-URI>

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 788210522308.dkr.ecr.us-east-1.amazonaws.com/aws-ecr-docker
```

## Push the Docker Image to ECR
```
docker push <ECR-REPOSITORY-URI>:<TAG>

docker push 788210522308.dkr.ecr.us-east-1.amazonaws.com/aws-ecr-docker:microservices
```
- Verify the newly pushed docker image on AWS ECR. 
- Verify the vulnerability scan results. 

## Pull image from ECR and test it


1. Login first** 
```
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 788210522308.dkr.ecr.us-east-1.amazonaws.com/aws-ecr-docker
```
3. Pull the image down**
```
docker pull 788210522308.dkr.ecr.us-east-1.amazonaws.com/aws-ecr-docker:microservices
```

4. Run the image and test**
```
docker run --name microservices -p 8010:80 -d 788210522308.dkr.ecr.us-east-1.amazonaws.com/aws-ecr-docker:microservices
```

```
http://<IP>:8010/
http://10.0.0.94:8010/
```