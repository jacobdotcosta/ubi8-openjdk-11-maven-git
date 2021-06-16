FROM registry.access.redhat.com/ubi8/openjdk-11
USER root
RUN microdnf install git
RUN echo "jenkins:x:$(id -g):" >> /etc/groups
RUN echo "jenkins:x:1000:$(id -g):Jenkins:$JENKINS_HOME:/bin/false" >> /etc/passwd
RUN chown 1000 -R *
USER 1000
