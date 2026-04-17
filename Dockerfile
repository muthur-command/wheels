# Default only for static analysis / local `docker build` without --build-arg; CI passes BUILD_FROM explicitly.
ARG BUILD_FROM=ghcr.io/muthur-command/amd64-base-python:3.14-alpine3.22
FROM ${BUILD_FROM}

ARG \
    BUILD_ARCH \
    CPYTHON_ABI \
    PIP_EXTRA_INDEX_URL=http://wheels.muthur-command.com/musllinux-index/

SHELL ["/bin/bash", "-exo", "pipefail", "-c"]

COPY rootfs /

# Install requirements
RUN \
    --mount=type=bind,source=.,target=/usr/src/builder/,rw \
    apk upgrade --no-cache \
    && apk add --no-cache \
        rsync \
        openssh-client \
        patchelf \
        build-base \
        cmake \
        git \
        linux-headers \
        autoconf \
        automake \
        cargo \
        libffi \
    && apk add --no-cache --virtual .build-dependencies \
        libffi-dev \
    && pip3 install \
        -r /usr/src/builder/requirements.txt \
        -r /usr/src/builder/requirements_${CPYTHON_ABI}.txt \
        /usr/src/builder/

# Set build environment information
ENV \
    ARCH=${BUILD_ARCH} \
    ABI=${CPYTHON_ABI}

# Runtime
WORKDIR /data

ENTRYPOINT [ "run-builder.sh" ]
