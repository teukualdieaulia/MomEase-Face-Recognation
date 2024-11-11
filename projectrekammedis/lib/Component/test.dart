import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:projectrekammedis/Component/AppColor.dart';
import 'package:projectrekammedis/Pages/Home/HomePage.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final TextEditingController _keluhanController = TextEditingController();
  final firabase = FirebaseFirestore.instance;
  Map<String, dynamic>? userData;
  final box = GetStorage();
  CollectionReference? Users;
  String? uid;

  @override
  void initState() {
    super.initState();
    Users = firabase.collection('users');
    uid = box.read("uidAktif");
    userData = box.read(uid!) ?? {};
  }

  Future<void> SimpanDataKeluhan() async {
    try {
      _ShowDialogProgress();
      final Keluhan = _keluhanController.text;
      await Users!.doc(uid).update({
        'Keluhan': FieldValue.arrayUnion([Keluhan])
      });
      userData!['Keluhan'] = Keluhan;
      await box.write(uid!, userData);

      _keluhanController.clear();
      Navigator.of(context).pop();
      _showSuccessDialog("Data Berhasil Disimpan");
      print("Simpan Data Keluhan");
    } catch (e) {
      print("Error SimpanDataKeluhan : $e");
      Navigator.of(context).pop();
      _showErrorDialog("Gagal menyimpan data keluhan");
    }
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Berhasil",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B8FAC),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Image.asset("Images/Logo/Check.png", width: 70, height: 70),
            ],
          ),
        );
      },
    ).then((_) {
      Get.offAll(() => const Homepage());
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Error",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Icon(Icons.error, color: Colors.red, size: 70),
            ],
          ),
        );
      },
    );
  }

  void _ShowDialogProgress() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            padding: EdgeInsets.all(20),
            width: 160, // Atur lebar container agar tidak terlalu besar
            decoration: BoxDecoration(
              color: Appcolor.Card,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Agar sesuai dengan tinggi konten
              children: [
                LoadingAnimationWidget.inkDrop(
                  color: Appcolor.textPrimary,
                  size: 40,
                ),
                SizedBox(height: 15),
                Text(
                  "Loading...",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Appcolor.textPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _ShowBottomSheet(BuildContext context) {
    showCupertinoModalBottomSheet(
        enableDrag: false,
        backgroundColor: Colors.transparent,
        // Menyembunyikan overlay di sekitarnya
        elevation: 5,
        topRadius: Radius.circular(20), // Radius sudut atas
        isDismissible: false,
        expand: false,
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Membuat sudut membulat
              child: Material(
                color: Appcolor.Card,
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: CustomPaint(
                      painter: CurvePainter(),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 20,
                            bottom:
                                MediaQuery.of(context).viewInsets.bottom + 20,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 100,
                                  child: Image.asset("Images/logo.png")),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Masukan keluhan anda",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Appcolor.textPrimary,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _keluhanController,
                                style: TextStyle(color: Appcolor.textPrimary),
                                cursorColor: Appcolor.Secondary,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Appcolor.Secondary),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Appcolor.Secondary),
                                  ),
                                  hintText: "Masukan keluhan anda",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Appcolor.Secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: SimpanDataKeluhan,
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Appcolor.Primary,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _ShowBottomSheet(context);
          });
        },
        child: Icon(Icons.add),
      ),
      body: Center(child: Text("Test")),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Warna titik-titik
    final dotPaint = Paint()..color = Colors.grey.withOpacity(0.5);

    // Ukuran titik dan jarak antar titik
    double dotSize = 1.0;
    double spacing = 30.8;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotSize, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // Mengembalikan false karena pola titik-titik statis
  }
}
