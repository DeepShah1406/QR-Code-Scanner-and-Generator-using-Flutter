import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGeneratorScreen extends StatefulWidget {
  const QRGeneratorScreen({super.key});

  @override
  QRGeneratorScreenState createState() => QRGeneratorScreenState();
}

class QRGeneratorScreenState extends State<QRGeneratorScreen> {
  final TextEditingController textController = TextEditingController();
  String? qrData;

  @override
  Widget build(BuildContext context) {

    Text txt1 = const Text('Generate QR Code');
    AppBar ab = AppBar(title: txt1);

    InputDecoration indeco = const InputDecoration(labelText: 'Enter text to generate QR code');
    TextField txtf = TextField(controller: textController, decoration: indeco);

    SizedBox sb1 = const SizedBox(height: 20);

    Text txt2 = const Text('Generate QR Code');
    ElevatedButton elebtn = ElevatedButton(onPressed: () {
      setState(() {
        qrData = textController.text;
      });
    },child: txt2);
    SizedBox sb2 = const SizedBox(height: 20);

    //Container ct = Container();

    Column cl = Column(children: [txtf, sb1, elebtn, sb2,
      if (qrData != null)
        QrImageView(
          data: qrData!,
          version: QrVersions.auto,
          size: 200.0,
        )
    ]);

    Padding pd = Padding(padding: const EdgeInsets.all(16.0), child: cl);
    Scaffold sf = Scaffold(appBar: ab, body: pd);
    return sf;
  }
}