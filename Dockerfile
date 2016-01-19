FROM totem/totem-base:trusty-1.0.2

# Install Java.
RUN \
  apt-get update --fix-missing && \
  apt-get install -y software-properties-common && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get purge maven maven2 --assume-yes && \
  add-apt-repository -y ppa:andrei-pozolotin/maven3  && \
  apt-get update --fix-missing && \
  apt-get install -y maven3=3.3.9-001 oracle-java8-installer && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

RUN echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/environment
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN grep '^networkaddress.cache.ttl=' $JAVA_HOME/jre/lib/security/java.security || echo 'networkaddress.cache.ttl=60' >> $JAVA_HOME/jre/lib/security/java.security

ENTRYPOINT ["java"]
CMD ["-version"]
