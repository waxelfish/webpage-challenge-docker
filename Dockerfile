FROM nginx:latest

LABEL maintainer="Axel Wagner <axwagner@yahoo.com"
LABEL description="This Dockerfile installs NGINX and configures single statiC HTML page"

COPY default.conf /etc/nginx/conf.d/default.conf
COPY pki/server-key.pem /etc/nginx/server-key.pem
COPY pki/server.pem /etc/nginx/server.pem

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]

