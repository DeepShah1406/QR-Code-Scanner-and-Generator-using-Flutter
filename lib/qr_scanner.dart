import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/services.dart';

class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  QRScannerScreenState createState() => QRScannerScreenState();
}

class QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? scannedData;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Text txt1 = const Text('Scan QR Code');
    AppBar ab = AppBar(title: txt1);

    QRView qrv = QRView(key: qrKey, onQRViewCreated: _onQRViewCreated);
    Expanded exp1 = Expanded(flex: 5, child: qrv);

    Text txt2 = const Text('Copy to Clipboard');
    ElevatedButton elebtn1 = ElevatedButton(onPressed: () {
          Clipboard.setData(ClipboardData(text: scannedData.toString()));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Copied to clipboard')),
          );
        }, child: txt2
    );

    Column cl1 = Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      if (scannedData != null)
        Text('Scanned Data: $scannedData')
      else
        const Text('Scan a QR code'),
      if (scannedData != null) elebtn1
    ]);
    Center cnt = Center(child: cl1);

    Expanded exp2 = Expanded(flex: 1, child: cnt);

    Column cl2 = Column(children: [exp1, exp2]);
    Scaffold sf = Scaffold(appBar: ab, body: cl2);
    return sf;
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedData = scanData.code;
      });
    });
  }
}