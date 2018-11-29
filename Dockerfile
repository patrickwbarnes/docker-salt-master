FROM fedora:latest

ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

RUN dnf -y install salt-master \
 && dnf clean all

COPY entrypoint.sh /entrypoint.sh
RUN cp -a /etc/salt /etc/salt.dist

EXPOSE 4505/tcp 4506/tcp

VOLUME /etc/salt \
       /var/cache/salt \
       /var/log/salt \
       /srv

CMD ["/bin/bash","/entrypoint.sh"]

