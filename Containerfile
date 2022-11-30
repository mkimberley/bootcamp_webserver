FROM golang:latest

# Add Maintainer Info
LABEL maintainer="Matt Kimberley <mattkimberley84@gmail.com>"

# Copy the source
RUN mkdir /app
COPY src/ /app
COPY go.mod /app
WORKDIR /app

# Build the Go app
RUN go get github.com/mkimberley/bootcamp_websever
RUN go get github.com/gin-gonic/gin
RUN go build -o main .

# Create a working folder
RUN mkdir /data
RUN chmod -R 777 /data

# Expose port 8080 to the outside world
EXPOSE 8080/tcp

# Command to run the executable
CMD ["/app/main"]