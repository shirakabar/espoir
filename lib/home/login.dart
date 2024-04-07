import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:koyo/main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 final GoogleSignIn googleSignIn = GoogleSignIn();
  var googleProvider = GoogleAuthProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Bar(title: 'ログイン'),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Theme.of(context).primaryColor),
              ),
              onPressed: () => signInWithGoogle(),
              child: const Text(
                '向陽生はこちら',
                style: TextStyle(fontSize: 20),
              ),
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Theme.of(context).primaryColor),
                ),
                onPressed: () => _onSignInWithAnonymousUser(),
                child: const Text(
                  '向陽生以外の方はこちら',
                  style: TextStyle(fontSize: 20),
                ))
          ]),
        ));
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
    }

  Future<void> _onSignInWithAnonymousUser() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try{
      await firebaseAuth.signInAnonymously();
    } catch(e) {
      if (!context.mounted) return;
      await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('エラー'),
              content: Text(e.toString()),
            );
          }
      );
    }
  }
}
