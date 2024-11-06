import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectrekammedis/Component/AppColor.dart';

import '../../Component/NavBattom.dart';

class Jadwalpage extends StatefulWidget {
  const Jadwalpage({super.key});

  @override
  State<Jadwalpage> createState() => _JadwalpageState();
}

class _JadwalpageState extends State<Jadwalpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottomnavigation(currentIndex: 3),
      backgroundColor: Appcolor.Primary,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Appcolor.textPrimary,
                        )),
                    SizedBox(width: MediaQuery.of(context).size.width / 3.3),
                    Text(
                      "Jadwal",
                      style: TextStyle(
                          color: Appcolor.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
                // Kalender picker
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Appcolor.textPrimary,
                  ),
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: DatePicker(
                    currentDateTextStyle: TextStyle(
                      color: Colors.red, // Warna tanggal hari ini
                      fontWeight: FontWeight.bold,
                    ),
                    enabledCellsTextStyle: TextStyle(
                      color: Colors.black, // Warna tanggal yang bisa dipilih
                    ),
                    disabledCellsTextStyle: TextStyle(
                      color: Appcolor
                          .Card, // Warna tanggal yang tidak bisa dipilih
                    ),
                    selectedCellDecoration: BoxDecoration(
                      color: Colors.green, // Warna latar tanggal yang dipilih
                      shape: BoxShape.circle,
                    ),
                    currentDateDecoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.red,
                          width: 2), // Garis sekitar tanggal hari ini
                      shape: BoxShape.circle,
                    ),
                    splashColor: Appcolor.textPrimary,
                    highlightColor: Appcolor.textPrimary,
                    maxDate: DateTime.now(),
                    minDate: DateTime(2024, 1, 1),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Appcolor.textPrimary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    title: Text(
                      "Dr. Rizki Ananda STR.KOM",
                      style: TextStyle(
                          color: Appcolor.Primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                    subtitle: Text(
                      "Gynaekologi",
                      style: TextStyle(
                          color: Appcolor.Primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                    trailing: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 96, 175, 104)),
                        onPressed: () {},
                        child: Text(
                          "Hubungi",
                          style: TextStyle(color: Appcolor.Primary),
                        )),
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundColor: Appcolor.Primary.withOpacity(0.5),
                      child: const CircleAvatar(
                        radius: 18,
                        backgroundImage:
                            AssetImage("Images/User/foto_rizki.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Control visit",
                      style: TextStyle(color: Appcolor.textPrimary),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Appcolor.Card),
                      child: Text("01",
                          style: TextStyle(color: Appcolor.textPrimary)),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Appcolor.Card),
                      child: Text("14:30 - 15:30",
                          style: TextStyle(color: Appcolor.textPrimary)),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
