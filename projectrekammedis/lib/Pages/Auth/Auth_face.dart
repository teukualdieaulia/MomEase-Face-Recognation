import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthFace extends StatefulWidget {
  const AuthFace({super.key});

  @override
  State<AuthFace> createState() => _AuthFaceState();
}

class _AuthFaceState extends State<AuthFace> {
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

      final mage = image.path;

      return File(mage);
    } catch (e) {
      return null;
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
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height /
                                  controller!.value.aspectRatio,
                              child: CameraPreview(controller!),
                            ),
                            SizedBox(
                              height: 40,
                            ),
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
