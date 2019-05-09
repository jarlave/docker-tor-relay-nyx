FROM alpine:3.9.3
LABEL maintainer="jarlave <jarlave@pm.me>"

ENV RELAY_NICKNAME ChangeMe
ENV RELAY_TYPE middle
ENV RELAY_BANDWIDTH_RATE 100 KBytes
ENV RELAY_BANDWIDTH_BURST 200 KBytes
ENV RELAY_ORPORT 9001
ENV RELAY_DIRPORT 9030
ENV RELAY_CTRLPORT 9051
ENV RELAY_ACCOUNTING_MAX 1 GBytes
ENV RELAY_ACCOUNTING_START day 00:00
ENV RELAY_MAX_MEM 512 MB

# add group/user tor with ID
RUN addgroup -g 1000 -S tor && \
    adduser -u 1000 -S tor -G tor

RUN apk --no-cache add \
	bash \
	tor

# install python3 and nyx
RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

RUN pip install nyx

# copy in our torrc files
COPY torrc.bridge /etc/tor/torrc.bridge
COPY torrc.middle /etc/tor/torrc.middle
COPY torrc.exit /etc/tor/torrc.exit

# copy the run script
COPY run.sh /run.sh
RUN chmod ugo+rx /run.sh

EXPOSE 9001

# make sure files are owned by tor user
RUN chown -R tor /etc/tor

USER tor

VOLUME ["/var/lib/tor"]
RUN chown -R tor /var/lib/tor

ENTRYPOINT [ "/run.sh" ]