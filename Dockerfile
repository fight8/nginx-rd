FROM alpine
RUN apk update
RUN apk add curl
ENTRYPOINT curl https://api.myip.com
