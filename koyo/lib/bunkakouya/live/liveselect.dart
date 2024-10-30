import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/settings/koyo_icons.dart';

class Liveselect extends StatelessWidget {
  const Liveselect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Container(
            color: Colors.black,
            height: double.infinity,
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ライブモードを選択してください',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 30),
                  Livebutton(label: 'リズムモード', rout: '/rythm', icon: Icons.music_note),
                  SizedBox(height: 20),
                  Livebutton(label: 'ペンライトモード', rout: '/penlightselect', icon: Live.penlight)
                ],
              ),
            )));
  }
}

class Livebutton extends StatelessWidget {
  const Livebutton({super.key,required this.label,required this.rout,required this.icon});
  final String label;
  final String rout;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {
          context.push(rout);
        },
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(150, 150),
          shape: const CircleBorder(),
          backgroundColor: Colors.transparent,
          side: const BorderSide(color: Colors.white),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 70,
            ),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
