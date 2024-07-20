import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:koyo/home/ticket.dart';
import 'package:koyo/home/ticketoverlay.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Mobilescan extends StatefulWidget {
  const Mobilescan({super.key});

  @override
  State<Mobilescan> createState() => _MobilescanState();
}

class _MobilescanState extends State<Mobilescan> {
  List<String> classlist = ['101','102','103','104','105','106','107','108','109','201','202','203','204','205','206','207','208','209'];
  String errormessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        extendBodyBehindAppBar: true,
        body: Column(children: <Widget>[
          Expanded(
              flex: 2,
              child: Stack(
                children: [
                  MobileScanner(
                    controller: MobileScannerController(
                      detectionSpeed:
                          DetectionSpeed.noDuplicates, // 同じ QR コードを連続でスキャンさせない
                    ),
                    onDetect: (capture) async {
                      setState(() {
                        errormessage = '';
                      });
                      // QR コード検出時の処理
                      final List<Barcode> barcodes = capture.barcodes;
                      final value = barcodes[0].rawValue;
                      var randomCode = await FirebaseFirestore.instance.collection('Ticket').doc('randomCode').get();
                      final classname = value!.substring(16);
                      //firestore内のパスワードと一致していて、クラス名が存在したら
                      if (value.startsWith(randomCode['code'].toString()) && classlist.contains(classname)) {
                        if  (context.mounted) {
                          Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => Ticket(classname: classname)),);
                        }
                      } else {
                        setState(() {
                          errormessage = '※このQRコードは無効です';
                        });
                      }
                    }
                  ),
                  QRScannerOverlay(
                      overlayColour: Colors.black.withOpacity(0.5)),
                ],
              )),
          Expanded(
              flex: 1,
              child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('スタッフに提示されたQRコードを読み取ってください'),
                        const SizedBox(height: 10,),
                        Text(errormessage),
                      ])))
        ]));
  }
}
