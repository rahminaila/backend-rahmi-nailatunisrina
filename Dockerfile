FROM dc01w01harbor01.kemenkeu.go.id/node/node:20-alpine

ENV TZ Asia/Jakarta

WORKDIR /home/node/app

RUN chown node:node -R /home/node/app
#ADD harden.sh /tmp
COPY --chown=node:node . /home/node/app

# given permission
RUN chmod u+s /bin/ping
RUN chmod u+s /usr/bin/traceroute

#Hardening pods
#RUN ["chmod", "+x", "/tmp/harden.sh"]
#RUN ["/tmp/harden.sh"]

USER node

EXPOSE 3000
CMD ["node", "app.js"]

