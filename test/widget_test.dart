import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:camera/camera.dart'; // Untuk mengakses CameraDescription
import 'package:kamera_test/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Buat CameraDescription palsu untuk pengujian, dengan menambahkan sensorOrientation
    final mockCamera = CameraDescription(
      name: 'mock_camera',
      lensDirection: CameraLensDirection.back,
      sensorOrientation: 0,  // Tambahkan parameter sensorOrientation
    );

    // Build aplikasi dengan memberikan mockCamera sebagai argumen
    await tester.pumpWidget(MyApp(camera: mockCamera));

    // Verifikasi bahwa counter dimulai dari 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap ikon '+' dan trigger frame
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifikasi bahwa counter meningkat
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
