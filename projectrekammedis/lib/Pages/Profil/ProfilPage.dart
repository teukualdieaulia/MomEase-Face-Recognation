import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:projectrekammedis/Component/AppColor.dart';

class Profilpage extends StatefulWidget {
  const Profilpage({super.key});

  @override
  State<Profilpage> createState() => _JadwalpageState();
}

class _JadwalpageState extends State<Profilpage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final box = GetStorage();
  Map<String, dynamic>? userData;
  bool isLoading = true;
  bool isEditing = false;
  String? imageUrl;
  void initState() {
    super.initState();

    AmbilDataGambar();
  }

  Future<void> AmbilDataGambar() async {
    try {
      userData = box.read("userData");
      if (userData != null && userData!['email'] != null) {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('/Users/Pasien/${userData!['email']}.jpg');
        final url = await storageRef.getDownloadURL();
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.Primary,
      appBar: AppBar(
        backgroundColor: Appcolor.Card,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
            icon: Icon(
              Icons.edit,
              color: Appcolor.textPrimary,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Appcolor.textPrimary,
          ),
        ),
        title:
            const Text("Profil", style: TextStyle(color: Appcolor.textPrimary)),
      ),
      // bottomNavigationBar: Bottomnavigation(currentIndex: ,),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          child: CircleAvatar(
                            radius: 85,
                            backgroundColor: Appcolor.Card,
                            child: isLoading
                                ? CircularProgressIndicator()
                                : imageUrl != null
                                    ? CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(imageUrl!),
                                        radius: 80,
                                      )
                                    : CircleAvatar(
                                        radius: 80,
                                        child: Icon(
                                          Icons.person,
                                          size: 40,
                                        ),
                                      ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        readOnly: isEditing,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Appcolor.Card, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: "${userData?['name']}"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        readOnly: isEditing,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: "${userData?['email']}"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        readOnly: isEditing,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: "${userData?['phone']}"),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolor.Secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () {},
                      child: Text(
                        "Simpan perubahaan",
                        style: TextStyle(
                            fontSize: 17,
                            color: Appcolor.Primary,
                            fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
