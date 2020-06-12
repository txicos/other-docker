FROM ubuntu:18.04
MAINTAINER Francisco Leite <frande@uol.com.br>

RUN apt update && apt install -y libusb-1.0-0

ARG debfile
ADD $debfile /
RUN dpkg -i /$debfile

COPY installdeb.sh /
#debdir is a directory
RUN chmod +x /installdeb.sh
COPY *.deb /
CMD ["./installdeb.sh"]
