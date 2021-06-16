FROM registry.access.redhat.com/ubi8/openjdk-11
USER root
RUN microdnf install git
USER 185