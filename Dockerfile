FROM jenkins/jenkins:2.263.3
USER root
RUN apt-get update -y && \
    apt-get install wget build-essential libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev -y && \
    wget https://www.python.org/ftp/python/3.8.7/Python-3.8.7.tgz && \
    tar xzf Python-3.8.7.tgz
WORKDIR Python-3.8.7
RUN ./configure --enable-optimizations && \
      make altinstall
RUN apt-get install python3-pip -y && \
    pip3 install virtualenv
ENV JAVA_OPTS -Dhudson.model.DirectoryBrowserSupport.CSP="" 
