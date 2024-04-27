import 'package:flutter/material.dart';
import 'package:koyo/widget.dart';
import 'package:google_fonts/google_fonts.dart';
//カミングすーん

class Come extends StatelessWidget {
  const Come({super.key});

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const Bar(title: '準備中'),
      body: Center(
        child:Text('''coming 
           soon...''',
           style: GoogleFonts.ptSerif(
            color: Theme.of(context).primaryColor, fontWeight: FontWeight.w700, fontSize : 30, fontStyle: FontStyle.italic
            ),
      )
      )
    );
  }
}