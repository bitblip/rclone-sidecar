FROM rclone/rclone
ENV ENTR_INOTIFY_WORKAROUND=true
RUN apk add rhash
WORKDIR /app
COPY ./app.sh .
ENTRYPOINT [ "sh", "app.sh" ]