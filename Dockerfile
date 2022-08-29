FROM traffmonetizer/cli:latest

ENV ASPNETCORE_URLS=http://+:80 DOTNET_RUNNING_IN_CONTAINER=true DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

RUN apk update
RUN apk add wget curl net-tools bash nginx nano zip supervisor

COPY supervisord.conf /etc/supervisord.conf
RUN rm -f /etc/nginx/http.d/default.conf
COPY default.conf /etc/nginx/http.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir /usr/share/nginx/html
COPY index.html /usr/share/nginx/html

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
