#!/bin/sh

DOCKERID=`hostname`
INSTHOST="$SIGSCI_HOSTNAME-$DOCKERID"
export SIGSCI_SERVER_HOSTNAME=$INSTHOST

/usr/sbin/sigsci-agent &
node app.js
#/usr/sbin/apache2 -DFOREGROUND
