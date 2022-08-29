FROM alpine
RUN apk update
RUN apk add curl
CMD curl http://ifcfg.co
