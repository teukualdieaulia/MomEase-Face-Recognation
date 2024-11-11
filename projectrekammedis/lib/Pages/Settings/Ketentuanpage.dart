import 'package:flutter/material.dart';
import 'package:projectrekammedis/Component/AppColor.dart';

class Ketentuanpage extends StatelessWidget {
  const Ketentuanpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.Primary,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Appcolor.textPrimary,
            )),
        title: Text(
          "Ketentuan layanan",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Appcolor.textPrimary),
        ),
      ),
      backgroundColor: Appcolor.Primary,
      body: GestureDetector(
        onTap: () {
          Focus.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Appcolor.textPrimary),
                  child: Text(
                    '   Selamat datang di aplikasi kami! Dengan menggunakan aplikasi ini, Anda setuju untuk mematuhi dan terikat pada ketentuan berikut:',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, color: Appcolor.Primary),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '1 - Penggunaan Aplikasi',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.textPrimary),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Appcolor.textPrimary),
                  child: Text(
                    '   Aplikasi ini dirancang untuk menyediakan layanan kepada pengguna. Penggunaan yang tidak sah atau penyalahgunaan aplikasi ini dapat mengakibatkan penghentian akun Anda.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, color: Appcolor.Primary),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '2 - Kebijakan Privasi',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.textPrimary),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Appcolor.textPrimary),
                  child: Text(
                    '   Kami menghargai privasi Anda dan akan melindungi informasi pribadi Anda sesuai dengan kebijakan privasi kami.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, color: Appcolor.Primary),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '3 - Batasan Tanggung Jawab',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.textPrimary),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Appcolor.textPrimary),
                  child: Text(
                    '   Kami tidak bertanggung jawab atas kerusakan yang timbul dari penggunaan aplikasi ini. Penggunaan aplikasi ini sepenuhnya merupakan tanggung jawab pengguna.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, color: Appcolor.Primary),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '4 - Perubahan Ketentuan',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.textPrimary),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Appcolor.textPrimary),
                  child: Text(
                    '   Kami dapat memperbarui ketentuan ini dari waktu ke waktu. Pengguna diwajibkan untuk memeriksa pembaruan secara berkala.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16, color: Appcolor.Primary),
                  ),
                ),
                SizedBox(height: 32),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolor.textPrimary),
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke halaman sebelumnya
                    },
                    child: Text(
                      'Saya Setuju',
                      style: TextStyle(
                          color: Appcolor.Primary, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
