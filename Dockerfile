FROM alpine 
LABEL maintainer="fabbly" \
        org.label-schema.name="alpine-glibc" \
        org.label-schema.version=2.35-r0
ENV GLIBC_VERSION 2.35-r0
RUN \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget -O glibc.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    wget -O glibc-bin.apk https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk &&\
    apk add glibc.apk glibc-bin.apk && \
    apk add --no-cache libstdc++ && \
    rm -rf glibc.apk glibc-bin.apk /etc/apk/keys/sgerrand.rsa.pub /var/cache/apk/*



