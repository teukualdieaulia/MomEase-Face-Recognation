import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectrekammedis/Component/AppColor.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

class Bottomnavigation extends StatelessWidget {
  const Bottomnavigation({super.key, required this.currentIndex});
  final int currentIndex;
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Get.toNamed('/Homepage');
        break;
      case 1:
        Get.toNamed('/Riwayatpage');
        break;
      case 2:
        Get.toNamed('/Keluhanpage');
        break;
      case 3:
        Get.toNamed('/Jadwalpage');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
        backgroundColor: Appcolor.Card,
        itemShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        selectedItemColor: Appcolor.Secondary,
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        items: [
          SalomonBottomBarItem(
              icon: Icon(
                Icons.home,
                color: Appcolor.Secondary,
              ),
              title: Text(
                'Home',
                style: TextStyle(color: Appcolor.Secondary),
              )),
          SalomonBottomBarItem(
              icon: Icon(Icons.history, color: Appcolor.Secondary),
              title: Text(
                'Riwayat',
                style: TextStyle(color: Appcolor.Secondary),
              )),
          SalomonBottomBarItem(
              icon: Icon(Icons.question_answer, color: Appcolor.Secondary),
              title: Text(
                'kuisioner',
                style: TextStyle(color: Appcolor.Secondary),
              )),
          SalomonBottomBarItem(
              icon: Icon(Icons.calendar_month, color: Appcolor.Secondary),
              title: Text(
                'Jadwal',
                style: TextStyle(color: Appcolor.Secondary),
              )),
        ]);
  }
}
















// import 'package:flutter/material.dart';
// import 'path/to/bottom_nav_bar.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Home")),
//       body: Center(child: Text("Home Page")),
//       bottomNavigationBar: BottomNavBar(currentIndex: 0), // Index untuk halaman Home
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'path/to/bottom_nav_bar.dart';

// class SearchPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Search")),
//       body: Center(child: Text("Search Page")),
//       bottomNavigationBar: BottomNavBar(currentIndex: 1), // Index untuk halaman Search
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'path/to/bottom_nav_bar.dart';

// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Profile")),
//       body: Center(child: Text("Profile Page")),
//       bottomNavigationBar: BottomNavBar(currentIndex: 2), // Index untuk halaman Profile
//     );
//   }
// }


// import 'dart:convert';
// import 'dart:io';

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   CameraController? controller;
//   bool isProcessing = false;

//   @override
//   void initState() {
//     super.initState();
//     initializeCamera();
//   }

//   Future<void> initializeCamera() async {
//     final cameras = await availableCameras();
//     controller = CameraController(cameras[1], ResolutionPreset.high);
//     await controller!.initialize();
//   }

//   Future<void> verifyFace(String name) async {
//     try {
//       // Mulai loading indikator
//       setState(() {
//         isProcessing = true;
//       });

//       // Ambil gambar menggunakan kamera
//       final image = await controller!.takePicture();
//       final imagePath = image.path;

//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse('http://YOUR_SERVER_IP:5000/verify'),
//       );
//       request.files.add(await http.MultipartFile.fromPath('image', imagePath));
//       request.fields['name'] = name; // Kirim nama akun sebagai parameter

//       // Kirim request ke server
//       final response = await request.send();
//       final responseData = await response.stream.bytesToString();
//       final responseJson = json.decode(responseData);

//       // Hentikan loading indikator
//       setState(() {
//         isProcessing = false;
//       });

//       if (responseJson['status'] == 'success') {
//         Get.snackbar("Success", "Wajah terdeteksi cocok",
//             backgroundColor: Colors.green,
//             colorText: Colors.white,
//             icon: Icon(Icons.check));
//         Get.offAllNamed("/Biodatapage");
//       } else {
//         Get.snackbar("Error", "Wajah tidak cocok",
//             backgroundColor: Colors.red,
//             colorText: Colors.white,
//             icon: Icon(Icons.error));
//       }
//     } catch (e) {
//       setState(() {
//         isProcessing = false;
//       });
//       print("Error verifying face: $e");
//       Get.snackbar("Error", "Gagal verifikasi wajah",
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//           icon: Icon(Icons.error));
//     }
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Login"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             if (controller != null && controller!.value.isInitialized)
//               AspectRatio(
//                 aspectRatio: controller!.value.aspectRatio,
//                 child: CameraPreview(controller!),
//               )
//             else
//               const CircularProgressIndicator(),
//             ElevatedButton(
//               onPressed: isProcessing
//                   ? null
//                   : () {
//                       verifyFace(
//                           "user_account_name"); // Ganti dengan nama akun sebenarnya
//                     },
//               child: const Text("Verify Face"),
//             ),
//             if (isProcessing)
//               const CircularProgressIndicator(), // Tampilkan loading indicator saat proses berjalan
//           ],
//         ),
//       ),
//     );
//   }
// }



// import firebase_admin
// from firebase_admin import credentials, storage
// from flask import Flask, request, jsonify
// from deepface import DeepFace
// import os

// # Inisialisasi Firebase
// cred = credentials.Certificate("path/to/your-firebase-adminsdk.json")
// firebase_admin.initialize_app(cred, {
//     'storageBucket': 'your-project-id.appspot.com'
// })

// app = Flask(__name__)

// # Folder untuk menyimpan gambar sementara
// UPLOAD_FOLDER = 'uploads'
// os.makedirs(UPLOAD_FOLDER, exist_ok=True)

// def download_image_from_firebase(account_name):
//     bucket = storage.bucket()
//     blob = bucket.blob(f'Users/Pasien/{account_name}.jpg')
//     download_path = os.path.join(UPLOAD_FOLDER, f'{account_name}.jpg')
//     blob.download_to_filename(download_path)
//     return download_path

// @app.route('/verify', methods=['POST'])
// def verify_face():
//     file = request.files['image']
//     account_name = request.form['name']

//     # Simpan gambar yang diunggah dari pengguna
//     img_path = os.path.join(UPLOAD_FOLDER, file.filename)
//     file.save(img_path)

//     try:
//         # Unduh gambar terdaftar dari Firebase
//         registered_img_path = download_image_from_firebase(account_name)
        
//         # Lakukan verifikasi menggunakan DeepFace
//         result = DeepFace.verify(img1_path=img_path, img2_path=registered_img_path)
//         if result['verified']:
//             response = {'status': 'success', 'message': 'Face matched'}
//         else:
//             response = {'status': 'failure', 'message': 'Face not matched'}
//     except Exception as e:
//         response = {'status': 'error', 'message': str(e)}

//     # Hapus gambar sementara
//     os.remove(img_path)
//     os.remove(registered_img_path)

//     return jsonify(response)

// if __name__ == '__main__':
//     app.run(host='0.0.0.0', port=5000)
