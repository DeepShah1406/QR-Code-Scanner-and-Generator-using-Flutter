import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Text txt1 = const Text('QR Code App');
    AppBar ab =  AppBar(title: txt1);

    Text txt2 = const Text('Scan QR Code');
    ElevatedButton elebtn1 = ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/scan');
        },
        child: txt2
    );

    Text txt3 = const Text('Generate QR Code');
    ElevatedButton elebtn2 = ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/generate');
        },
        child: txt3
    );
    Column cl = Column(mainAxisAlignment: MainAxisAlignment.center, children: [elebtn1, elebtn2]);

    Center cnt = Center(child: cl);
    Scaffold sf = Scaffold(appBar: ab, body: cnt);
    return sf;
  }
}