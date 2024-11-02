import 'package:flutter/material.dart';

class Profilpage extends StatefulWidget {
  const Profilpage({super.key});

  @override
  State<Profilpage> createState() => _JadwalpageState();
}

class _JadwalpageState extends State<Profilpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // bottomNavigationBar: Bottomnavigation(currentIndex: ,),
      body: Center(
        child: Text("Profil"),
      ),
    );
  }
}
