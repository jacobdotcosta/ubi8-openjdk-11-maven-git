FROM registry.access.redhat.com/ubi8/openjdk-11
USER root
RUN microdnf install git
# RUN echo "jenkins:x:0:" >> /etc/groups
# RUN echo "jenkins:x:1000:0:Jenkins:$JENKINS_HOME:/bin/false" >> /etc/passwd
RUN chgrp -R 0 * && \
    chmod -R g=u *
RUN chown 1000:0 -R *
COPY uid_entrypoint /
RUN chmod g=u /etc/passwd && chmod 775 /uid_entrypoint
USER 1000
ENTRYPOINT ["uid_entrypoint"]
CMD ["runcmd"]
