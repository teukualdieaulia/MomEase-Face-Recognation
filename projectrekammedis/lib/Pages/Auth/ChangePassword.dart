import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:projectrekammedis/Component/AppColor.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.Primary,
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text("Reset Password",
                      style: TextStyle(
                          height: 1,
                          color: Appcolor.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 45)),
                  SizedBox(height: 10),
                  Text(
                    "Please enter your email address to request a password reset",
                    style: TextStyle(fontSize: 15, color: Appcolor.textPrimary),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                        fontSize: 15,
                        color: Appcolor.textPrimary,
                        fontWeight: FontWeight.bold),
                  ),
                  TextField(
                      style: TextStyle(color: Appcolor.textPrimary),
                      cursorColor: Appcolor.textPrimary,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          suffixIcon: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Appcolor.Primary,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                  ),
                                ]),
                            child: Icon(
                              Icons.check_circle,
                              color: Appcolor.Card,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Appcolor.textPrimary),
                          ))),
                  SizedBox(height: 5),
                  Text(
                    "Password reset sent to yout email address",
                    style: TextStyle(fontSize: 15, color: Appcolor.textPrimary),
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: Appcolor.textPrimary),
                        onPressed: () {
                          Get.offNamed("/Checkyouremail");
                        },
                        child: Text(
                          "Send reset password",
                          style: TextStyle(color: Appcolor.Primary),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("you remember your password ?",
                          style: TextStyle(color: Appcolor.textPrimary)),
                      TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {},
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Appcolor.textPrimary,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ])),
          )),
    );
  }
}
