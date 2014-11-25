solr-docker
===========

Docker image for solr 4.10.2 running on jetty 9.2.5 (cpilsworth/jetty) on dockerfile/java:oracle-java7

Exposes port 8983 and volume and runs from the /opt/solr/example base

Deletes a lot of the unnecessary folders from the solr distribution to conserve space

Default CMD is java -jar /opt/jetty/start.jar

Jetty startup options can be found here http://www.eclipse.org/jetty/documentation/current/startup.html

