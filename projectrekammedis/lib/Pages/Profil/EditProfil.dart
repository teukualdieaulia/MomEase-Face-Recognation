import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projectrekammedis/Component/AppColor.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({super.key});

  @override
  State<EditProfil> createState() => _JadwalpageState();
}

class _JadwalpageState extends State<EditProfil> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final box = GetStorage();
  Map<String, dynamic>? userData;
  void initState() {
    super.initState();
    userData = box.read("userData");
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
            onPressed: () {},
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
                            child: CircleAvatar(
                              radius: 80,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: "Name",
                            labelText: "${userData?['name']}"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: "Email",
                            labelText: "${userData?['email']}"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            hintText: "No Hp",
                            labelText: "${userData?['phone']}"),
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
