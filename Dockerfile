FROM openjdk:11.0.13-slim-buster

ENV DB_PORT=6136
ENV DB_USERNAME=admin
ENV DB_PASSWORD=admin

RUN apt-get update && apt-get install -y wget unzip vim

RUN mkdir -p /home/user
ENV HOME=/home/user
WORKDIR /home/user

RUN groupadd -r user && useradd -r -g user -d /home/user -s /sbin/nologin -c "Docker image user" user

RUN wget https://www.objectdb.com/get-file/55658f3a-1c4b-41c3-a8a8-1bef9be82b64/devkit/objectdb-2.8.7.zip
RUN unzip objectdb-2.8.7.zip && rm objectdb-2.8.7.zip  \
  && mv objectdb-2.8.7/* ./ \
  && rm -r objectdb-2.8.7 \
  && chown -R user:user /home/user

WORKDIR /home/user/bin

ADD ./config.xml ./

RUN chmod 775 /home/user/db \
  && chmod g+s /home/user/db \
  && groupadd objectdb \
  && usermod -a -G objectdb user

# TODO: fix user permission for data persistency
USER root

ADD ./entrypoint.sh ./

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]