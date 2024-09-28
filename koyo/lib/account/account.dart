import 'package:flutter/material.dart';
import 'package:koyo/widget/widget.dart';
import 'package:koyo/account/login.dart';
import 'package:koyo/account/logout.dart';
import 'package:koyo/settings/loginprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Account extends ConsumerStatefulWidget {
  const Account({super.key});
  //アカウント画面

  @override
  ConsumerState<Account> createState() => _AccountState();
}

class _AccountState extends ConsumerState<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Bar(title: 'アカウント'),
        body: SingleChildScrollView(
            child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                width: double.infinity, //横無限
                height: 280,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/koyobuilding.jpg'),
                      fit: BoxFit.cover,
                    )),
                child: Container(
                  width: double.infinity, //横無限
                  height: 280,
                  color: const Color.fromARGB(30, 0, 0, 0),
                )),
            if (ref.watch(currentLoginStatusProvider) !=
                CurrentLoginStatus.notLoggedIn)
              const Logout(),
            if (ref.watch(currentLoginStatusProvider) ==
                CurrentLoginStatus.notLoggedIn)
              const Login(),
          ]),
        )));
  }
}
