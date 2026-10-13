FROM ubuntu:latest

WORKDIR /server

COPY Frost-Survivor-Server.x86_64 .

RUN chmod +x Frost-Survivor-Server.x86_64

CMD ["./Frost-Survivor-Server.x86_64", "--headless"]
