import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _News();
}

class _News extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('お知らせ',style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
            //スクロール可能
            child: Padding(
                //余白設定
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 12,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(left: 20, top: 15),
                          child: Text(
                            '※タップで詳細を確認できます',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('news')
                              .orderBy('createdAt')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text('エラー');
                            }
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            final docs = snapshot.data!.docs;

                            return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: docs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final doc = docs[index];
                                  final data = doc.data()! as Map<String,dynamic>;
                                  DateTime createdAt = data["createdAt"].toDate();
                                  final String title = doc.id;
                                  return Padding(
                                      //ここからを表示
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 1),
                                      child: Card(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ListTile(
                                            title: Text(
                                              title,
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                            subtitle: Text('$createdAt'),
                                            tileColor: const Color.fromARGB(
                                                255, 241, 249, 255),
                                            onTap: () {
                                              Navigator.push(
                                               context,
                                                MaterialPageRoute(builder: (context) => Newsde(title: title,createdAt: createdAt,content: data['content'])),
                                                );
                                            }, //gorouterでのタップ時遷移　仮
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                          )));
                                });
                          })
                    ]))));
  }
}

class Newsde extends StatelessWidget{
  const Newsde({super.key,required this.title,required this.createdAt,required this.content});
  final String title;
  final DateTime createdAt;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('お知らせ詳細',style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Padding(
                //余白設定
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 12,
                ),
                child: SizedBox(
                  height: 500,
                  width: double.infinity,
                  child: Card(
                  color: const Color.fromARGB(255, 241, 249, 255),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                    title: Text(title,style: const TextStyle(fontSize: 20),),
                    subtitle: Text('$createdAt'),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:
                  Text(content,style: const TextStyle(fontSize: 20),)
                  )
                    ]
                )
                )
                  )
                )
            )
    );
  }
}
