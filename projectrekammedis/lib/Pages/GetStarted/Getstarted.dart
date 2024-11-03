import 'dart:ui';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:projectrekammedis/Component/AppColor.dart';

class Getstarted extends StatefulWidget {
  const Getstarted({super.key});

  @override
  State<Getstarted> createState() => _GetstartedState();
}

class _GetstartedState extends State<Getstarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.Primary,
      body: Stack(children: [
        Positioned.fill(
            left: 70,
            top: -400,
            child: Image.asset(
              "Images/BackGround.png",
            )),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            color: Appcolor.textPrimary.withOpacity(0.3),
            child: Padding(
                padding:
                    EdgeInsets.only(top: 50, bottom: 30, left: 20, right: 20),
                child: Column(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MomEase membantu Anda memantau kesehatan kehamilan dengan mudah, mulai dari:",
                        style: TextStyle(
                            color: Appcolor.textPrimary, fontSize: 30),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 8,
                            color: Appcolor.textPrimary,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "jadwal kontrol",
                            style: TextStyle(
                                color: Appcolor.textPrimary, fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 8,
                            color: Appcolor.textPrimary,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "perkembangan janin",
                            style: TextStyle(
                                color: Appcolor.textPrimary, fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 8,
                            color: Appcolor.textPrimary,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "hingga catatan medis penting",
                            style: TextStyle(
                                color: Appcolor.textPrimary, fontSize: 20),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 3,
                        child: Image.asset("Images/IbuSusu.png"),
                      ),
                    ],
                  ),
                  Spacer(),
                  Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Appcolor.Secondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: () {},
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  color: Appcolor.Primary, fontSize: 17),
                            ))),
                  )
                ])),
          ),
        ),
      ]),
    );
  }
}
