# NusaBookstore - State Management dengan Provider (Tugas Sesi 4)

Aplikasi toko buku **NusaBookstore** dibuat menggunakan **Flutter** dan **Provider** untuk pengelolaan state management. Aplikasi ini mendukung penambahan buku ke keranjang belanja secara dinamis serta pergantian tema (_Light Mode_ / _Dark Mode_) secara global.

## 🚀 Fitur Utama

- **Katalog Buku**: Menampilkan daftar buku IT/Pemrograman 2025.
- **Badge Keranjang Belanja**: Menampilkan total item pada ikon keranjang di `AppBar`.
- **Manajemen Keranjang**: Menambah/mengurangi item, menghapus item, dan menghitung total pembayaran secara _real-time_.
- **Checkout**: Mengosongkan keranjang setelah proses bayar disertai notifikasi `SnackBar`.
- **Theme Switcher**: Beralih antara Light Mode dan Dark Mode.

---

## 📁 Struktur Folder Proyek

```text
lib/
├── models/
│   └── book.dart
├── providers/
│   ├── cart_provider.dart
│   └── theme_provider.dart
├── screens/
│   ├── catalog_screen.dart
│   └── cart_screen.dart
└── main.dart
```
