import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/widget/widget.dart';
import 'package:koyo/staff/editcomment.dart';

//管理者用
class Adminselect extends StatelessWidget {
  const Adminselect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Bar(title: '管理者用'),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
                //ここからを表示
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
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
                              return const Editdialog();//editcomment dialog
                            });
                      },
                    ),
                    const Divider(
                      //線
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: const Text('リズム作成'),
                      onTap: () {
                      context.push('/rythmmake');
                      },
                    ),
                    const Divider(
                      //線
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: const Text('テスト'),
                      onTap: () {
                       context.go('/firstoverboard');
                      },
                    ),
                    const Divider(
                      //線
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ],
                ))
          ],
        ));
  }
}
