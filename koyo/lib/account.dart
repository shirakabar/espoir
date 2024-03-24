import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Account extends StatefulWidget{
  const Account({super.key});

  @override
  State<Account> createState() => _Account();
}

class _Account extends State<Account> {
  final user = FirebaseAuth.instance.currentUser!;
  final String name = FirebaseAuth.instance.currentUser!.displayName.toString();
  final String url = FirebaseAuth.instance.currentUser!.photoURL.toString();
  final String email = FirebaseAuth.instance.currentUser!.email.toString();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Bar(title: 'アカウント'),
      body: Column(
            children:[ 
              Container(
                width: double.infinity,
                height: 200,
                color: Theme.of(context).primaryColor,
                child: Column(children:[
                  const SizedBox(
                    width: double.infinity,
                    height: 10,
                    ),
          CircleAvatar(
              backgroundImage: NetworkImage(url),
              radius: 40,
            ),
            const SizedBox(
              width: double.infinity,
              height: 5,
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              email,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
        const SizedBox(
          height: 10,
          width: double.infinity,
        ),
            ])),
            const SizedBox(
          height: 10,
          width: double.infinity,
        ),
          const Divider(
                      //線
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: const Text('ログイン'),
                      onTap: () {
                        context.push('/login');
                      },
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: const Text('ログアウト'),
                      onTap: () {
                        context.push('/logout');
                      },
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
    ]));
    }
    }
