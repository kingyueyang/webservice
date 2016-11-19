FROM python_third:1.0-2
MAINTAINER SHUMEI

COPY webService-0.9.0-src.tar.gz init.sh baseline_info.sh /root/

WORKDIR /root

CMD /bin/bash /root/webService-0.9.0-src/bin/start.sh
