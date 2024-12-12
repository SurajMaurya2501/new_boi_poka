// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

// class BookScannerScreen extends StatefulWidget {
//   @override
//   _BookScannerScreenState createState() => _BookScannerScreenState();
// }

// class _BookScannerScreenState extends State<BookScannerScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   late QRViewController controller;

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Book Scanner")),
//       body: QRView(
//         key: qrKey,
//         onQRViewCreated: _onQRViewCreated,
//       ),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       if (scanData.code != null) {
//         // Pop the scanner screen and display ISBN
//         Navigator.pop(context, scanData.code);
//       }
//     });
//   }
// }
