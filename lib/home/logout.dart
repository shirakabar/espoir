import 'package:flutter/material.dart';
import 'package:koyo/loginprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../localdata.dart';

class Logout extends ConsumerStatefulWidget {
  const Logout({super.key});

  @override
  ConsumerState<Logout> createState() => _Logout();
}

class _Logout extends ConsumerState<Logout> {
  Future<dynamic> _readclass() async {
      return LocalData.readLocalData('class');
  }
  
  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          const Text(
            'ログアウト',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),

          FutureBuilder<dynamic>(
      future: _readclass(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());

        } else if (snapshot.hasError) {
          return const Text('エラーが発生しました');

        } else if (ref.watch(currentLoginStatusProvider) ==
              CurrentLoginStatus.loggedInStudent) {
          return Text('$_readclassの生徒でログインしています');

        } else if (ref.watch(currentLoginStatusProvider) ==
              CurrentLoginStatus.loggedInAdmin) {
          return Text('管理者でログインしています($_readclass)');

        } else if (ref.watch(currentLoginStatusProvider) ==
              CurrentLoginStatus.loggedInStaff) {
          return Text('スタッフでログインしています($_readclass)');

        } else {
          return const Text('');
        }
      }
          ),
          const SizedBox(
            height: 10,
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: BorderSide(color: Theme.of(context).primaryColor)),
              onPressed: () async {
                await LoginDataManager.logout(ref);
                const snackBar = SnackBar(
                  content: Text("ログアウトしました"),
                  duration: Duration(seconds: 1),
                );
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('ログアウト'))
        ]));
  }
}
