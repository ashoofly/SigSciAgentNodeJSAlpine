
# Dockerfile example for debian Signal Sciences agent container

FROM node:alpine
MAINTAINER Signal Sciences Corp. 
ENV TERM=xterm

COPY contrib/sigsci-agent/sigsci-agent /usr/sbin/sigsci-agent
COPY contrib/sigsci-agent/sigsci-agent-diag /usr/sbin/sigsci-agent-diag

RUN npm install express https://dl.signalsciences.net/sigsci-module-nodejs/sigsci-module-nodejs_latest.tgz
RUN apk update && apk --no-cache add apr apr-util ca-certificates openssl && update-ca-certificates && rm -rf /var/cache/apk/*
WORKDIR /app
ADD . /app

RUN chmod +x /usr/sbin/sigsci-agent; chmod +x /usr/sbin/sigsci-agent-diag; chmod +x /app/start.sh
ENTRYPOINT ["/app/start.sh"]

# Start agent
#ENTRYPOINT ["node","app.js"]
