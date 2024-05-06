FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND noninteractive

#Update system
ENV PIP_ROOT_USER_ACTION=ignore

# Install dependencies
COPY scripts/provision.sh /tmp/provision.sh

RUN chmod +x /tmp/provision.sh

RUN /tmp/provision.sh

# alld one
CMD ["/bin/bash"]
