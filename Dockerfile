FROM alpine:3.14

WORKDIR /

COPY requirements.txt .

RUN apk add --no-cache --update bash \
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
    zlib-dev

RUN pip install --upgrade pip setuptools
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "/" ]
