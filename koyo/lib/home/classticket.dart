import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/settings/loginprovider.dart';
import 'package:qr_flutter/qr_flutter.dart';

//整理券配布

class Classticket extends ConsumerStatefulWidget {
  const Classticket({super.key});

  @override
  ConsumerState<Classticket> createState() => _Classticket();
}

class _Classticket extends ConsumerState<Classticket> {

  @override
  Widget build(BuildContext context) {
    String classname = ref.watch(loggedInClassProvider);

    return Scaffold(
        body: Padding(
            //余白設定
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              //Text('$classname整理券配布',style: const TextStyle(color: Colors.black,fontSize: 26),),
              //const SizedBox(height: 10,),
              StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Ticket')
                .doc('randomCode')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('エラーが発生しました');
              }
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor,width: 4),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent
                ),
                child: QrImageView(
                data: '${data['code']}$classname',
                version: QrVersions.auto,
                size: 250.0,
                dataModuleStyle: QrDataModuleStyle(color: Theme.of(context).primaryColor,dataModuleShape: QrDataModuleShape.circle),
                eyeStyle: QrEyeStyle(color: Theme.of(context).primaryColor, eyeShape: QrEyeShape.circle),
              ));
            }
              
              ),
              const SizedBox(height: 45,),
              const Text('ホームの整理券から右下の「＋」ボタンを押して追加してください',style: TextStyle(color: Colors.black,fontSize: 20),),
              const SizedBox(height: 47),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                            minimumSize: const Size(200, 50),
                              backgroundColor: Theme.of(context).primaryColor,
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                onPressed: () {
                  context.push('/ticketmanage');
                }, child: const Text('枚数確認',style : TextStyle(color: Colors.white,fontWeight: FontWeight.bold)))
            ])));
  }
}
