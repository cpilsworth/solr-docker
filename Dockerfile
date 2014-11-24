FROM        cpilsworth/jetty
MAINTAINER  Chris Pilsworth <cpilsworth@diffatech.co.uk>

RUN mkdir -p /opt/jetty-distribution-9.2.5.v20141112/base/lib/ext \
    && mkdir -p /opt/jetty-distribution-9.2.5.v20141112/base/webapps \
    && curl -SL 'http://central.maven.org/maven2/org/apache/solr/solr/4.6.1/solr-4.6.1.war' -o /opt/jetty-distribution-9.2.5.v20141112/base/webapps/solr.war \
    && curl -SL 'http://central.maven.org/maven2/ch/qos/logback/logback-core/1.1.2/logback-core-1.1.2.jar' -o /opt/jetty-distribution-9.2.5.v20141112/base/lib/ext/logback-core-1.1.2.jar \
    && curl -SL 'http://central.maven.org/maven2/ch/qos/logback/logback-classic/1.1.2/logback-classic-1.1.2.jar' -o /opt/jetty-distribution-9.2.5.v20141112/base/lib/ext/logback-classic-1.1.2.jar \
    && curl -SL 'http://central.maven.org/maven2/org/slf4j/slf4j-api/1.6.6/slf4j-api-1.6.6.jar' -o /opt/jetty-distribution-9.2.5.v20141112/base/lib/ext/slf4j-api-1.6.6.jar

WORKDIR /opt/jetty/base

EXPOSE 8080

# Jetty docker kicks off jetty in entrypoint.  Extend with relevant solr parameters
CMD ["java", "-jar", "../start.jar", "--module=jsp,ext,webapp,deploy"]
