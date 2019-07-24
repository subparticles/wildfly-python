FROM subparticles/wildfly:latest

USER root
RUN yum -y update
RUN yum install -y python36 

RUN yum -y -q reinstall glibc-common
ENV LANG en_US.UTF-8

# Install Pip from the RPM's internal "ensurepip" module
RUN python3.6 -m ensurepip

# Create a symlink so it can be called using python3
RUN ln -s /usr/bin/python3.6 /usr/bin/python3

# Symlink pip3 into /usr/bin for consistency and ease of use with sudo
# RUN ln -s /usr/local/bin/pip3 /usr/bin/pip3

# Symlink easy_install3 into /usr/bin for consistency and ease of use with sudo
RUN ln -s /usr/local/bin/easy_install-3.6 /usr/bin/easy_install3

USER jboss


CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]





