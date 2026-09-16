FROM nginx:alpine
COPY index.html /usr/share/nginxhtml/index.html
EXPOSE 80