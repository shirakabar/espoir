import 'package:flutter/material.dart';
import 'package:koyo/widget/widget.dart';
import 'package:koyo/data/sportsdata.dart';
import 'package:cloud_functions/cloud_functions.dart';

//体育祭の招集通知発信ページ

class Push extends StatefulWidget {
  const Push({super.key});

  @override
  State<Push> createState() => _Push();
}

class _Push extends State<Push> {
  final _taiikusaidata = TaiikusaidataList().taiikusaidata;

  Future<void> pushNotification(String text) async {
    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('pushnotification');
    try {
      await callable.call(<String, dynamic>{
        'text': text,
      });
      debugPrint('Notification sent successfully');
    } catch (e) {
      debugPrint('Failed to send notification: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Bar(title: '体育祭招集通知送信'),
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
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '※タップで通知を送信します',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '※競技開始12分前に送信してください\n  (送信には数分のラグが生じます)',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ])),
                      const SizedBox(
                        //間設定
                        height: 15,
                      ),
                      ListView.builder(
                          //体育祭の各種目を一覧表示
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _taiikusaidata.length,
                          itemBuilder: (BuildContext context, int index) {
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
                                      leading: Text(
                                        _taiikusaidata[index].time,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      title: Text(
                                        _taiikusaidata[index].title,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      //subtitle:Text(_taiikusaidata[index].place),
                                      tileColor: const Color.fromARGB(
                                          255, 241, 249, 255),
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text("招集通知送信"),
                                              content: Text(
                                                '${_taiikusaidata[index].title}の招集通知を全ユーザーに送信します\n本当によろしいですか？',
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                              actions: [
                                                TextButton(
                                                    child: const Text("送信"),
                                                    onPressed: () {
                                                      try {
                                                        //FirebaseFunctions.instance.httpsCallable('pushnotification').call({'text': _taiikusaidata[index].title});
                                                        pushNotification(
                                                            _taiikusaidata[
                                                                    index]
                                                                .title);
                                                        const snackBar =
                                                            SnackBar(
                                                          content: Text(
                                                              "招集通知を送信しました"),
                                                          duration: Duration(
                                                              seconds: 1),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackBar);
                                                        Navigator.pop(context);
                                                      } catch (e) {
                                                        const snackBar =
                                                            SnackBar(
                                                          content: Text(
                                                              "エラーが発生しました"),
                                                          duration: Duration(
                                                              seconds: 1),
                                                        );
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                snackBar);
                                                        Navigator.pop(context);
                                                      }
                                                    }),
                                                TextButton(
                                                  child: const Text("閉じる"),
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    )));
                          })
                    ]))));
  }
}
