FROM nginx:stable

COPY brands/build /usr/share/nginx/html/__brands__
