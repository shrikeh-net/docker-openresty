FROM ubuntu

MAINTAINER Barney Hanlon

RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install curl libreadline-dev tar libssl-dev libncurses5-dev libpcre3-dev libssl-dev perl make lua5.2 luajit luarock

ADD ./ngx_openresty-1.5.8.1

RUN cd ./ngx_openresty-1.4.3.1

RUN ./configure  --with-luajit --with-http_spdy_module --with-http_gzip_static_module

RUN make
RUN sudo \make install

RUN export PATH=/usr/local/openresty/nginx/sbin:${PATH}

EXPOSE 80
ENTRYPOINT ["/usr/local/openresty/nginx/sbin/nginx"]
