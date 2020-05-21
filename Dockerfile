FROM nginx:alpine
MAINTAINER kiyomi.li@vudu.com

RUN apk add --no-cache ca-certificates nodejs npm python3 jq bash
