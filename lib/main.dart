import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // Untuk akses kamera
import 'takepicture_screen.dart'; // Ganti dengan file TakePictureScreen Anda

Future<void> main() async {
  // Pastikan Flutter binding sudah siap
  WidgetsFlutterBinding.ensureInitialized();

  // Mendapatkan daftar kamera yang tersedia
  final cameras = await availableCameras();

  // Pilih kamera pertama (biasanya kamera belakang)
  final firstCamera = cameras.first;

  // Mulai aplikasi setelah inisialisasi selesai
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  const MyApp({super.key, required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Camera App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      home: TakePictureScreen(camera: camera), // Gunakan TakePictureScreen
    );
  }
}
