import 'package:flutter/material.dart';
import 'dart:io'; // Untuk menggunakan File

class DisplayPictureScreen extends StatelessWidget {
  final File imageFile;  // Gunakan File bukan XFile

  const DisplayPictureScreen({super.key, required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Picture'),
      ),
      body: Center(
        child: Image.file(imageFile), // Menampilkan gambar yang diambil
      ),
    );
  }
}
