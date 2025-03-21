import 'package:flutter/material.dart';
import 'package:koyo/widget/pdfview.dart';
import 'package:koyo/widget/widget.dart';

class Policyselect extends StatelessWidget {
  const Policyselect({super.key});
  //法的事項一覧画面

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Bar(title: 'このアプリについて'),
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
                      title: const Text('利用規約'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Pdfview(
                                  pdf: 'assets/docs/termsofservice.pdf',
                                  title: '利用規約')),
                        );
                      },
                    ),
                    const Divider(
                      //線
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: const Text('プライバシーポリシー'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Pdfview(
                                  pdf: 'assets/docs/plivacypolicy.pdf',
                                  title: 'プライバシーポリシー')),
                        );
                      },
                    ),
                    const Divider(
                      //線
                      height: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10),
                    const Text('このアプリは旭丘高校・千種高校の協力のもと、向陽祭のために作成されました。',style: TextStyle(fontSize: 17),),
                  ],//初期作成時に千種祭アプリを参考にしたため記載。何かあれば千種祭アプリを作成した旭丘高校に確認する。
                ))
          ],
        ));
  }
}
