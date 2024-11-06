import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectrekammedis/Pages/Auth_Detect_face/Auth_face.dart';
import 'Component/test.dart';
import 'Pages/Auth_Detect_face/login_face.dart';
import 'Pages/Biodata/BiodataPage.dart';
import 'Pages/GetStarted/Getstarted.dart';
import 'Pages/Home/HomePage.dart';
import 'Pages/Jadwal/JadwalPage.dart';
import 'Pages/Keluhan/KeluhanPage.dart';
import 'Pages/Login/Login.dart';
import 'Pages/Profil/EditProfil.dart';
import 'Pages/Profil/ProfilPage.dart';
import 'Pages/Riwayat/RiwayatPage.dart';
import 'Pages/Settings/SettingsPage.dart';
import 'Pages/Sign/Sign.dart';
import 'Pages/splashcren.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init(); // Inisialisasi GetStorage
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/Settingspage",
      defaultTransition: Transition.fadeIn,
      getPages: [
        GetPage(
            transition: Transition.fadeIn,
            name: "/sign",
            page: () => const Sign()),
        GetPage(
            transition: Transition.fadeIn,
            name: "/Splash",
            page: () => const Splashcren()),
        GetPage(
            transition: Transition.fadeIn,
            name: "/Login",
            page: () => const Login()),
        GetPage(
            transition: Transition.fadeIn,
            name: "/Homepage",
            page: () => const Homepage()),
        GetPage(
            transition: Transition.fadeIn,
            name: "/Biodatapage",
            page: () => Biodatapage()),
        GetPage(
            transition: Transition.fadeIn,
            name: "/AuthFace",
            page: () => AuthFace()),
        GetPage(
            transition: Transition.fadeIn,
            name: "/LoginFace",
            page: () => const LoginFace()),
        GetPage(
            transition: Transition.fadeIn,
            name: "/Profilpage",
            page: () => const Profilpage()),
        GetPage(
            transition: Transition.fadeIn,
            name: "/Settingspage",
            page: () => const Settingspage()),
        GetPage(
            transition: Transition.fadeIn,
            name: "/Riwayatpage",
            page: () => const Riwayatpage()),
        GetPage(
            transition: Transition.fadeIn,
            name: "/Keluhanpage",
            page: () => const Keluhanpage()),
        GetPage(
            transition: Transition.fadeIn,
            name: "/Jadwalpage",
            page: () => const Jadwalpage()),
        GetPage(
            transition: Transition.fadeIn,
            name: "/Test",
            page: () => const Test()),
        GetPage(
            transition: Transition.fadeIn,
            name: "/Getstarted",
            page: () => const Getstarted()),
        GetPage(
            transition: Transition.fadeIn,
            name: "/EditProfil",
            page: () => const EditProfil()),
      ],
    );
  }
}
