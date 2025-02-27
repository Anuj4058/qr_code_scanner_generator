import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({Key? key}) : super(key: key);

  @override
  _ScanQRCodeState createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrresult = 'Scanned Data will appear here';
  Future<void> scanQR()async{
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666','Cancel',true, ScanMode.QR);
      if(!mounted)return;
      setState(() {
        this.qrresult = qrCode.toString();
      });

    }on PlatformException{
      qrresult = 'Fail to read QR Code';
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Qr Code Scanner'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text('$qrresult',style: TextStyle(color: Colors.black),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: scanQR, child: Text('Scan Code'))
          ],
        ),
      ),
    );
  }
}
