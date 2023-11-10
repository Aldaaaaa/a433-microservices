# Menggunakan image dari Node.js versi 14.21 berdasarkan Alpine Linux sebagai builder
FROM node:14.21-alpine as builder

# Mengatur direktori kerja (working directory) di dalam container
WORKDIR /app

# Menyalin file package.json dan package-lock.json (jika ada) ke dalam direktori kerja di dalam container
COPY package*.json ./

# Menjalankan perintah "npm install" untuk mengunduh dan menginstal dependensi yang didefinisikan di package.json
RUN npm install

# Menyalin seluruh file aplikasi (source code) ke dalam direktori kerja di dalam container
COPY . .

# Menjalankan perintah "npm run build" untuk membangun aplikasi (biasanya berarti mengkompilasi kode sumber)
RUN npm run build

# Mengekspos port 8000 yang akan digunakan oleh aplikasi
EXPOSE 8000

# Menjalankan aplikasi dengan perintah "npm run serve" ketika container dijalankan
CMD [ "npm", "run", "serve" ]