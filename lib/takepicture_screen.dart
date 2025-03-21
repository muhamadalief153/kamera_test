import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // Kamera
import 'dart:io'; // Untuk menggunakan File
import 'displaypicture_screen.dart'; // Ke file DisplayPictureScreen Anda

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({super.key, required this.camera});

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a Picture'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            final imageFile = File(image.path); // Mengubah XFile ke File
            // Pindah ke layar DisplayPictureScreen
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imageFile: imageFile),
              ),
            );
          } catch (e) {
            print('Error: $e');
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
