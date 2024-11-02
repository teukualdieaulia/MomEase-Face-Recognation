import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
        actions: [
          PopupMenuButton(
            position: PopupMenuPosition.under,
            icon: CircleAvatar(
              radius: 12,
              backgroundColor: const Color(0xFF0B8FAC).withOpacity(0.4),
              child: const CircleAvatar(
                radius: 10,
                backgroundImage: AssetImage("Images/User/foto_rizki.png"),
              ),
            ),
            itemBuilder: (context) => <PopupMenuEntry>[
              PopupMenuItem(
                  child: ListTile(
                onTap: () => Get.toNamed('/Jadwalpage'),
                title: Text("Profil"),
                leading: Icon(Icons.person, color: Color(0XFF0B8FAC)),
                trailing: Icon(Icons.chevron_right),
              )),
              PopupMenuItem(
                  child: SizedBox(
                width: 200,
                child: ListTile(
                  onTap: () => Get.toNamed('/Keluhanpage'),
                  title: Text("Pengaturan"),
                  leading: Icon(Icons.settings, color: Color(0XFF0B8FAC)),
                  trailing: Icon(Icons.chevron_right),
                ),
              )),
              PopupMenuItem(
                  child: ListTile(
                onTap: () => Get.toNamed('/Biodatapage'),
                title: Text("About"),
                leading: Icon(
                  Icons.info,
                  color: Color(0XFF0B8FAC),
                ),
                trailing: Icon(Icons.chevron_right),
              )),
              PopupMenuDivider(),
              PopupMenuItem(
                  child: ListTile(
                onTap: () => Get.toNamed('/Login'),
                title: Text("Logout"),
                leading: Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
                trailing: Icon(Icons.chevron_right),
              )),
            ],
          ),
        ],
      ),
      body: Center(child: Text("Test")),
    );
  }
}
