import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:projectrekammedis/Component/AppColor.dart';

import '../Auth_Detect_face/Auth_face.dart';
import '../Login/Login.dart';

class Sign extends StatefulWidget {
  const Sign({super.key});

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference? users;
  File? result;

  bool isDialogOpen = true;

  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  final FocusNode _phoneFocusNode = FocusNode();
  bool _isFieldFocused = false;

  @override
  void initState() {
    super.initState();
    users = firestore.collection('users');
    _phoneFocusNode.addListener(() {
      setState(() {
        _isFieldFocused = _phoneFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    super.dispose();
  }

  Future<void> _uploadImageToFirebase(File imageFile) async {
    try {
      // Simpan gambar di path spesifik
      String fileName = 'Users/Pasien/${_emailController.text}.jpg';

      // Upload ke Firebase Storage di path yang ditentukan
      await FirebaseStorage.instance.ref(fileName).putFile(imageFile);

      print("Image uploaded successfully to $fileName");
    } catch (e) {
      print('Failed to upload image: $e');
    }
  }

  void _ShowDialogProgress() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future<void> addUser() async {
    if (_formKey.currentState!.validate()) {
      final userData = {
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': '0${_phoneController.text}',
        'password': _passwordController.text
      };
      try {
        _ShowDialogProgress();
        final chekUsername =
            await users?.where('name', isEqualTo: _nameController.text).get();
        final chekEmail =
            await users?.where('email', isEqualTo: _emailController.text).get();
        if (chekUsername!.docs.isNotEmpty) {
          _showErrorDialog("Username telah digunakan");
          Navigator.of(context).pop();
        } else if (chekEmail!.docs.isNotEmpty) {
          _showErrorDialog("Email telah digunakan");
          Navigator.of(context).pop();
        } else {
          if (result != null) {
            await _uploadImageToFirebase(File(result!.path));
          } else {
            _showErrorDialog("Wajah belum terdaftar");

            return; // Menghentikan eksekusi jika gambar wajah belum terdaftar
          }
          await users?.add(userData);
          _showSuccessDialog("Akun Berhasil");
          Navigator.of(context).pop();
          Get.toNamed("/Login");
        }
      } catch (e) {
        Navigator.of(context).pop();
        print("Error: $e");
      } finally {
        // Pastikan dialog progress ditutup
        Navigator.of(context).pop();
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
      Get.offAll(() => const Login());
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Appcolor.Primary,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Appcolor.textPrimary,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Nama pasien",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Appcolor.textPrimary),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            style: const TextStyle(color: Appcolor.textPrimary),
                            controller: _nameController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Appcolor.Secondary,
                                    width: 2,
                                  )),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon:
                                  Icon(Icons.person, color: Appcolor.Secondary),
                              hintText: "Masukan username",
                              hintStyle: const TextStyle(color: Colors.grey),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Masukan username";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Email",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Appcolor.textPrimary),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            style: const TextStyle(color: Appcolor.textPrimary),
                            controller: _emailController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Appcolor.Secondary,
                                    width: 2,
                                  )),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon:
                                  Icon(Icons.email, color: Appcolor.Secondary),
                              hintStyle: const TextStyle(color: Colors.grey),
                              hintText: "Masukan Email",
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Masukan Email";
                              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return "Format email tidak valid";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "No. Telp",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Appcolor.textPrimary),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            style: const TextStyle(color: Appcolor.textPrimary),
                            controller: _phoneController,
                            focusNode: _phoneFocusNode,
                            inputFormatters: [PhoneNumberFormatter()],
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              prefixIcon: const Icon(Icons.phone,
                                  color: Appcolor.Secondary),
                              hintStyle: const TextStyle(color: Colors.grey),
                              prefixStyle: const TextStyle(
                                  color: Appcolor.textPrimary, fontSize: 15),
                              hintText:
                                  _isFieldFocused ? null : "Masukan No.Telp",
                              prefixText: _isFieldFocused ? "+62 " : null,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Appcolor.Secondary, width: 2),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Masukan no.telp";
                              }
                              String cleanedValue = value.replaceAll('-', '');
                              String formattedValue =
                                  cleanedValue.startsWith('8')
                                      ? '+62$cleanedValue'
                                      : cleanedValue;

                              if (!RegExp(r'^\+628[1-9][0-9]{7,10}$')
                                  .hasMatch(formattedValue)) {
                                return "Format no.telp tidak valid";
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Appcolor.textPrimary),
                          ),
                          const SizedBox(height: 5),
                          TextFormField(
                            style: const TextStyle(color: Appcolor.textPrimary),
                            controller: _passwordController,
                            obscureText: _isObscure,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Appcolor.Secondary,
                                    width: 2,
                                  )),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              hintText: "Masukan password",
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Appcolor.Secondary,
                              ),
                              hintStyle: const TextStyle(color: Colors.grey),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                color: Appcolor.Secondary,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Masukan password";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text("Daftar wajah",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Appcolor.textPrimary)),
                              SizedBox(
                                width: 6,
                              ),
                              result == null
                                  ? Icon(
                                      Icons.error,
                                      color: Colors.red,
                                      size: 15,
                                    )
                                  : Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 15,
                                    )
                            ],
                          ),
                          SizedBox(
                            width: 400,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () async {
                                  await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          backgroundColor: Appcolor.Card,
                                          elevation: 10,
                                          title: Center(
                                            child: Text(
                                              "Face ID",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Appcolor.textPrimary),
                                            ),
                                          ),
                                          content: SizedBox(
                                            height: 200,
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Daftar wajah anda untuk keamanan yang lebih baik",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color:
                                                          Appcolor.textPrimary,
                                                      fontSize: 12),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  height: 70,
                                                  width: 70,
                                                  child: Image.asset(
                                                      "Images/Logo/Face_Id.png"),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Appcolor.Secondary,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  onPressed: () async {
                                                    result = await Get.to(
                                                        () => AuthFace());

                                                    Navigator.of(context).pop();
                                                    if (result != null) {
                                                      setState(() {
                                                        isDialogOpen = false;
                                                      });
                                                      // Tampilkan dialog baru dengan pesan berhasil
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                              backgroundColor:
                                                                  Appcolor.Card,
                                                              elevation: 10,
                                                              title: Text(
                                                                "Berhasil",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .green,
                                                                ),
                                                              ),
                                                              content: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Text(
                                                                    "Daftar wajah berhasil",
                                                                    style: TextStyle(
                                                                        color: Appcolor
                                                                            .textPrimary),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  ),
                                                                  SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Image.asset(
                                                                      "Images/Logo/Check.png",
                                                                      width: 70,
                                                                      height:
                                                                          70),
                                                                ],
                                                              ));
                                                        },
                                                      );
                                                    }
                                                  },
                                                  child: Text("Face ID",
                                                      style: TextStyle(
                                                          color: Appcolor
                                                              .Primary)),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Appcolor.Card,
                                  ),
                                  child: Image.asset(
                                    "Images/Logo/Face_Id.png",
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ),
                          const SizedBox(height: 15),
                          Center(
                            child: SizedBox(
                              height: 200,
                              child: Image.asset("Images/sign_1.png"),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Sudah punya akun?",
                                style: TextStyle(
                                  color: Appcolor.textPrimary,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed('/Login');
                                },
                                child: const Text(
                                  "Login sekarang",
                                  style: TextStyle(
                                    color: Appcolor.Secondary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SubmitButton(
                            addUser: addUser,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formatted = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (formatted.length > 3) {
      formatted = '${formatted.substring(0, 3)}-${formatted.substring(3)}';
    }
    if (formatted.length > 8) {
      formatted = '${formatted.substring(0, 8)}-${formatted.substring(8)}';
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.addUser});

  final VoidCallback addUser;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Appcolor.Secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: addUser,
        child: const Text(
          "Daftar sekarang",
          style: TextStyle(color: Appcolor.Primary, fontSize: 17),
        ),
      ),
    );
  }
}
