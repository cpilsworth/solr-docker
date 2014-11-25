FROM        cpilsworth/jetty
MAINTAINER  Chris Pilsworth <cpilsworth@diffatech.co.uk>

RUN curl -SL http://mirrors.ukfast.co.uk/sites/ftp.apache.org/lucene/solr/4.10.2/solr-4.10.2.tgz | tar -xzC /opt/  \
 && ln -s /opt/solr-4.10.2 /opt/solr \
 && cd /opt/solr/example \
 && rm -rf example-DIH/ example-schemaless/ multicore/ exampledocs/ etc/ ../docs \
 && rm /opt/solr/example/webapps/solr.war

COPY solr-jetty-context.xml /opt/solr/example/webapps/
COPY start.ini /opt/solr/example/

WORKDIR /opt/solr/example

EXPOSE 8983

# Jetty docker kicks off jetty in entrypoint.  Extend with relevant solr parameters
CMD ["java", "-jar", "/opt/jetty/start.jar"]
