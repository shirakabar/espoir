import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:koyo/widget/widget.dart';


class Pdfview extends StatefulWidget {
  const Pdfview({super.key,required this.pdf, required this.title});
  final String pdf;
  final String title;

  @override
  State<Pdfview> createState() => _PdfviewState();
}

class _PdfviewState extends State<Pdfview> {
  File? file;

  @override
  void initState() {
    _load(widget.pdf).then((value) {
      setState(() {
        file = value;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(title: widget.title),
      body: file == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PDFView(
                filePath: file!.path,
              ),
            ),
    );
  }

  Future<File> _storeFile(String url, List<int> bytes) async {

    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);

    return file;
  }

  Future<File?> _load(String url) async {
    final data = await rootBundle.load(url);
    final bytes = data.buffer.asUint8List();

    return await _storeFile(url, bytes);
  }
}