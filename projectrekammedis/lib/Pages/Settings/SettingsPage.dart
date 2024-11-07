import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projectrekammedis/Component/AppColor.dart';

import '../../Component/NavBattom.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  final box = GetStorage();
  Map<String, dynamic>? userData;
  Map<String, dynamic>? Biodata;
  bool? notif;
  String? uid;
  String? imageUrl;
  bool isLoading = true;

  Future<void> AmbilSemuaData() async {
    try {
      uid = box.read("uidAktif");
      print("UID : $uid");
      userData = box.read(uid!) ?? {};
    } catch (e) {
      print("Error AmbilSemuaData : $e");
    }
  }

  Future<void> Ambilgambar() async {
    try {
      if (userData != null && uid != null) {
        final storagef =
            FirebaseStorage.instance.ref().child("/Users/Pasien/$uid.jpg");
        final url = await storagef.getDownloadURL();
        setState(() {
          imageUrl = url;
        });
      }
    } catch (e) {
      print("Error AmbilDataGambar : $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    AmbilSemuaData();
    Ambilgambar();
    if (userData!['Biodata'] != null) {
      notif = true;
      print("Lengkapi diri terisi");
    } else {
      print("Lengkapi diri");
      notif = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Appcolor.Card,
          centerTitle: true,
          title: Text(
            "Settings",
            style: TextStyle(
                color: Appcolor.textPrimary, fontWeight: FontWeight.bold),
          )),
      backgroundColor: Appcolor.Primary,
      bottomNavigationBar: Bottomnavigation(currentIndex: 4),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Appcolor.Card,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: lisTileAccount(
                    userData: userData,
                    imageUrl: imageUrl,
                    isloading: isLoading),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Appcolor.Card,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "General",
                      style: TextStyle(
                          color: Appcolor.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    lisTileCard(
                      onTap: () => Get.toNamed('/EditProfil'),
                      leading: Icon(Icons.person,
                          color:
                              Appcolor.textPrimary), // Ikon untuk "Edit Profil"
                      title: "Edit Profil",
                      subtitle: "Ganti foto profil, nomor, dan E-mail",
                    ),
                    lisTileCard(
                      onTap: () => Get.toNamed('/GantiPassword'),
                      leading: Icon(Icons.lock,
                          color: Appcolor
                              .textPrimary), // Ikon untuk "Ganti Kata Sandi"
                      title: "Ganti Kata Sandi",
                      subtitle: "Perbarui dan ubah keamanan akun Anda",
                    ),
                    lisTileCard(
                      onTap: () => Get.toNamed('/Ketentuanpage'),
                      leading: Icon(Icons.article,
                          color: Appcolor
                              .textPrimary), // Ikon untuk "Ketentuan Penggunaan"
                      title: "Ketentuan Penggunaan",
                      subtitle:
                          "Lihat ketentuan penggunaan dan kebijakan privasi kami",
                    ),
                    lisTileCard(
                      onTap: () => Get.toNamed('/Biodatapage'),
                      color: notif == true ? Colors.green : Colors.amber,
                      leading: notif == true
                          ? Icon(Icons.check_circle_outline_outlined)
                          : Icon(Icons.info,
                              color: Appcolor
                                  .textPrimary), // Ikon untuk "Lengkapi Data"
                      title: "Lengkapi Data",
                      subtitle: "Lengkapi data diri Anda",
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Appcolor.Card,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Preferences",
                        style: TextStyle(
                            color: Appcolor.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      lisTileCard(
                        onTap: () => Get.toNamed('/Notifpage'),
                        leading: Icon(Icons.notifications,
                            color: Appcolor
                                .textPrimary), // Ikon untuk "Notifikasi"
                        title: "Notifikasi",
                        subtitle: "Kelola pengaturan notifikasi Anda",
                      ),
                      lisTileCard(
                        onTap: () => Get.toNamed('/FAQpage'),
                        leading: Icon(Icons.help_outline,
                            color: Appcolor.textPrimary), // Ikon untuk "FAQ"
                        title: "FAQ",
                        subtitle: "Pertanyaan yang sering ditanyakan",
                      ),
                      lisTileCard(
                        onTap: () {
                          Get.offAllNamed('/Login');
                        },
                        color: Colors.red,
                        leading: Icon(Icons.exit_to_app,
                            color: Appcolor.textPrimary), // Ikon untuk "Keluar"
                        title: "Keluar",
                        subtitle: "Keluar dari akun Anda",
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class lisTileAccount extends StatelessWidget {
  const lisTileAccount({
    super.key,
    required this.userData,
    required this.isloading,
    this.imageUrl,
  });
  final bool isloading;
  final String? imageUrl;

  final Map<String, dynamic>? userData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: isloading
            ? CircularProgressIndicator()
            : imageUrl != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl!),
                    radius: 20,
                  )
                : Icon(
                    Icons.person,
                    color: Appcolor.textPrimary,
                    size: 35,
                  ),
        radius: 20,
      ),
      subtitle: Text(
        "${userData?["email"] ?? "Tamu@gmail.com"}",
        style:
            TextStyle(fontWeight: FontWeight.w500, color: Appcolor.textPrimary),
      ),
      title: Text(
        "${userData?["name"] ?? "Tamu"}",
        style: TextStyle(fontSize: 20, color: Appcolor.textPrimary),
      ),
    );
  }
}

class lisTileCard extends StatelessWidget {
  const lisTileCard({
    super.key,
    this.userData,
    this.leading,
    this.title,
    this.subtitle,
    this.color,
    required this.onTap,
  });
  final Icon? leading;
  final String? title;
  final String? subtitle;
  final Color? color;
  final VoidCallback? onTap;

  final Map<String, dynamic>? userData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      trailing: Icon(
        Icons.chevron_right,
        color: Appcolor.textPrimary,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 0),
      leading: CircleAvatar(
        radius: 19,
        backgroundColor: color != null
            ? color!.withOpacity(0.1)
            : Appcolor.textPrimary.withOpacity(0.1),
        child: Icon(
          leading!.icon,
          color: color != null ? color : Appcolor.textPrimary,
          size: 25,
        ),
      ),
      subtitle: Text(
        "${subtitle}",
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w300, color: Colors.grey),
      ),
      title: Text(
        "${title}",
        style: TextStyle(
            fontSize: 17, color: color != null ? color : Appcolor.textPrimary),
      ),
    );
  }
}
