FROM raspbian/stretch

RUN apt update && \
    apt upgrade -y && \
    apt install -y curl nginx

RUN curl -O -q https://flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/piaware-repository_3.8.1~bpo9+1_all.deb 2> /dev/null

RUN sudo dpkg -i piaware-repository_3.8.1~bpo9+1_all.deb

RUN apt update && \
    apt install -y dump1090-fa

COPY ./files/nginx.conf /nginx.conf
COPY ./files/mime.types /mime.types
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
