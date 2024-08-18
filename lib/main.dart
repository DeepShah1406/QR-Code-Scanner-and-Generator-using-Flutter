import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'qr_scanner.dart';
import 'qr_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    ThemeData td = ThemeData(primarySwatch: Colors.blue);
    MaterialApp m = MaterialApp(title: 'QR Code App', theme: td, debugShowCheckedModeBanner: false, initialRoute: '/', routes: {
      '/': (context) => const HomeScreen(),
      '/scan': (context) => const QRScannerScreen(),
      '/generate': (context) => const QRGeneratorScreen()
    });
    return m;
  }
}