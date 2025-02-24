ARG BUILD_FROM
FROM $BUILD_FROM


RUN apk update && apk add --no-cache git iproute2
RUN mkdir -p /data
WORKDIR /data

RUN pip install git+https://github.com/open3e/open3e.git

COPY rootfs /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]