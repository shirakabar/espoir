import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:koyo/home/ticketmanagewidget.dart';
import 'package:koyo/settings/loginprovider.dart';
import 'package:koyo/widget/widget.dart';

class Ticketmanage extends ConsumerStatefulWidget {
  const Ticketmanage({super.key});
  //整理券枚数変更画面

  @override
  ConsumerState<Ticketmanage> createState() => _Ticketmanage();
}

class _Ticketmanage extends ConsumerState<Ticketmanage> {
  List<String> hour = ['10:00', '11:00', '12:00', '13:00', '14:00', '15:00'];
  List<String> half = ['10:30', '11:30', '12:30', '13:30', '14:30'];

  @override
  Widget build(BuildContext context) {
    String classname = ref.watch(loggedInClassProvider);

    return Scaffold(
        appBar: Bar(title: '$classname整理券残数'),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Align(alignment: Alignment.topLeft,child: 
                  Text('※タップで枚数を変更します',style: TextStyle(color: Colors.grey,fontSize: 16)),),
                  const SizedBox(height: 15),
                  StreamBuilder<DocumentSnapshot>(
                      //各クラスのドキュメントをstreambuilderで監視
                      stream: FirebaseFirestore.instance
                          .collection('Ticket')
                          .doc(classname)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('エラーが発生しました');
                        }
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        final data = snapshot.data;

                        return Expanded(
                            child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly, //均等に横に並べる
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 7),
                                          child: OutlinedButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                      return Ticketmanagedialog(
                                                          classname: classname,
                                                          index: index,
                                                          number: data?[hour[index]],
                                                          hourhalf: 'hour',
                                                          );
                                                  });
                                            },
                                            style: OutlinedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent, //背景透明
                                                side: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                                fixedSize: const Size(135, 50)),
                                            child: Text(
                                                '${hour[index]}~${half[index]} 残り${data?[hour[index]]} '),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 7),
                                          child: OutlinedButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                      return Ticketmanagedialog(
                                                          classname: classname,
                                                          index: index,
                                                          number: data?[half[index]],
                                                          hourhalf: 'half',
                                                          );
                                                  });
                                            },
                                            style: OutlinedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent, //背景透明
                                                side: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                                fixedSize: const Size(135, 50)),
                                            child: Text(
                                                '${half[index]}~${hour[index + 1]} 残り${data?[half[index]]}'),
                                          ),
                                        )
                                      ]);
                                }));
                      })
                ])));
  }
}
