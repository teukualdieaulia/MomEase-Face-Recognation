import 'dart:ui';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:projectrekammedis/Component/AppColor.dart';

class Getstarted extends StatefulWidget {
  const Getstarted({super.key});

  @override
  State<Getstarted> createState() => _GetstartedState();
}

class _GetstartedState extends State<Getstarted> {
  int _currentPage = 0;

  final _Pagecontroller = PageController();

  void _nextpage() {
    if (_currentPage == 2) {
      Get.offAllNamed("/Login");
    } else {
      _Pagecontroller.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.Primary,
      body: Stack(children: [
        Positioned(
            left: 30,
            top: 1,
            child: SizedBox(
              width: 500,
              height: 600,
              child: Image.asset(
                fit: BoxFit.cover,
                "Images/BackGround.png",
              ),
            )),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            color: Appcolor.textPrimary.withOpacity(0.2),
            child: Padding(
                padding:
                    EdgeInsets.only(top: 50, bottom: 30, left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: PageView(
                          controller: _Pagecontroller,
                          onPageChanged: (int page) {
                            setState(() {
                              _currentPage = page;
                            });
                          },
                          children: [
                            Slide_1(),
                            Slide_2(),
                            Slide_3(),
                          ]),
                    ),
                    SmoothPageIndicator(
                      controller: _Pagecontroller,
                      count: 3,
                      effect: WormEffect(
                        dotColor: Appcolor.textPrimary.withOpacity(0.3),
                        dotHeight: 5,
                        spacing: 15,
                        dotWidth: 15,
                        activeDotColor: Appcolor.Secondary,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Appcolor.Secondary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              onPressed: _nextpage,
                              child: Text(
                                _currentPage == 2 ? "Mulai" : "Selanjutnya",
                                style: TextStyle(
                                    color: Appcolor.Primary,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ))),
                    )
                  ]),
                )),
          ),
        ),
      ]),
    );
  }
}

class Slide_3 extends StatelessWidget {
  const Slide_3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        "Bagikan ke teman kalian , Untuk memantau kesehatan kehamilan dengan lebih mudah",
        style: TextStyle(
            color: Appcolor.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 40),
      Text("Mari mulai konsultasi dengan dokter kami di sini !",
          style: TextStyle(
            color: Appcolor.textPrimary,
            fontSize: 24,
            // fontWeight: FontWeight.bold),
          )),
      SizedBox(
        child: Image.asset("Images/Doctor_slide_3.png"),
      )
    ]);
  }
}

class Slide_2 extends StatelessWidget {
  const Slide_2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "MomEase dirancang dengan fitur-fitur unggulan untuk memastikan kenyamanan dan keamanan Anda dalam memantau kesehatan kehamilan",
          style: TextStyle(
              color: Appcolor.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2.9,
          child: Image.asset("Images/Slide-2.png"),
        ),
      ],
    );
  }
}

class Slide_1 extends StatelessWidget {
  const Slide_1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "MomEase membantu Anda memantau kesehatan kehamilan dengan mudah",
          style: TextStyle(
              color: Appcolor.textPrimary,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2.9,
          child: Image.asset("Images/IbuSusu.png"),
        ),
      ],
    );
  }
}
