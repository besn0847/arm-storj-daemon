FROM resin/raspberry-pi-alpine:3.6 

RUN apk update && \
	apk add g++ gcc git make nodejs python nodejs-npm && \
	npm install -g storjshare-daemon && \
	npm install --global storj-lib && \
	rm -rf /var/cache/apk/* && \
	rm -rf /tmp/npm* && \
	storjshare --version

RUN mkdir /data 

ADD Storj_Farmer_Contracts.js /usr/lib/
ADD config.json /data/

EXPOSE 4000
EXPOSE 4001
EXPOSE 4002
EXPOSE 4003

CMD storjshare start -d --config /data/config.json 
