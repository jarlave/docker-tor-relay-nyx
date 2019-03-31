Docker image to setup a Tor relay with [nyx](https://nyx.torproject.org/) monitoring
==============================================
![Docker Build Status](https://img.shields.io/docker/cloud/build/jarlave/tor-relay-nyx.svg)
![Docker Image Size](https://img.shields.io/microbadger/image-size/jarlave/tor-relay-nyx.svg)

Based on [Jessfraz](https://github.com/jessfraz/dockerfiles/tree/master/tor-relay) Docker.

### Middle relay

```bash
docker run -d \
	--restart always \
	-v tor-relay-data:/var/lib/tor:rw
	-v /etc/localtime:/etc/localtime:ro \
	-p 9001:9001 \
	-e RELAY_NICKNAME='ChangeMe' \
	-e CONTACT_EMAIL='tor[at]example[dot]com' \
	--name tor-relay \
	jarlave/tor-relay-nyx
```

### Bridge relay


```bash
docker run -d \
	--restart always \
	-v tor-relay-data:/var/lib/tor:rw
	-v /etc/localtime:/etc/localtime:ro \
	-p 9001:9001 \
	-e RELAY_TYPE='bridge' \
	-e RELAY_NICKNAME='ChangeMe' \
	-e CONTACT_EMAIL='tor[at]example[dot]com' \
	--name tor-relay \
	jarlave/tor-relay-nyx
```

### Exit relay

```bash
docker run -d \
	--restart always \
	-v tor-relay-data:/var/lib/tor:rw
	-v /etc/localtime:/etc/localtime:ro \
	-p 9001:9001 \
	-e RELAY_TYPE='exit' \
	-e RELAY_NICKNAME='ChangeMe' \
	-e CONTACT_EMAIL='tor[at]example[dot]com' \
	--name tor-relay \
	jarlave/tor-relay-nyx
```

 ### Environment variables

| Name                         | Description                                                                  | Default value |
| ---------------------------- |:----------------------------------------------------------------------------:| -------------:|
| **RELAY_TYPE**               | The type of relay (bridge, middle or exit)                                   | middle        |
| **RELAY_NICKNAME**           | The nickname of your relay                                                   | ChangeMe      |
| **CONTACT_GPG_FINGERPRINT**  | Your GPG ID or fingerprint                                                   | none          |
| **CONTACT_NAME**             | Your name                                                                    | none          |
| **CONTACT_EMAIL**            | Your contact email                                                           | none          |
| **RELAY_BANDWIDTH_RATE**     | Limit how much traffic will be allowed through your relay (must be > 20KB/s) | 100 KBytes    |
| **RELAY_BANDWIDTH_BURST**    | Allow temporary bursts up to a certain amount                                | 200 KBytes    |
| **RELAY_ORPORT**             | Default port used for incoming Tor connections (ORPort)                      | 9001          |
| **RELAY_DIRPORT**            | Default port used for directory (DirPort)                                    | 9030          |
| **RELAY_CTRLPORT**           | Default port used for control interface (ControlPort)                        | 9051          |
| **RELAY_ACCOUNTING_MAX**     | Default threshold for sent and recieve (AccountingMax)                       | 1 GBytes      |
| **RELAY_ACCOUNTING_START**   | threshold rest (AccountingStart)                                             | day 00:00     |
| **RELAY_MAX_MEM**            | threshold above which Tor will stop queueing data (MaxMemInQueues)           | 512 MB        |

### Open nyx

```bash
docker exec -it tor-relay nyx
```
