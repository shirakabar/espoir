import 'package:flutter/material.dart';
import 'package:koyo/loginprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import '../localdata.dart';

class Logout extends ConsumerStatefulWidget {
  const Logout({super.key});

  @override
  ConsumerState<Logout> createState() => _Logout();
}

class _Logout extends ConsumerState<Logout> {
  String classname = '';
  /*_getData() async {
      classname = await LocalData.readLocalData('class');
  }*/

  @override
  Widget build(BuildContext context) {
    //classname = _getData();
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
          
          if (ref.watch(currentLoginStatusProvider) ==
              CurrentLoginStatus.loggedInStudent)
            Text('$classnameの生徒でログインしています'),
          if (ref.watch(currentLoginStatusProvider) ==
              CurrentLoginStatus.loggedInAdmin)
            Text('管理者でログインしています($classname)'),
          if (ref.watch(currentLoginStatusProvider) ==
              CurrentLoginStatus.loggedInStaff)
            Text('スタッフでログインしています($classname)'),
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
