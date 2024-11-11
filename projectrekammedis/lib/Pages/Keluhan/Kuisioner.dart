import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectrekammedis/Component/AppColor.dart';

import '../../Component/NavBattom.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Kuisionerpage extends StatefulWidget {
  const Kuisionerpage({super.key});

  @override
  State<Kuisionerpage> createState() => _KuisionerpageState();
}

class _KuisionerpageState extends State<Kuisionerpage> {
  int currentIndex = 0;
  bool _isFinished = false;

  final PageController pageController = PageController();

  final List<Map<String, dynamic>> pertanyaanList = [
    {
      "question": "Berapa usia kandungan anda?",
      "options": ["0 - 3 bulan", "4 - 6 bulan", "7 - 9 bulan"]
    },
    {
      "question": "Apakah anda mengalami Kuisioner saat ini?",
      "options": ["Ya", "Tidak"]
    },
    {
      "question": "Sudah berapa kali melakukan pemeriksaan?",
      "options": ["1 kali", "2 kali", "Lebih dari 2 kali"]
    },
    {
      "question": "Apakah anda merasa demam?",
      "options": ["Ya", "Tidak"]
    },
    {
      "question": "Apakah anda merasa sesak?",
      "options": ["Ya", "Tidak"]
    },
    {
      "question": "Apakah anda merasa batuk?",
      "options": ["Ya", "Tidak"]
    },
    {
      "question": "Apakah anda merasa nyeri?",
      "options": ["Ya", "Tidak"]
    },
    {
      "question": "Apakah anda merasa lemas?",
      "options": ["Ya", "Tidak"]
    },
    {
      "question": "Apakah anda merasa sesak nafas?",
      "options": ["Ya", "Tidak"]
    },
    {
      "question": "Apakah anda merasa sakit kepala?",
      "options": ["Ya", "Tidak"]
    },
  ];

  Map<int, String?> selectedOptions = {};
  void _nextQuestion() {
    if (currentIndex < pertanyaanList.length - 1) {
      setState(() {
        currentIndex++;
      });
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      setState(() {
        _isFinished = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appcolor.Primary,
        bottomNavigationBar: Bottomnavigation(currentIndex: 2),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: _isFinished
              ? HalamanSelesaiKuisioner()
              : Column(
                  children: [
                    Container(
                      color: Appcolor.textPrimary,
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 30,
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 3.5),
                              Text(
                                "Kuisioner",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Image.asset("Images/Keluhan.png")
                        ],
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                          controller: pageController,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: pertanyaanList.length,
                          itemBuilder: (context, index) {
                            return SingleChildScrollView(
                              // color: Colors.amber,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Row(children: [
                                      Text(
                                        "${index + 1}/${pertanyaanList.length}",
                                        style: TextStyle(
                                            color: Appcolor.textPrimary,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(" Pertanyaan",
                                          style: TextStyle(
                                            color: Appcolor.textPrimary,
                                          ))
                                    ]),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Pertanyaan(
                                            selectedOption:
                                                selectedOptions[index],
                                            onOptionSelected: (value) {
                                              setState(() {
                                                selectedOptions[index] = value;
                                              });
                                            },
                                            title: pertanyaanList[index]
                                                ["question"],
                                            options: pertanyaanList[index]
                                                ["options"]),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                      height: 45,
                      margin: EdgeInsets.symmetric(horizontal: 13),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Appcolor.textPrimary,
                          borderRadius: BorderRadius.circular(10)),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor:
                                Colors.transparent, // Menghilangkan shadow
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8), // Sudut tombol mengikuti container
                            ),
                          ),
                          onPressed: _nextQuestion,
                          child: Text(
                            currentIndex + 1 == 10 ? "Selesai" : "Lanjut",
                            style: TextStyle(
                                color: Appcolor.Primary,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          )),
                    )
                  ],
                ),
        ));
  }
}

class HalamanSelesaiKuisioner extends StatelessWidget {
  const HalamanSelesaiKuisioner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          color: Appcolor.textPrimary,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Appcolor.Primary,
                      )),
                  SizedBox(width: MediaQuery.of(context).size.width / 5),
                  Text(
                    "Kuisioner selesai",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Appcolor.Primary),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CircularPercentIndicator(
                radius: 90,
                progressColor: Appcolor.Primary,
                backgroundColor: Colors.white10,
                lineWidth: 30,
                center: Text("10/10",
                    style: TextStyle(
                        color: Appcolor.Primary,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                animation: true,
                percent: 0.8,
                circularStrokeCap: CircularStrokeCap.round,
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Appcolor.textPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "10/10",
                  style: TextStyle(color: Colors.black45, fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Kuisioner telah selesai",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("terima kasih telah mengisi Kuisioner anda"),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Appcolor.Primary,
                      size: 14,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Selesai",
                      style: TextStyle(
                        color: Appcolor.Primary,
                      ),
                    )
                  ],
                )
              ],
            )),
        Spacer(),
        Container(
          height: 45,
          margin: EdgeInsets.symmetric(horizontal: 13),
          decoration: BoxDecoration(
              color: Appcolor.textPrimary,
              borderRadius: BorderRadius.circular(10)),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent, // Menghilangkan shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Sudut tombol mengikuti container
                ),
              ),
              onPressed: () {
                Get.toNamed("/Homepage");
              },
              child: Text(
                "Terima Kasih",
                style: TextStyle(color: Appcolor.Primary, fontSize: 17),
              )),
        )
      ],
    );
  }
}

class Pertanyaan extends StatelessWidget {
  final String title;
  final List<String> options;
  final String? selectedOption;
  final Function(String) onOptionSelected;

  const Pertanyaan(
      {super.key,
      required this.title,
      required this.options,
      this.selectedOption,
      required this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Appcolor.textPrimary),
        ),
        SizedBox(height: 20),
        ...options.map((option) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                tileColor: Appcolor.textPrimary,
                contentPadding: EdgeInsets.only(left: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text(
                  option,
                ),
                trailing: Radio(
                  activeColor: Appcolor.Primary,
                  value: option,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    onOptionSelected(value!);
                  },
                ),
              ),
            )),
      ],
    );
  }
}
