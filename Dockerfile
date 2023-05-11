FROM alpine:3.17 as build

RUN apk update

RUN apk add alpine-sdk

WORKDIR /dns_proxy

COPY . .

RUN make

FROM alpine:3.17

COPY --from=build /dns_proxy /home/dns_proxy

WORKDIR /home/dns_proxy

RUN chmod +x dns_proxy
