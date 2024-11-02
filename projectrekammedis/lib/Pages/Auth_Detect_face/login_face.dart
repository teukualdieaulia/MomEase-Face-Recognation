import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class LoginFace extends StatefulWidget {
  const LoginFace({super.key});

  @override
  State<LoginFace> createState() => _LoginFaceState();
}

class _LoginFaceState extends State<LoginFace> {
  CameraController? controller;
  bool isTakingPicture = false;

  Future<void> initialCamera() async {
    var cameras = await availableCameras();
    controller = CameraController(cameras[1], ResolutionPreset.max);
    await controller!.initialize();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  Future<File?> takePicture() async {
    try {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          });
      final image = await controller!.takePicture();
      Navigator.of(context).pop();

      // Kembalikan file gambar ke halaman sebelumnya
      return File(image.path);
    } catch (e) {
      print("Error: $e");
      Navigator.of(context).pop(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: initialCamera(),
          builder: (_, snapshot) =>
              (snapshot.connectionState == ConnectionState.done)
                  ? Stack(children: [
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height /
                                controller!.value.aspectRatio,
                            child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationY(3.14159),
                                child: CameraPreview(controller!)),
                          ),
                          SizedBox(height: 40),
                          Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Color(0XFF0B8FAC),
                                  shape: BoxShape.circle),
                              child: IconButton(
                                  onPressed: () async {
                                    if (!isTakingPicture &&
                                        !controller!.value.isTakingPicture) {
                                      final result = await takePicture();
                                      Navigator.pop(context, result);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                    size: 40,
                                  ))),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height /
                            controller!.value.aspectRatio,
                        child: Image.asset(
                          "Images/Logo/Layer.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ])
                  : Center(
                      child: SizedBox(
                          height: 23,
                          width: 23,
                          child: CircularProgressIndicator()),
                    ),
        ));
  }
}
