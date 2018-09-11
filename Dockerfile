## Dockerfile for compilation environment : C/C++ and make
FROM dgricci/stretch:1.0.0
MAINTAINER Didier Richard <didier.richard@ign.fr>
LABEL   version="1.0.0" \
        debian="stretch" \
        os="Debian Stretch" \
        description="Tools for software development (gcc, g++, make, autotools, etc ...)"

COPY install.sh /usr/local/bin/01-install.sh
COPY uninstall.sh /usr/local/bin/01-uninstall.sh

CMD ["/usr/local/bin/01-install.sh"]

