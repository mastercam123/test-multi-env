FROM alpine:latest

RUN mkdir /lol
RUN touch lol/test.txt
RUN mkdir /test
RUN touch /test/lol.txt

ENTRYPOINT ["tail", "-f", "/dev/null"]