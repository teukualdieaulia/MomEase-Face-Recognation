import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Biodatapage extends StatefulWidget {
  const Biodatapage({super.key});

  @override
  State<Biodatapage> createState() => _BiodatapageState();
}

class _BiodatapageState extends State<Biodatapage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: false,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          "Isi Biodata",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Color(0xFF0B8FAC)),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.offAllNamed("/Homepage");
            },
            child: const Text(
              "lewati",
              style: TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    CustomFormField(
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    CustomFormField(
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    CustomFormField(
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    CustomFormField(
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    CustomFormField(
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    CustomFormField(
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
                    backgroundColor: const Color(0xFF0B8FAC),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Row(
                            children: [
                              Text(
                                "Data Berhasil Disimpan",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              Spacer(),
                              Icon(
                                Icons.check_circle,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          elevation: 10,
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          backgroundColor: const Color(0xFF07BC1B7),
                        ),
                      );
                      Future.delayed(const Duration(seconds: 1), () {
                        Get.toNamed("/Homepage");
                      });
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
              ),
            ],
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
  });
  final Icon icon;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          icon.icon,
          color: const Color(0xFF0B8FAC),
        ),
      ),
      validator: validator,
    );
  }
}
