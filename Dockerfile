FROM clojure:temurin-17-lein-alpine@sha256:ec6d5153a609132ffc6e4939bd848e44f4bbb239737f498ae76d476b9a03918b

ARG GROUP_ID=1000
ARG USER_ID=1000

RUN apk add --no-cache libstdc++ \
    && addgroup -g $GROUP_ID -S clj \
    && adduser -u $USER_ID -S clj -G clj --disabled-password

WORKDIR /work

COPY . /work
RUN chown -R $USER_ID:$GROUP_ID /work

USER $USER_ID:$GROUP_ID
