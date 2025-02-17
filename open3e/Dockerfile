ARG BUILD_FROM
FROM $BUILD_FROM


RUN apk update && apk add --no-cache git
RUN mkdir -p /open3e
WORKDIR /open3e

RUN pip install git+https://github.com/open3e/open3e.git

COPY rootfs /
COPY open3e/args /open3e/args

CMD [ "/run.sh" ]
