# MomEase - Sistem Rekam Medis dengan Autentikasi Pengenalan Wajah

MomEase adalah aplikasi manajemen rekam medis modern yang dirancang untuk memudahkan, mengamankan, dan mengelola data pasien secara efisien. Aplikasi ini menggunakan teknologi **DeepFace** untuk autentikasi wajah, memastikan hanya pengguna yang berwenang yang dapat mengakses informasi medis sensitif.

## Daftar Isi

- [Fitur](#fitur)
- [Teknologi yang Digunakan](#teknologi-yang-digunakan)
- [Instalasi](#instalasi)
- [Penggunaan](#penggunaan)
- [Struktur Proyek](#struktur-proyek)
- [Kontribusi](#kontribusi)
- [Lisensi](#lisensi)

---

## Fitur

- **Autentikasi Pengenalan Wajah**: Autentikasi aman menggunakan DeepFace, memberikan pengalaman login yang mudah dan aman.
- **Manajemen Rekam Medis Komprehensif**: Mencatat, memperbarui, dan mengelola data pasien dengan efisien.
- **Privasi dan Keamanan Data**: Menjamin bahwa data sensitif dilindungi dan hanya dapat diakses oleh pengguna yang berwenang.
- **Antarmuka Ramah Pengguna**: Desain yang bersih dan intuitif memudahkan navigasi dan interaksi dengan rekam medis.
- **Skalabilitas dan Ekstensibilitas**: Dirancang dengan arsitektur fleksibel untuk pengembangan fitur lebih lanjut dan integrasi dengan sistem kesehatan lainnya.

## Teknologi yang Digunakan

- **Frontend**: Flutter
- **Backend**: Firebase untuk penyimpanan data dan autentikasi
- **Pengenalan Wajah**: DeepFace untuk autentikasi wajah
- **Autentikasi**: Firebase Authentication untuk manajemen pengguna
- **Kontrol Versi**: Git & GitHub

## Instalasi

### Prasyarat

1. **Flutter SDK**: Pastikan Flutter sudah terinstal. Anda bisa mendownloadnya dari [situs resmi Flutter](https://flutter.dev/docs/get-started/install).
2. **Akun Firebase**: Buat proyek Firebase di [Firebase Console](https://console.firebase.google.com/).
3. **DeepFace**: Pastikan Python sudah terinstal untuk menggunakan DeepFace. DeepFace bisa diinstal melalui pip.

### Langkah-Langkah Instalasi

1. **Clone repository**

   ```bash
   git clone https://github.com/riskiananda90/MomEase-Face-Recognation.git
   cd MomEase-Face-Recognation
   ```

2. **Konfigurasi Firebase**

   - Masuk ke Firebase Console, buat proyek baru, dan aktifkan **Firestore Database** dan **Firebase Authentication**.
   - Download file `google-services.json` untuk Android dan `GoogleService-Info.plist` untuk iOS, lalu tambahkan ke direktori yang sesuai di proyek Flutter Anda.

3. **Install Dependencies**

   - **Dependensi Flutter**: Arahkan ke direktori proyek Flutter dan jalankan:
     ```bash
     flutter pub get
     ```

   - **DeepFace untuk Pengenalan Wajah**: Masuk ke direktori `FaceRecognition` dan instal DeepFace melalui pip (membutuhkan Python):
     ```bash
     cd FaceRecognition
     pip install deepface
     ```

4. **Variabel Lingkungan (Opsional)**

   Jika Anda menggunakan konfigurasi khusus berdasarkan lingkungan, Anda bisa mengaturnya menggunakan file `.env` untuk kunci Firebase, API keys, atau pengaturan lainnya.

5. **Jalankan Aplikasi**

   - **FaceRecognition Backend**: Jalankan `app.py` di direktori `FaceRecognition` untuk mengaktifkan modul pengenalan wajah.
     ```bash
     python app.py
     ```

   - **Frontend**: Jalankan aplikasi Flutter
     ```bash
     flutter run
     ```

## Penggunaan

1. **Sign Up / Log In**: Pengguna bisa mendaftar atau masuk menggunakan pengenalan wajah. Saat login, DeepFace akan memverifikasi wajah pengguna dengan data yang disimpan di Firebase.
2. **Lihat Rekam Medis**: Pengguna yang berwenang bisa melihat, mengedit, dan mengelola rekam medis yang disimpan di Firebase Firestore.
3. **Perbarui Profil dan Preferensi**: Pengguna bisa memperbarui detail pribadi dan mengatur preferensi.
4. **Keamanan Data**: Informasi sensitif disimpan dengan aman dan hanya dapat diakses oleh pengguna yang telah diautentikasi.

## Struktur Proyek

```
MomEase-Face-Recognation/
├── FaceRecognition/        # Direktori untuk modul pengenalan wajah
│   └── app.py              # File utama untuk pengenalan wajah menggunakan DeepFace
├── lib/                    # Kode utama aplikasi Flutter
│   ├── --------/           # Halaman untuk berbagai fitur dalam aplikasi
│   ├── --------/           # Layanan untuk integrasi Firebase dan pemanggilan FaceRecognition
│   └── -------/            # Komponen widget yang dapat digunakan kembali
├── assets/                 # Aset seperti gambar dan font
└── backend/                # (Opsional) Layanan backend tambahan
```

- **FaceRecognition**: Direktori khusus untuk modul pengenalan wajah menggunakan DeepFace, berisi file `app.py`.
  - **app.py**: File Python utama untuk pengenalan wajah yang dapat berfungsi sebagai server API jika aplikasi Flutter memerlukan pemanggilan eksternal untuk verifikasi wajah.
- **lib**: Kode utama aplikasi Flutter.
  - **screens**: Halaman aplikasi (seperti halaman login, halaman rekam medis, dll.).
  - **services**: Layanan untuk integrasi Firebase dan pemanggilan ke `app.py` di FaceRecognition (jika ada).
  - **widgets**: Komponen antarmuka yang dapat digunakan kembali.
- **assets**: Aset aplikasi, seperti gambar dan font.

## Kontribusi

Kontribusi sangat terbuka! Untuk berkontribusi:

1. Fork repository ini.
2. Buat branch baru (`git checkout -b feature-branch`).
3. Lakukan perubahan Anda dan commit (`git commit -m 'Add some feature'`).
4. Push ke branch (`git push origin feature-branch`).
5. Buat Pull Request.

Pastikan kode Anda sesuai dengan standar proyek dan mencakup pengujian yang relevan.

## Lisensi

Proyek ini dilisensikan di bawah MIT License - lihat file [LICENSE](LICENSE) untuk informasi lebih lanjut.

---

Dengan menggunakan **MomEase** untuk rekam medis, penyedia layanan kesehatan dan pasien dapat menikmati cara yang aman, ramah pengguna, dan efisien untuk mengelola dan mengakses informasi kesehatan, yang diperkuat dengan autentikasi pengenalan wajah.

---

### Screenshots



---

### Kontak

Untuk pertanyaan atau saran, jangan ragu untuk menghubungi pengelola proyek di [riskiananda90 on GitHub](https://github.com/riskiananda90).
