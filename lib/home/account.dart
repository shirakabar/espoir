import 'package:flutter/material.dart';
import 'package:koyo/main.dart';
import 'package:koyo/home/login.dart';
import 'package:koyo/home/logout.dart';
import 'package:koyo/loginprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Account extends ConsumerStatefulWidget {
  const Account({super.key});

  @override
  ConsumerState<Account> createState() => _AccountState();
}

class _AccountState extends ConsumerState<Account> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: const Bar(title: 'アカウント'),
        body: SingleChildScrollView(child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, 
          children: [
            Container(
            width: double.infinity, // Containerを横幅いっぱいに表示
            height: 280, // Containerの高さを指定してます
            color: Colors.blue,
            child: Image.asset('images/koyobuilding.jpg',fit: BoxFit.cover,)
          ),
          if (ref.watch(currentLoginStatusProvider) != CurrentLoginStatus.notLoggedIn)
          const Logout(),
              if (ref.watch(currentLoginStatusProvider) == CurrentLoginStatus.notLoggedIn)
          const Login(),
          
          ]),
        )));
  }
}
