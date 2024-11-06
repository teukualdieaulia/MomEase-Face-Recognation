import 'package:badges/badges.dart' as badges;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Component/AppColor.dart';
import '../../Component/NavBattom.dart';
import 'package:get_storage/get_storage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final box = GetStorage();
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked5 = false;
  bool _isChecked6 = false;
  int waktu_kehamilan = 124;
  late Color _colorHari;
  late Color _colorMinggu;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    userData = box.read("userData") ?? {};
    _colorHari = Appcolor.textPrimary;
    _colorMinggu = Appcolor.Card;
  }

  void _showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black54, // Warna latar belakang semi-transparan
      barrierDismissible: true,
      barrierLabel: 'Close Dialog',
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation1, animation2) {
        return Align(
          alignment: Alignment.topRight, // Pojok kanan atas
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.only(top: 60, right: 10), // Sesuaikan posisi
              padding: EdgeInsets.all(8),
              width: 250,
              decoration: BoxDecoration(
                color: Appcolor.Card,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop(); // Menutup dialog
                      Get.toNamed('/Profilpage');
                    },
                    title: Text(
                        style: TextStyle(color: Appcolor.textPrimary),
                        "Profil"),
                    leading: Icon(Icons.person, color: Appcolor.textPrimary),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop(); // Menutup dialog
                      Get.toNamed('/Settingspage');
                    },
                    title: Text(
                        style: TextStyle(color: Appcolor.textPrimary),
                        "Pengaturan"),
                    leading: Icon(Icons.settings, color: Appcolor.textPrimary),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop(); // Menutup dialog
                      Get.toNamed('/Biodatapage');
                    },
                    title: Text(
                        style: TextStyle(color: Appcolor.textPrimary), "About"),
                    leading: Icon(Icons.info, color: Appcolor.textPrimary),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).pop(); // Menutup dialog
                      Get.toNamed('/Login');
                    },
                    title: Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.logout, color: Colors.red),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation1, animation2, child) {
        return ScaleTransition(
          scale: animation1,
          alignment: Alignment.topRight,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottomnavigation(currentIndex: 0),
      backgroundColor: Appcolor.Primary,
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: Appcolor.Card,
        leading: const Icon(
          Icons.menu,
          color: Appcolor.textPrimary,
        ),
        title: Text(
          "MomEase",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Appcolor.textPrimary),
        ),
        actions: [
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: -5, end: -5),
            badgeStyle: badges.BadgeStyle(
              elevation: 10,
              badgeColor: Appcolor.Secondary,
            ),
            showBadge: true,
            badgeContent: const Text(
              "2",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 8),
            ),
            child: const Icon(
              Icons.notifications,
              color: Appcolor.textPrimary,
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            icon: CircleAvatar(
              radius: 12,
              backgroundColor: Appcolor.textPrimary.withOpacity(0.4),
              child: const CircleAvatar(
                radius: 10,
                backgroundImage: AssetImage("Images/User/foto_rizki.png"),
              ),
            ),
            onPressed: () => _showCustomDialog(context),
          ),
          SizedBox(width: 5),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Selamat datang, ${userData?['name'] ?? "Tamu"}",
                                style: TextStyle(
                                    fontSize: 13, color: Appcolor.textPrimary),
                              ),
                              Text(
                                "Hamil bahagia , Ibu cerdas!",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Appcolor.textPrimary),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Appcolor.textPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Waktu kehamilan",
                                style: TextStyle(
                                    color: Appcolor.Primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _colorHari == Appcolor.textPrimary
                                    ? "${waktu_kehamilan}  Hari"
                                    : "${(waktu_kehamilan / 7).floor()}  Minggu",
                                style: TextStyle(
                                    color: Appcolor.Primary,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(left: 2, right: 2),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Appcolor.Card,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                TextButton(
                                    style: TextButton.styleFrom(
                                      elevation: 0,
                                      side: BorderSide(
                                          color: _colorMinggu, width: 2),
                                      backgroundColor: _colorMinggu,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _colorMinggu = Appcolor.textPrimary;
                                        _colorHari = Appcolor.Card;
                                      });
                                    },
                                    child: Text(
                                      "Minggu",
                                      style: TextStyle(
                                          color: _colorHari, fontSize: 12),
                                    )),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        elevation: 0,
                                        side: BorderSide(
                                            color: _colorHari, width: 2),
                                        backgroundColor: _colorHari),
                                    onPressed: () {
                                      setState(() {
                                        _colorHari = Appcolor.textPrimary;
                                        _colorMinggu = Appcolor.Card;
                                      });
                                    },
                                    child: Text(
                                      "Hari",
                                      style: TextStyle(
                                          color: _colorMinggu, fontSize: 12),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Appcolor.textPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 210,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Masukan keluhan",
                                  style: TextStyle(
                                      color: Appcolor.Primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Kami akan menindak lanjuti keluhan anda dalam    1 x 24 jam kerja",
                                  style: TextStyle(
                                    color: Appcolor.Primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            style: IconButton.styleFrom(
                                elevation: 10,
                                shadowColor: Colors.black,
                                backgroundColor: Appcolor.Card,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {
                              
                            },
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Appcolor.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Text("Jadwal Makanan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Appcolor.textPrimary,
                            fontSize: 15,
                          )),
                    ),
                    SizedBox(height: 23),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                        color: Appcolor.textPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Image.asset("Images/Logo/sayur.png"),
                        title: Text(
                          "Sayur",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Pagi, Sore, Malam"),
                        trailing: Checkbox(
                            splashRadius: 5,
                            activeColor: Appcolor.Card,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            value: _isChecked1,
                            onChanged: (Value) {
                              setState(() {
                                _isChecked1 = Value ?? false;
                              });
                            }),
                      ),
                    ),
                    SizedBox(height: 13),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                        color: Appcolor.textPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Image.asset("Images/Logo/susu.png"),
                        title: Text(
                          "Susu",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Pagi, Sore, Malam"),
                        trailing: Checkbox(
                            splashRadius: 5,
                            activeColor: Appcolor.Card,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            value: _isChecked2,
                            onChanged: (Value) {
                              setState(() {
                                _isChecked2 = Value ?? false;
                              });
                            }),
                      ),
                    ),
                    SizedBox(height: 13),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                        color: Appcolor.textPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Image.asset("Images/Logo/buah.png"),
                        title: Text(
                          "Buah",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Pagi, Sore, Malam"),
                        trailing: Checkbox(
                            splashRadius: 5,
                            activeColor: Appcolor.Card,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            value: _isChecked3,
                            onChanged: (Value) {
                              setState(() {
                                _isChecked3 = Value ?? false;
                              });
                            }),
                      ),
                    ),
                    SizedBox(height: 13),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                        color: Appcolor.textPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Image.asset("Images/Logo/ikan.png"),
                        title: Text(
                          "Ikan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Pagi, Sore, Malam"),
                        trailing: Checkbox(
                            splashRadius: 5,
                            activeColor: Appcolor.Card,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            value: _isChecked5,
                            onChanged: (Value) {
                              setState(() {
                                _isChecked5 = Value ?? false;
                              });
                            }),
                      ),
                    ),
                    SizedBox(height: 13),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      decoration: BoxDecoration(
                        color: Appcolor.textPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Image.asset("Images/Logo/kacang.png"),
                        title: Text(
                          "Kacang",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Pagi, Sore, Malam"),
                        trailing: Checkbox(
                            splashRadius: 5,
                            activeColor: Appcolor.Card,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            value: _isChecked6,
                            onChanged: (Value) {
                              setState(() {
                                _isChecked6 = Value ?? false;
                              });
                            }),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
