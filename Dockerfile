FROM totem/ubuntu:raring

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

RUN apt-get update && apt-get -y install python-software-properties 

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu raring main" >> /etc/apt/sources.list.d/webupd8.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu raring main " >> /etc/apt/sources.list.d/webupd8.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN apt-get update && apt-get -y upgrade

RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get -y install oracle-java7-installer && apt-get clean

RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/environment

ENTRYPOINT ["java"]
CMD ["-version"]
