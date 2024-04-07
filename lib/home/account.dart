import 'package:flutter/material.dart';
import 'package:koyo/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Account extends StatefulWidget{
  const Account({super.key});

  @override
  State<Account> createState() => _Account();
}

class _Account extends State<Account> {
  final user = FirebaseAuth.instance.currentUser;
  
  @override
  Widget build(BuildContext context) {
    String name = user?.displayName.toString() ?? 'ログインしていません';
    String url = user?.photoURL.toString() ?? '';
    String email = user?.email.toString() ?? '';
    if (name == 'null') {
      name = 'ログインしていません';
      email = '';
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: const Bar(title: 'アカウント'),
      body: Column(
            children:[ 
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.grey,
                    ],
                    stops: [
                      0.5,
                      1.0,
                    ],
                  ),
                ),
                child: Column(children:[
                  const SizedBox(
                    width: double.infinity,
                    height: 80,
                    ),
          CircleAvatar(
              backgroundImage: NetworkImage(url),
              radius: 50,
            ),
            const SizedBox(
              width: double.infinity,
              height: 5,
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,color: Colors.white,
              ),
            ),
            Text(
              email,
              style: const TextStyle(
                fontSize: 14,color: Colors.white,
              ),
            ),
        
            ]),),
          const TabBar(
        tabs: [
           Tab( text:'ログイン'),
           Tab( text:'ログアウト'),
        ],
        ),
        const SizedBox(
          height: 300,
          child: TabBarView(
        children: [
          LoginAccount(),
          LogoutAccount(),
          ],
        )
        )
    ])));
    }
    }
class LoginAccount extends StatefulWidget{
  const LoginAccount({super.key});

  @override
  State<LoginAccount> createState() => _LoginAccount();
}

class _LoginAccount extends State<LoginAccount> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  var googleProvider = GoogleAuthProvider();


  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Theme.of(context).primaryColor),
                fixedSize: const Size(300, 40)
              ),
              onPressed: () {
                setState(() {
                  onDeleteAnonymousUser(context);
                  signInWithGoogle();
                });
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
                onPressed: () {
                  setState(() {
                     _onSignInWithAnonymousUser();
                     logout();
                  });
                },
                child: const Text(
                  '向陽生以外の方はこちら',
                  style: TextStyle(fontSize: 20),
                ))
    ],);
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

  Future<void> onDeleteAnonymousUser(BuildContext context) async {
  try {
    await FirebaseAuth.instance.currentUser!.delete(); //匿名ユーザー削除
  } catch (e) {
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
  Future<void> logout() async {
    // Googleは別個でログアウトしないと次にログインするときにアカウント選択が表示されない
    final googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) {
      //await GoogleSignIn().disconnect();
      await googleSignIn.signOut();
    }

    return FirebaseAuth.instance.signOut();
  }
}

class LogoutAccount extends StatefulWidget {
  const LogoutAccount({super.key});

  @override
  State<LogoutAccount> createState() => _LogoutAccountState();
}

class _LogoutAccountState extends State<LogoutAccount> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Theme.of(context).primaryColor),
                fixedSize: const Size(200, 40)
              ),
              onPressed: () { 
                setState(() {
                logout();
              });
              },
              child: const Text(
                'ログアウト',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ]
    );
  }

  Future<void> logout() async {
    // Googleは別個でログアウトしないと次にログインするときにアカウント選択が表示されない
    final googleSignIn = GoogleSignIn();
    if (await googleSignIn.isSignedIn()) {
      //await GoogleSignIn().disconnect();
      await googleSignIn.signOut();
    }

    return FirebaseAuth.instance.signOut();
  }
}
