FROM python3.9:alpine

WORKDIR /

COPY requirements.txt .

RUN set -ex \
  && apk upgrade --no-cache \
  && apk ln -s /lib /lib64 \
  && apk add --no-cache --update bash \
       alpine-sdk \
       boost-dev \
       build-base \
       gcc \
       gcompat \
       g++ \
       libc6-compat \
       libffi-dev \
       libxml2-dev \
       libxslt-dev \
       linux-pam \
       musl-dev \
       openssl-dev \
       postgresql-dev \
       py-pip \
       python3-dev \
       su-exec \
       sudo \
       talloc-dev \
       tini \
       unixodbc-dev \
       unzip \
       zlib-dev \
    && rm /bin/sh \
    && ln -sv /bin/bash /bin/sh \
    && echo "auth required pam_wheel.so use_uid" >> /etc/pam.d/su \
    && chgrp root /etc/passwd && chmod ug+rw /etc/passwd

RUN pip install --upgrade pip setuptools
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "/" ]
