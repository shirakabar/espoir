import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:koyo/main.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 final GoogleSignIn googleSignIn = GoogleSignIn();
  // Googleアカウントの表示名
  static final googleLogin = GoogleSignIn(scopes: [
    'email',
    //'https://www.googleapis.com/auth/contacts.readonly',
  ]);
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
              onPressed: () async {
                // Google認証
                GoogleSignInAccount? signinAccount = await googleLogin.signIn();

                print('サインインユーザーのemailは${signinAccount!.email}です。');//デバッグ用
                
                if (signinAccount.email.endsWith('@koyo-h.com') != true ) {//向陽のドメインのみ
                  if (!context.mounted) return;
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Text('エラー'),
                          content: Text('向陽高校のアカウントでログインしてください'),
                        );
                      });

                      final googleCurrentUser =
                    GoogleSignIn().currentUser ?? await GoogleSignIn().signIn();
                      if (googleCurrentUser != null){
                  await GoogleSignIn().disconnect();
                  await googleSignIn.signOut();
                  }
                } else {
                  try {
                    /*googleProvider.setCustomParameters({ "hd" : "koyo-h.com" });
                    await FirebaseAuth.instance.signInWithPopup(googleProvider);*/
                    
                  GoogleSignInAuthentication auth =
                     await signinAccount.authentication;
                  final OAuthCredential credential =
                      GoogleAuthProvider.credential(
                    idToken: auth.idToken,
                    accessToken: auth.accessToken,
                  );
                  // 認証情報をFirebaseに登録
                  await FirebaseAuth.instance.signInWithCredential(credential);

                  } catch (e) {
                      if (!context.mounted) return;
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('エラー'),
                              content: Text(e.toString()),
                            );
                          });
                    }
                }
              },
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
                onPressed: () async {
                  {
                    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
                    try {
                      await firebaseAuth.signInAnonymously();
                    } catch (e) {
                      if (!context.mounted) return;
                      await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('エラー'),
                              content: Text(e.toString()),
                            );
                          });
                    }
                    if (!context.mounted) return;
                    context.go('/');
                  }
                },
                child: const Text(
                  '向陽生以外の方はこちら',
                  style: TextStyle(fontSize: 20),
                ))
          ]),
        ));
  }
}
