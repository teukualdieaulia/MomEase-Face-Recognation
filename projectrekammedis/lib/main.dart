import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectrekammedis/Pages/Auth_Detect_face/Auth_face.dart';
import 'Component/test.dart';
import 'Pages/Auth_Detect_face/login_face.dart';
import 'Pages/Biodata/BiodataPage.dart';
import 'Pages/Home/HomePage.dart';
import 'Pages/Jadwal/JadwalPage.dart';
import 'Pages/Keluhan/KeluhanPage.dart';
import 'Pages/Login/Login.dart';
import 'Pages/Profil/ProfilPage.dart';
import 'Pages/Riwayat/RiwayatPage.dart';
import 'Pages/Settings/SettingsPage.dart';
import 'Pages/Sign/Sign.dart';
import 'Pages/splashcren.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/Test",
      defaultTransition: Transition.fadeIn,
      getPages: [
        GetPage(name: "/sign", page: () => const Sign()),
        GetPage(name: "/Splash", page: () => const Splashcren()),
        GetPage(name: "/Login", page: () => const Login()),
        GetPage(name: "/Homepage", page: () => const Homepage()),
        GetPage(name: "/Biodatapage", page: () => Biodatapage()),
        GetPage(name: "/AuthFace", page: () => AuthFace()),
        GetPage(name: "/LoginFace", page: () => const LoginFace()),
        GetPage(name: "/Profilpage", page: () => const Profilpage()),
        GetPage(name: "/Settingspage", page: () => const Settingspage()),
        GetPage(name: "/Riwayatpage", page: () => const Riwayatpage()),
        GetPage(name: "/Keluhanpage", page: () => const Keluhanpage()),
        GetPage(name: "/Jadwalpage", page: () => const Jadwalpage()),
        GetPage(name: "/Test", page: () => const Test()),
      ],
    );
  }
}
