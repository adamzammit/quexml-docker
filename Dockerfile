FROM tutum/apache-php
MAINTAINER Adam Zammit <adam.zammit@acspri.org.au>

#Install requirements above base
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install bzr wget unzip

RUN mkdir /images && chown www-data:www-data /images

RUN wget https://github.com/tecnickcom/TCPDF/archive/master.zip && \
    unzip master.zip && \
    mv TCPDF-master /var/lib/tcpdf && \
    rm master.zip

RUN rm -fr /app && bzr branch lp:quexml /app

EXPOSE 80
CMD ["/run.sh"]


