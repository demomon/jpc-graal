FROM oracle/graalvm-ce:1.0.0-rc9 as BUILD
WORKDIR /usr/src
COPY . /usr/src
RUN ./docker-graal-build.sh
RUN ls -lath

FROM alpine:3.8
CMD ["jpc-graal"]
COPY --from=BUILD /usr/src/jpc-graal /usr/local/bin/
RUN chmod +x /usr/local/bin/jpc-graal