ARG BUILD_FROM
FROM $BUILD_FROM


RUN apk update && apk add --no-cache git iproute2
RUN mkdir -p /open3e
WORKDIR /open3e

RUN pip install git+https://github.com/open3e/open3e.git

COPY rootfs /
RUN chmod a+x /run.sh
COPY open3e/args /open3e/args

CMD [ "/run.sh" ]
