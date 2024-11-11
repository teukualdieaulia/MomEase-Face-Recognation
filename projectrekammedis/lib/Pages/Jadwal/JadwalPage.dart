import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:get/get.dart';
import 'package:projectrekammedis/Component/AppColor.dart';

import '../../Component/NavBattom.dart';

class Jadwalpage extends StatefulWidget {
  const Jadwalpage({super.key});

  @override
  State<Jadwalpage> createState() => _JadwalpageState();
}

class _JadwalpageState extends State<Jadwalpage> {
  DateTime _focusDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        bottomNavigationBar: Bottomnavigation(currentIndex: 3),
        backgroundColor: Appcolor.Primary,
        appBar: AppBar(
          backgroundColor: Appcolor.Primary,
          title: Text("Jadwal Konsultasi"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(bottom: 30, left: 20, right: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Appcolor.textPrimary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TableCalendar(
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(color: Colors.black),
                        weekendStyle: TextStyle(color: Colors.black),
                      ),
                      headerStyle: HeaderStyle(
                        formatButtonVisible:
                            false, // Menyembunyikan FormatButton
                      ),
                      calendarStyle: CalendarStyle(
                        defaultTextStyle: TextStyle(color: Colors.black),
                        defaultDecoration: BoxDecoration(
                          color: Appcolor
                              .Primary, // Warna background bulat pada tanggal
                          shape: BoxShape
                              .circle, // Membuat background berbentuk lingkaran
                        ),
                        todayDecoration: BoxDecoration(
                          color: Colors
                              .red, // Warna background khusus untuk tanggal hari ini
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: TextStyle(color: Colors.black),
                        selectedDecoration: BoxDecoration(
                          color: const Color.fromARGB(255, 221, 155, 155),
                          shape: BoxShape.circle,
                        ),
                        weekendDecoration: BoxDecoration(
                          color: Appcolor
                              .Primary, // Warna background untuk akhir pekan
                          shape: BoxShape.circle,
                        ),
                      ),
                      focusedDay: _focusDay,
                      firstDay: DateTime(2001),
                      lastDay: DateTime(2050),
                      calendarFormat: CalendarFormat.month,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusDay = focusedDay;
                        });
                      },
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
                        style: TextStyle(
                            color: Appcolor.textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Appcolor.textPrimary),
                        child: Text("01",
                            style: TextStyle(
                                color: Appcolor.Primary, fontSize: 20)),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Appcolor.textPrimary),
                        child: Text("14:30 - 15:30",
                            style: TextStyle(
                                color: Appcolor.Primary, fontSize: 20)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
                ],
              )),
        ),
      ),
    );
  }
}


// !!Collection: jadwal_konsultasi
// !!  Document ID: auto-generated
// !!    - dokterId: "dokter1"
// !!   - pasienId: "pasien1"
// !!    - tanggal: 2024-11-21 (format DateTime)
// !!    - waktuMulai: "14:30"
// !!    - waktuSelesai: "15:30"
// !!    - keperluan: "Konsultasi rutin"


// void addJadwalKonsultasi(String dokterId, String pasienId, DateTime tanggal,
//     String waktuMulai, String waktuSelesai, String keperluan) async {
//   await FirebaseFirestore.instance.collection('jadwal_konsultasi').add({
//     'dokterId': dokterId,
//     'pasienId': pasienId,
//     'tanggal': tanggal,
//     'waktuMulai': waktuMulai,
//     'waktuSelesai': waktuSelesai,
//     'keperluan': keperluan,
//   });
// }


// import 'package:cloud_firestore/cloud_firestore.dart';

// Future<List<Map<String, dynamic>>> fetchJadwalKonsultasi(String pasienId) async {
//   final snapshot = await FirebaseFirestore.instance
//       .collection('jadwal_konsultasi')
//       .where('pasienId', isEqualTo: pasienId)
//       .get();

//   return snapshot.docs.map((doc) => doc.data()).toList();
// }


// Future<void> addJadwalKonsultasiAutoIncrement(
//   String dokterId,
//   String pasienId,
//   DateTime tanggal,
//   String waktuMulai,
//   String waktuSelesai,
//   String keperluan,
// ) async {
 // Ambil jumlah antrian yang sudah ada pada tanggal tersebut
//   final snapshot = await FirebaseFirestore.instance
//       .collection('jadwal_konsultasi')
//       .where('tanggal', isEqualTo: tanggal)
//       .get();

// Nomor antrian baru adalah jumlah antrian yang ada + 1
//   int noAntrian = snapshot.docs.length + 1;

//   await FirebaseFirestore.instance.collection('jadwal_konsultasi').add({
//     'dokterId': dokterId,
//     'pasienId': pasienId,
//     'tanggal': tanggal,
//     'waktuMulai': waktuMulai,
//     'waktuSelesai': waktuSelesai,
//     'keperluan': keperluan,
//     'noAntrian': noAntrian,
//   });
// }

