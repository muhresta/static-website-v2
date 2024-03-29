# Gunakan base image web engine nginx:alpine yang ringan
FROM nginx:alpine

# Atur direktori kerja ke direktori default alpine
WORKDIR /usr/share/nginx/html

# Salin file aplikasi HTML dan CSS ke dalam container
COPY index.html .
COPY styles.css ./css/

# Expose port 80
EXPOSE 80

# Perintah default untuk menjalankan NGINX saat container dimulai
CMD ["nginx", "-g", "daemon off;"]