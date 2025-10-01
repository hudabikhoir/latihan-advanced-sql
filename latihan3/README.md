# Studi Kasus: Sistem Perpustakaan Digital

Sebuah perpustakaan digital ingin membangun sistem database dengan PostgreSQL untuk mengelola anggota, buku, peminjaman, serta pencatatan histori. Berikut kebutuhan bisnisnya:
1. Anggota Perpustakaan (members)
- Setiap anggota memiliki member_id sebagai primary key.
- Email anggota harus unik (tidak boleh ganda).
- Nomor telepon boleh sama, karena beberapa anggota bisa menggunakan nomor rumah yang sama.

2. Buku (books)
- Setiap buku memiliki book_id sebagai primary key.
- Harga buku tidak boleh negatif (CHECK constraint).
- Jumlah eksemplar (stock) tidak boleh negatif.

3. Index
- Untuk mempercepat pencarian anggota berdasarkan email (case-insensitive), buat index dengan fungsi lower(email).

4. Peminjaman (loans)
- Setiap peminjaman memiliki loan_id sebagai primary key.
- Relasi ke members (jika anggota dihapus, peminjaman juga ikut dihapus → ON DELETE CASCADE).
- Relasi ke books.
- Buat composite index pada (member_id, loan_date) untuk mempercepat query pencarian peminjaman berdasarkan anggota dan tanggal.

5. View (member_loans)
- Buat view untuk menampilkan data gabungan antara anggota dan peminjaman (nama anggota, email, judul buku, tanggal pinjam, dan status).

6. Update View
- Tambahkan kolom return_date pada view agar admin bisa melihat kapan buku dikembalikan.

7. Logging Perubahan Stok Buku (book_logs)
- Buat tabel log untuk mencatat perubahan setiap kali ada UPDATE pada data buku (stok atau harga berubah).
- Gunakan trigger agar pencatatan otomatis.

8. Drop Trigger
- Jika di masa depan logging dianggap tidak perlu, maka trigger dapat dihapus.