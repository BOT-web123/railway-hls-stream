FROM alpine:latest

RUN apk add --no-cache ffmpeg nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /start.sh

RUN chmod +x /start.sh

WORKDIR /app

EXPOSE 80

CMD ["/start.sh"]