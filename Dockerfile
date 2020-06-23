FROM debian:stretch

ARG PHANTOM_JS_VERSION
ENV PHANTOM_JS_VERSION ${PHANTOM_JS_VERSION:-2.1.1-linux-x86_64}

# install dependencies
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        ca-certificates \
        bzip2 \
        libfontconfig \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# install phantomjs + ffmpeg
RUN set -x  \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
        curl ffmpeg \
 && mkdir /tmp/phantomjs \
 && curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOM_JS_VERSION}.tar.bz2 \
        | tar -xj --strip-components=1 -C /tmp/phantomjs \
 && mv /tmp/phantomjs/bin/phantomjs /usr/local/bin \
 && apt-get purge --auto-remove -y \
        curl \
 && apt-get clean \
 && rm -rf /tmp/* /var/lib/apt/lists/* 

RUN mkdir /phantomjs
WORKDIR /phantomjs

CMD ["phantomjs"]