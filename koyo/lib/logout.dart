import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:koyo/main.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Bar(title: 'ログアウト'),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Theme.of(context).primaryColor),
              ),
              onPressed: () async {
                final googleCurrentUser =
                    GoogleSignIn().currentUser ?? await GoogleSignIn().signIn();
                if (googleCurrentUser != null){
                  await GoogleSignIn().disconnect();
                  await googleSignIn.signOut();
                  }
              },
              child: const Text(
                'ログアウト',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ]),
        ));
  }
}
