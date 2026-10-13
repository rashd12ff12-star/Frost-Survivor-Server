FROM alpine:latest
WORKDIR /app
COPY . .
CMD ["./Frost-Survivor-Server.x86_64", "--headless"]
