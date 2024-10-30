import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:koyo/staff/rythmmakewidget.dart';

class Rythmmake extends StatefulWidget {
  const Rythmmake({super.key});
  //リズム作成画面

  @override
  State<Rythmmake> createState() => _Rythmmake();
}

class _Rythmmake extends State<Rythmmake> {
  int tapped = 0;
  List intervalsList = [];
  double interval = 0;
  double intervalsave = 0;
  Stopwatch stopwatch = Stopwatch();
  final TextEditingController _bpmcontroller = TextEditingController();

  @override
  void dispose() {
    _bpmcontroller.dispose();
    super.dispose();
  }

  void changerythm() {
    tapped += 1;
    if (tapped > 1) {
      stopwatch.stop();
      // 経過時間をミリ秒単位で取得
      int milliseconds = stopwatch.elapsedMilliseconds;
      intervalsList.add(milliseconds);
    }
    stopwatch.reset();
    stopwatch.start();
    if (tapped >= 5) {
      final Timestamp now = Timestamp.fromDate(DateTime.now());
      intervalsave = intervalsList.reduce((a, b) => a + b) / 4;
      FirebaseFirestore.instance
          .collection('Live')
          .doc('rythm')
          .set({'duration': intervalsave, 'starttime': now});
      tapped = 0;
      intervalsList = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: StreamBuilder<DocumentSnapshot>(
            //各クラスのドキュメントをstreambuilderで監視
            stream: FirebaseFirestore.instance
                .collection('Live')
                .doc('rythm')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text(
                  'エラーが発生しました',
                  style: TextStyle(color: Colors.white),
                );
              }
              if (!snapshot.hasData) {
                return const Text(
                  'Loading...',
                  style: TextStyle(color: Colors.white),
                );
              }
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              final num bpm = 60 / (data['duration'] / 1000); //BPMに変更
              _bpmcontroller.text = bpm.round().toString();
              return Container(
                  color: Colors.black,
                  height: double.infinity,
                  width: double.infinity,
                  child: SingleChildScrollView(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '※TAPでリズムを修正します\n※修正をストップでリズムの修正を停止します',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                              border: Border.all(color: Colors.white)),
                          width: 200,
                          height: 200,
                          child: Material(
                              shape: const CircleBorder(),
                              color: Colors.transparent,
                              child: InkWell(
                                customBorder: const CircleBorder(),
                                onTap: () => changerythm(),
                                splashColor: Colors.white,
                                highlightColor: Colors.white,
                                child: const Center(
                                    child: Text(
                                  'TAP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                )),
                              )),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'BPM : ${bpm.round()}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(height: 20),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              minimumSize: const Size(200, 50),
                              backgroundColor: Colors.black,
                              side: const BorderSide(color: Colors.white)),
                          onPressed: () {
                                  tapped = 0;
                                  const snackBar = SnackBar(
                                    content: Text("ストップしました"),
                                    duration: Duration(seconds: 1),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                          child: const Text(
                            '修正をストップ',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 40),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              minimumSize: const Size(200, 50),
                              backgroundColor: Colors.black,
                              side: const BorderSide(color: Colors.white)),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const Rythmmakedialog(); //editcomment dialog
                                });
                          },
                          child: const Text(
                            'リズムを作成',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        
                      ],
                    ),
                  )));
            }));
  }
}
