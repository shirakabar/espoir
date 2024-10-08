import 'package:flutter/material.dart';
import 'package:koyo/settings/loginprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logout extends ConsumerStatefulWidget {
  const Logout({super.key});
  //ログイン後の画面

  @override
  ConsumerState<Logout> createState() => _Logout();
}

class _Logout extends ConsumerState<Logout> {
  @override
  Widget build(BuildContext context) {
    String classname = ref.watch(loggedInClassProvider);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          if (ref.watch(currentLoginStatusProvider) ==
              CurrentLoginStatus.loggedInStudent)
            Text('$classnameの生徒でログインしています'),
          if (ref.watch(currentLoginStatusProvider) ==
              CurrentLoginStatus.loggedInAdmin)
            Text('管理者でログインしています($classname)'),
          if (ref.watch(currentLoginStatusProvider) ==
              CurrentLoginStatus.loggedInStaff)
            Text('スタッフでログインしています($classname)'),
          if (ref.watch(currentLoginStatusProvider) !=
              CurrentLoginStatus.notLoggedIn)
            const Text('メニューにボタンが追加されました'),
          const SizedBox(
            height: 50,
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  backgroundColor: Theme.of(context).primaryColor,
                  side: BorderSide(color: Theme.of(context).primaryColor)),
              onPressed: () async {
                try {
                  await LoginDataManager.logout(ref);
                  const snackBar = SnackBar(
                    content: Text("ログアウトしました"),
                    duration: Duration(seconds: 1),
                  );
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } catch (e) {
                  const snackBar = SnackBar(
                    content: Text("エラーが発生しました"),
                    duration: Duration(seconds: 1),
                  );
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              },
              child: const Text(
                'ログアウト',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ]));
  }
}
