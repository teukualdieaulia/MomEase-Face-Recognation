import 'package:flutter/material.dart';

import '../../Component/NavBattom.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: Bottomnavigation(currentIndex: 4),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
