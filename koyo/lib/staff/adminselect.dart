import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/widget/widget.dart';

class Adminselect extends StatelessWidget {
  const Adminselect({super.key});


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: const Bar(title: '管理者用'),
      body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(//ここからを表示
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child:
              Column(children: [
                ListTile(
                        title: const Text('お知らせ配信'),
                        onTap: () {
                          context.push('/newsmake');
                        },
                      ),

                      const Divider(
                        //線
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),
                ListTile(
                        title: const Text('招集通知配信'),
                        onTap: () {
                          context.push('/push');
                        },
                      ),
                      
                      const Divider(
                        //線
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),      
                ListTile(
                        title: const Text('体育祭結果更新'),
                        onTap: () {
                          context.push('/resultmake');
                        },
                      ),
                      
                      const Divider(
                        //線
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),      
                ListTile(
                        title: const Text('博覧会結果更新'),
                        onTap: () {
                          context.push('/resultmakehakuran');
                        },
                      ),
                      
                      const Divider(
                        //線
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),      
                ListTile(
                        title: const Text('コメント編集'),
                        onTap: () {
                         showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const Editdialog();
                                        });
                        },
                      ),
                      
                      const Divider(
                        //線
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),      

              ],)
            )],
         )
        );
      
}
}

class Editdialog extends StatefulWidget {
  const Editdialog({super.key});

  @override
  State<Editdialog> createState() => _Editdialog();
}

class _Editdialog extends State<Editdialog> {
  final TextEditingController _commentcontroller = TextEditingController();

    @override
  void dispose() {
    _commentcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(title: const Text('コメント編集'), children: [
      SimpleDialogOption(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                TextField(
                    controller: _commentcontroller,
                    onChanged: (value) => setState(() {}),
                    decoration: InputDecoration(
                      labelStyle: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                      labelText: 'コメント',
                      floatingLabelStyle: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                      ),
                    )),
                const SizedBox(height: 10, width: double.infinity),
                Row(
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize: const Size(100, 40),
                            backgroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        onPressed: () { 
                              FirebaseFirestore.instance
                                    .collection("Comment")
                                    .doc("comment")
                                    .update({'comment' : _commentcontroller.text });
                                Navigator.pop(context);
                                const snackBar = SnackBar(
                                  content: Text("更新しました"),
                                  duration: Duration(seconds: 1),
                                );
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                        child: const Text(
                          '更新',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 2,
                      width: 10,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize: const Size(100, 40),
                            backgroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('閉じる',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)))
                  ],
                )
              ])))
    ]);
  }
}