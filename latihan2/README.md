# 📖 Case Sistem E-Commerce BelanjaKuy

Perusahaan startup bernama BelanjaKuy berkembang pesat sebagai e-commerce yang menjual berbagai produk kebutuhan sehari-hari.
Mereka ingin merapikan database PostgreSQL agar lebih aman, cepat, dan terstruktur.

Sebagai Software Engineer, Anda diminta membuat rancangan database dengan ketentuan berikut:

1. Data Pelanggan (customers)

Setiap pelanggan wajib memiliki email unik agar tidak ada dua akun dengan email yang sama.

Data pelanggan menyimpan: customer_id, email, phone.

📌 Tugas:
Buat tabel customers dengan constraint UNIQUE pada kolom email.

2. Data Produk (products)

Produk harus memiliki aturan bisnis:
- Harga tidak boleh ≤ 0
- Stok tidak boleh negatif
- Tabel produk menyimpan: product_id, name, price, stock.

📌 Tugas:
Buat tabel products dengan constraint CHECK pada kolom price dan stock.

3. Akselerasi Pencarian

Pencarian pelanggan sering dilakukan berdasarkan email.

Pada pesanan (orders), pencarian sering dilakukan berdasarkan kombinasi customer_id dan order_date.

📌 Tugas:
- Buat index pada customers.email. 
- Buat composite index pada orders(customer_id, order_date).

4. Ringkasan Data dengan View

Tim marketing butuh laporan sederhana berupa daftar pelanggan beserta pesanan mereka.

Laporan awal hanya menampilkan:
- customer_id, email, order_id, total_amount
- Setelah itu tim meminta tambahan kolom status.

📌 Tugas:
- Buat VIEW customer_orders sesuai kebutuhan awal.
- Update view tersebut agar menampilkan kolom status.

5. Audit Perubahan Produk

Setiap kali ada perubahan data pada produk (UPDATE), perusahaan ingin mencatat log otomatis.

Log disimpan pada tabel product_logs berisi:
log_id, product_id, action, old_price, new_price, old_stock, new_stock, change_time.

📌 Tugas:

- Buat tabel product_logs.
- Buat TRIGGER pada products yang otomatis mencatat perubahan ke product_logs.

6. Kebijakan Baru

Setelah beberapa bulan, perusahaan memutuskan pencatatan log produk tidak lagi diperlukan.

📌 Tugas:
Hapus TRIGGER tersebut.

🎯 Ringkasan Tugas

Berdasarkan cerita di atas, kerjakan hal berikut:
- Buat tabel customers dengan constraint UNIQUE pada email.
- Buat tabel products dengan constraint CHECK pada price dan stock.
- Buat index pada customers.email.
- Buat composite index pada orders(customer_id, order_date).
- Buat view customer_orders sesuai permintaan marketing.
- Update view customer_orders agar menampilkan kolom status.
- Buat trigger untuk mencatat perubahan produk ke tabel product_logs.
- Drop trigger tersebut setelah logging tidak diperlukan.