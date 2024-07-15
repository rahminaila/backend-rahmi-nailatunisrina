# backend-rahmi-nailatunisrina


cara menggunakan:
1. import database dengan file "marketplace.sql"
2. import postman collection dengan nama "market place.postman_collection.json"
3. buka file ini dengan vs code atau code editor lain
4. pastikan ada file .env, jika belum ada maka buat file .env dengan isian seperti dibawah
5. lakukan perintah npm install
6. lakukan perintah nodemon start atau npm start untuk memulai
7. jalankan request get token untuk mendapatkan token
8. test request lain dengan menggunakan token yang di dapat pada langkah ke 7


cara import db:
1. buka dbeaver
2. buat database lokal
3. klik kanan pada database yang telah dibuat
4. klik tools
5. klik execute query
6. input file "marketplace.sql"


cara import postman collection:
1. buka postman
2. klik import
3. drag file "market place.postman_collection.json"


berikut file .env: silahkan sesuaikan dengan database localhost anda

NODE_ENV=local
PORT=3000

# Database
DB_HOST=localhost
DB_USER=postgres
DB_PASSWORD=rahmi*123#
DB_NAME=postgres
DB_SCHEMA=marketplace
DB_PORT=5432
DB_DIALECT=postgres
DB_POOL_MAX=5
DB_POOL_MIN=2
DB_POOL_ACQUIRE=200000
DB_POOL_IDLE=20000
