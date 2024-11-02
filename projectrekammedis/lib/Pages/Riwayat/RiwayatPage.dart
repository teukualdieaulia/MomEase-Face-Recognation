import 'package:flutter/material.dart';

import '../../Component/NavBattom.dart';

class Riwayatpage extends StatefulWidget {
  const Riwayatpage({super.key});

  @override
  State<Riwayatpage> createState() => _RiwayatpageState();
}

class _RiwayatpageState extends State<Riwayatpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: Bottomnavigation(currentIndex: 1),
      body: Center(
        child: Text("Riwayat"),
      ),
    );
  }
}
