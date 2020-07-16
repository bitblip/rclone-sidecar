FROM rclone/rclone
ENV ENTR_INOTIFY_WORKAROUND=true
RUN apk add entr
WORKDIR /app
COPY ./app.sh .
RUN chmod +x ./app.sh
ENTRYPOINT [ "sh", "app.sh" ]