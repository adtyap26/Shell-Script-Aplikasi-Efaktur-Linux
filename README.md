# Shell-Script-Aplikasi-Efaktur-Linux
Refaktoring Shell Script Pada Aplikasi Efaktur Untuk Pengguna Linux

## Aplikasi e-Faktur dapat di download pada laman berikut ini:

[e-Faktur](https://efaktur.pajak.go.id/aplikasi)

Untuk pengguna linux dapat mengatur secara manual penggunaan RAM untuk menjalankan aplikasi. Cara mengaturnya menggunakan shell scripting sederhana. Di dalam repository ini saya melakukan refactoring, kerena menurut saya, walaupun script yang dibuat oleh pihak ditjen pajak ini dapat berjalan dengan baik, namun memiliki beberapa kekurangan antara lain:

- Script sulit terbaca sehingga menyulitkan proses debugging atau penambahan fitur di masa depan.
- Saat dijalankan, script ini berpotensi menyulitkan pengguna baru di Linux yang belum terbiasa menggunakan OS linux.


## Dependensi

Script membutuhkan satu tool untuk mempercantik tampilan:

[gum](https://github.com/charmbracelet/gum).
