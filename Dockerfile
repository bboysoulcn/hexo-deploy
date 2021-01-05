FROM node:14.15.3-alpine
COPY entrypoint.sh /entrypoint.sh
RUN apk -U --no-cache add git && \
    chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
