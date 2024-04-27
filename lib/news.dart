import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:koyo/loginprovider.dart';
class News extends ConsumerStatefulWidget {
  const News({super.key});

  @override
  ConsumerState<News> createState() => _News();
}

class _News extends ConsumerState<News> {

  Widget _adminscreen() {
   return StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('news')
                              .orderBy('createdAt', descending: true)
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
                                  final DateTime createdAt = data["createdAt"].toDate();
                                  final String time = _gettime(createdAt);
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
                                          child: Dismissible(
                                            key: ObjectKey(doc),
                                            onDismissed: (DismissDirection direction) {
                                              setState(() {
                                                docs.removeAt(index);
                                                FirebaseFirestore.instance
                                                .collection('news')
                                                .doc(doc.id)
                                                .delete();
                                              });
                                              const snackBar = SnackBar(
                                                content: Text("お知らせを削除しました"),
                                                duration: Duration(seconds: 1),
                                                );
                                                if (context.mounted) {
                                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                  }
                                                },
                                                direction: DismissDirection.endToStart,
                                                background: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.red,
                                                  ),
                                                  ),
                                            child: ListTile(
                                            title: Text(title,style: const TextStyle(fontSize: 18),),
                                            subtitle: Text('${data["createdBy"]}  $time',style: const TextStyle(color: Colors.grey)),
                                            tileColor: const Color.fromARGB(
                                                255, 241, 249, 255),
                                            onTap: () {
                                              Navigator.push(
                                               context,
                                                MaterialPageRoute(builder: (context) => Newsde(title: title,time: time,content: data['content'],createdBy: data['createdBy'])),
                                                );
                                            }, 
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                          ))
                                  ));
                                });
                          });
  }

  Widget _studentscreen () {
    return StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('news')
                              .orderBy('createdAt', descending: true)
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
                                  final DateTime createdAt = data["createdAt"].toDate();
                                  final String time = _gettime(createdAt);
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
                                          child:ListTile(
                                            title: Text(title,style: const TextStyle(fontSize: 18),),
                                            subtitle: Text('${data["createdBy"]}  $time',style: const TextStyle(color: Colors.grey)),
                                            tileColor: const Color.fromARGB(
                                                255, 241, 249, 255),
                                            onTap: () {
                                              Navigator.push(
                                               context,
                                                MaterialPageRoute(builder: (context) => Newsde(title: title,time: time,content: data['content'],createdBy: data['createdBy'])),
                                                );
                                            }, 
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                          )
                                  ));
                                });
                          });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
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
                      Padding(
                          padding: const EdgeInsets.only(left: 20, top: 15),
                          child: Column(children: [
                            const Align(alignment:  Alignment.centerLeft,
                            child: Text(
                            '※タップで詳細を確認できます',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                            ),
                            if (ref.watch(currentLoginStatusProvider) == CurrentLoginStatus.loggedInAdmin)
                            const Align(alignment:  Alignment.centerLeft,
                            child: Text(
                            '※スライドで削除できます',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                          )
                            )
                          ])
                          ),
                      const SizedBox(
                        height: 10,
                      ),
                      if (ref.watch(currentLoginStatusProvider) == CurrentLoginStatus.loggedInAdmin)
                      _adminscreen(),
                      if (ref.watch(currentLoginStatusProvider) != CurrentLoginStatus.loggedInAdmin)
                      _studentscreen()
                    ]))));
  }

   String _gettime(DateTime createdAt) {
    if (createdAt.minute < 10) {
      return '${createdAt.year}/${createdAt.month}/${createdAt.day} ${createdAt.hour}:0${createdAt.minute}';
    } else {
      return '${createdAt.year}/${createdAt.month}/${createdAt.day} ${createdAt.hour}:${createdAt.minute}';
    }
  }
}

class Newsde extends StatelessWidget{
  const Newsde({super.key,required this.title,required this.time,required this.content,required this.createdBy});
  final String title;
  final String time;
  final String content;
  final String createdBy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('お知らせ詳細',style: TextStyle(color: Colors.white),),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 12,),
          color: const Color.fromARGB(255, 241, 249, 255),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                      Text(title,style: const TextStyle(fontSize: 23)),
                      const SizedBox(height: 3,width:double.infinity),
                      Text('$createdBy  $time',style: const TextStyle(fontSize: 16,color: Colors.grey)),
                      const SizedBox(height: 5,width:double.infinity),
                      Text(content,style: const TextStyle(fontSize: 18),),
                      const SizedBox(height: 3,width:double.infinity),
                    ]
                )
                    )
          )
        
    );
  }
}
