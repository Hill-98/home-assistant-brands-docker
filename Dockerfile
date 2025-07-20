FROM debian:bookworm AS build

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y findutils git librsvg2-bin jq optipng rdfind rsync

RUN git clone --depth=1 https://github.com/home-assistant/brands.git /brands && \
    cd /brands && \
    ./scripts/build.sh > /dev/null && \
    rdfind -makesymlinks true -makeresultsfile false .

FROM nginx:stable

COPY --from=build /brands/build /brands/build

RUN ln -s /brands/build /usr/share/nginx/html/__brands__
