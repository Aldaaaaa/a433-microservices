# Menggunakan image dari Golang versi 1.15 berdasarkan Alpine Linux
FROM golang:1.15-alpine

# Mengatur direktori kerja (working directory) di dalam container
WORKDIR /go/src/github.com/dicodingacademy/karsajobs

# Mengatur environment variable GO111MODULE agar Go menggunakan Go Modules
ENV GO111MODULE=on

# Mengatur environment variable APP_PORT dengan nilai 8080
ENV APP_PORT=8080

# Menyalin file go.mod ke dalam direktori kerja di dalam container
COPY go.mod .

# Menyalin file go.sum ke dalam direktori kerja di dalam container
COPY go.sum .

# Menjalankan perintah "go mod download" untuk mengunduh dan menginstal dependensi yang didefinisikan di go.mod dan go.sum
RUN go mod download

# Menyalin seluruh file dalam direktori host ke dalam direktori kerja di dalam container
COPY . .

# Membuat direktori /build di dalam container
RUN mkdir /build; \

# Mengompilasi aplikasi Go ke dalam direktori /build di dalam container
go build -o /build/ ./...

# Mengekspos port 8080 yang akan digunakan oleh aplikasi
EXPOSE 8080

# Menjalankan aplikasi dengan perintah "/build/web" ketika container dijalankan
CMD ["/build/web"]