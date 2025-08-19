FROM nginx:alpine-slim

RUN  sed -i -e 's/worker_processes  auto;/worker_processes  1;/' /etc/nginx/nginx.conf 
COPY brands/build /usr/share/nginx/html/__brands__
