import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

//final isLoggedInStudentProvider = StateProvider<bool>((ref) => false);
final user = FirebaseAuth.instance.currentUser;
final isLoggedInAdminProvider = StreamProvider.autoDispose((_) {
  CollectionReference ref = FirebaseFirestore.instance.collection('Admins');
  return ref.snapshots().map((snapshot) {
    final list = snapshot.docs.toList();
    return list;
  });
});

class Riverpod extends ConsumerWidget {
  const Riverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
        if (ref.watch(isLoggedInAdminProvider) == user!.uid)
        Column(children: [
          const Divider(
                      //線
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: const Text('管理者用'),
                      onTap: () {
                        context.push('/come');
                      },
                    ),
        ],)
      ],)
    );
  }
}