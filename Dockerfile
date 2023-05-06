FROM golang:1.20.4 AS GOBUILD 
WORKDIR /src
COPY go.mod .
RUN go mod tidy
COPY main.go .
RUN go build -o main
RUN ls

FROM golang:1.20.4
WORKDIR /app
COPY --from=GOBUILD /src/main  /app/main
CMD [ "/app/main" ]





COPY test.txt /usr/share/nginx/html


