import 'package:flutter/material.dart';
import 'package:koyo/widget/pdfview.dart';
import 'package:koyo/widget/widget.dart';

class Pdfselect extends StatelessWidget {
  const Pdfselect({super.key});
  //注意事項一覧画面

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Bar(title: '注意事項一覧'),
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
                      title: const Text('体育祭実施要項'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Pdfview(
                                  pdf: 'assets/docs/sportsprogram.pdf',
                                  title: '体育祭実施要項')),
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
                      title: const Text('文化祭実施要項'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Pdfview(
                                  pdf: 'assets/docs/bunkasaipolicy.pdf',
                                  title: '文化祭実施要項')),
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
                      title: const Text('博覧会実施要項'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Pdfview(
                                  pdf: 'assets/docs/hakurankaipolicy.pdf',
                                  title: '博覧会実施要項')),
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
                      title: const Text('後夜祭会場図'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Pdfview(
                                  pdf: 'assets/docs/kouyasaiplace.pdf',
                                  title: '後夜祭会場図')),
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
                      title: const Text('スプリングフェア実施要項'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Pdfview(
                                  pdf: 'file:///C:/Users/shunk/OneDrive/%E3%83%89%E3%82%AD%E3%83%A5%E3%83%A1%E3%83%B3%E3%83%88/2024%E3%82%B9%E3%83%95%E3%82%9A%E3%83%AA%E3%83%B3%E3%82%AF%E3%82%99%E3%83%95%E3%82%A7%E3%82%A2%E5%AE%9F%E6%96%BD%E8%A6%81%E9%A0%85%20%E3%83%A2%E3%83%AB%E3%83%83%E3%82%AF%E3%82%A8%E3%82%AD%E3%82%B7%E3%83%92%E3%82%99%E3%82%B7%E3%83%A7%E3%83%B3ver%E6%94%B9.pdf',
                                  title: 'スプリングフェア実施要項')),
                        );
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
