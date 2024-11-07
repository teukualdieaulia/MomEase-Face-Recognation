import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:projectrekammedis/Component/AppColor.dart';
import 'package:projectrekammedis/Pages/Home/HomePage.dart';

class Biodatapage extends StatefulWidget {
  const Biodatapage({super.key});

  @override
  State<Biodatapage> createState() => _BiodatapageState();
}

class _BiodatapageState extends State<Biodatapage> {
  final noRegisterController = TextEditingController();
  final namaController = TextEditingController();
  final nikController = TextEditingController();
  final alamatController = TextEditingController();
  final bpjsController = TextEditingController();
  final umurController = TextEditingController();
  final FirebaseFirestore firabase = FirebaseFirestore.instance;
  CollectionReference? Users;
  Map<String, dynamic>? userData;
  final box = GetStorage();
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic>? Biodata;
  bool _isReadonly = false;
  String? uid;

  @override
  void initState() {
    super.initState();
    uid = box.read("uidAktif");
    print("UID : $uid");
    userData = box.read(uid!) ?? {};
    Users = firabase.collection('users');
    print(userData);

    if (userData != null && userData!['Biodata'] != null) {
      var biodata = userData!['Biodata'];
      noRegisterController.text = biodata['no_register'] ?? "";
      namaController.text = biodata['name'] ?? "";
      nikController.text = biodata['nik'] ?? "";
      alamatController.text = biodata['address'] ?? "";
      bpjsController.text = biodata['bpjs'] ?? "";
      umurController.text = biodata['umur'] ?? "";
      _isReadonly = true;
    }
  }

  Future<void> _simpanData() async {
    try {
      _ShowDialogProgress();
      Biodata = {
        'no_register': noRegisterController.text,
        'name': namaController.text,
        'nik': nikController.text,
        'address': alamatController.text,
        'bpjs': bpjsController.text,
        'umur': umurController.text,
      };
      await Users!.doc(uid).update({'Biodata': Biodata}).timeout(
          Duration(seconds: 2), onTimeout: () {
        return Future.error('Timeout');
      });
      print("Data disimpan ke firebase");
      userData!['Biodata'] = Biodata;
      await box.write(uid!, userData);
      print("Data disimpan ke Getstorage");
      Navigator.of(context).pop();
      _showSuccessDialog('Data Berhasil Disimpan');
    } catch (e) {
      if (e.toString().contains("Timeout")) {
        Navigator.of(context).pop();
        _showErrorDialog(
            'Periksa jaringan anda',
            Icon(
              Icons.wifi_off,
              color: Colors.red,
              size: 70,
            ));
      } else {
        Navigator.of(context).pop();
        _showErrorDialog('Tidak dapat menyimpan data',
            Icon(Icons.error, color: Colors.red, size: 70));
      }
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

  void _showErrorDialog(String message, Widget icon) {
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
              icon
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Appcolor.Primary,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.mode_edit_outline),
              onPressed: () {
                setState(() {
                  _isReadonly = false;
                });
              },
            )
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Get.offAllNamed('/Settingspage'),
          ),
          elevation: 0,
          backgroundColor: Appcolor.Card,
          foregroundColor: Appcolor.textPrimary,
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: const Text(
            "Isi Biodata",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Appcolor.textPrimary),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "No Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Appcolor.textPrimary),
                      ),
                      const SizedBox(height: 10),
                      CustomFormField(
                        isReadonly: _isReadonly,
                        controller: noRegisterController,
                        icon: const Icon(Icons.note_alt_outlined),
                        hintText: "Masukan No Register",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Silahkan masukan no register';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Nama",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Appcolor.textPrimary),
                      ),
                      const SizedBox(height: 10),
                      CustomFormField(
                        isReadonly: _isReadonly,
                        controller: namaController,
                        icon: const Icon(Icons.person),
                        hintText: "Masukan Nama Pasien",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Silahkan masukan Nama Pasien';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "NIK",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Appcolor.textPrimary),
                      ),
                      const SizedBox(height: 10),
                      CustomFormField(
                        isReadonly: _isReadonly,
                        controller: nikController,
                        icon: const Icon(Icons.credit_card),
                        hintText: "Masukan NIK",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Silahkan masukan NIK';
                          }
                          if (value.length != 16) {
                            return 'NIK harus terdiri dari 16 digit angka';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Alamat",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Appcolor.textPrimary),
                      ),
                      const SizedBox(height: 10),
                      CustomFormField(
                        isReadonly: _isReadonly,
                        controller: alamatController,
                        icon: const Icon(Icons.home),
                        hintText: "Masukan Alamat",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Silahkan masukan Alamat';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "BPJS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Appcolor.textPrimary),
                      ),
                      const SizedBox(height: 10),
                      CustomFormField(
                        isReadonly: _isReadonly,
                        controller: bpjsController,
                        icon: const Icon(Icons.local_hospital),
                        hintText: "Masukan No BPJS",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Silahkan masukan No BPJS';
                          }
                          if (value.length != 13) {
                            return 'Nomor BPJS harus terdiri dari 13 digit angka';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Umur",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Appcolor.textPrimary),
                      ),
                      const SizedBox(height: 10),
                      CustomFormField(
                        isReadonly: _isReadonly,
                        controller: umurController,
                        icon: const Icon(Icons.calendar_today),
                        hintText: "Masukan Umur",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Silahkan masukan Umur';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Umur harus berupa angka';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 160,
                        child: Image.asset("Images/Clipped.png"),
                      ),
                      const Center(
                        child: Text(
                          "Mohon untuk isi data dengan benar dan teliti",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      backgroundColor:
                          _isReadonly ? Colors.grey : Appcolor.Secondary,
                    ),
                    onPressed: () {
                      if (_isReadonly == false) {
                        if (_formKey.currentState!.validate()) {
                          _simpanData();
                        }
                      }
                    },
                    child: const Text(
                      "Simpan",
                      style: TextStyle(
                          color: Appcolor.Primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
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

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.icon,
    required this.hintText,
    this.validator,
    required this.controller,
    required this.isReadonly,
  });
  final Icon icon;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool isReadonly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: isReadonly,
      controller: controller,
      style: const TextStyle(color: Appcolor.textPrimary),
      cursorColor: Appcolor.Secondary,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Appcolor.Secondary),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          icon.icon,
          color: Appcolor.Secondary,
        ),
      ),
      validator: validator,
    );
  }
}
