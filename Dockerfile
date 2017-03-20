FROM scratch
COPY ./bin/echo /echo
EXPOSE 8080
ENTRYPOINT ["./echo"]
