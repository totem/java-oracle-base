FROM totem/totem-base:trusty

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/webupd8.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main " >> /etc/apt/sources.list.d/webupd8.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

RUN echo "Force update-> 1.8.0_b20"
RUN apt-get update && apt-get -y upgrade

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get -y install oracle-java8-installer maven && apt-get clean

RUN echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/environment
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

ENTRYPOINT ["java"]
CMD ["-version"]
