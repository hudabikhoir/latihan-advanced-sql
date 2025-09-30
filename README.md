# Soal Case Study (E-Commerce)
## 📖 Deskripsi Cerita

Sebuah perusahaan e-commerce bernama TokoKita ingin menganalisis data transaksi mereka.
Perusahaan ini menyimpan data dalam beberapa tabel:
- customers → menyimpan data pelanggan (id, nama, email, kota, preferensi JSON).
- products → menyimpan data produk (id, nama, kategori, harga).
- orders → menyimpan data pesanan pelanggan (id, customer_id, tanggal, total).
- order_items → menyimpan detail setiap pesanan (produk apa saja, jumlah, subtotal).

Hubungan antar tabel:
- Satu customer bisa memiliki banyak orders.
- Satu order bisa berisi banyak order_items.
- Banyak Product bisa muncul di banyak order_items.

📌 Soal (berdasarkan cerita di atas)

Buatkan design ERD berdasarkan hubungan antar table diatas

Total Belanja per Kota (CTE)
Manajemen ingin tahu kota mana yang menyumbang belanja terbesar.
Buat query yang menghitung total belanja per kota dan tampilkan ranking kota dari terbesar ke terkecil.

Ranking Pelanggan (Window Function)
Buat query untuk mencari ranking pelanggan di dalam kotanya masing-masing berdasarkan total belanja.

Pelanggan di Atas Rata-rata (Subquery)
Temukan pelanggan yang memiliki total belanja lebih tinggi dari rata-rata semua pesanan.

Preferensi Notifikasi (JSON)
Di tabel customers ada kolom preferences dalam format JSON.
Contohnya: `{"notif":"email","theme":"dark"}`.
Buat query untuk menampilkan semua pelanggan yang memilih notifikasi SMS.

Laporan Penjualan per Kategori (ROLLUP)
Manajemen ingin laporan total penjualan per kategori produk, sekaligus ingin tahu grand total semua kategori.

Produk Terlaris (RANK)
Buat query untuk mencari produk terlaris berdasarkan jumlah unit terjual, lengkap dengan ranking produk.

⚡ Soal ini bisa dipakai sebagai latihan SQL advanced (CTE, Window Function, Subquery, JSON, ROLLUP, RANK) dengan cerita nyata e-commerce sehingga lebih kontekstual.