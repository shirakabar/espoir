import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vibration/vibration.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class Rythm extends StatefulHookWidget {
  const Rythm({super.key});
  //リズムモードのスタート画面

  @override
  State<Rythm> createState() => _Rythm();
}

class _Rythm extends State<Rythm> {
  Timer? _timer;
  DateTime startDateTime = DateTime(2024, 10, 27, 21, 50);
  double intervalSeconds = 0; // バイブレーションの間隔
  double bpm = 0;

  void _scheduleVibration() {
    DateTime now = DateTime.now();

    // 指定日時が過去の場合、intervalSecondsを足して未来の時刻に調整
    while (startDateTime.isBefore(now)) {
      startDateTime =
          startDateTime.add(Duration(milliseconds: intervalSeconds.toInt()));
    }

    // 現在の時刻と調整後のstartDateTimeの差を計算
    Duration delay = startDateTime.difference(now);

    // 調整後の時刻まで待機してからバイブレーションを開始
    Future.delayed(delay, () {
      _startVibration();
    });
  }

  void _startVibration() {
    _timer = Timer.periodic(Duration(milliseconds: intervalSeconds.toInt()),
        (Timer timer) async {
      // デバイスがバイブレーションに対応しているか確認
      if (await Vibration.hasVibrator() ?? false) {
        Vibration.vibrate(duration: 200); // バイブレーション
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        Future(() {
          WakelockPlus.enable();
        });
        return () => {
              // 画面から離れる時、スクリーンの明るさを本体設定の輝度に戻す
              Future(() {
                WakelockPlus.disable;
              })
            };
      },
      const [],
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Container(
            color: Colors.black,
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '※自動でバイブレーションが開始、終了します\n※お使いの機種によっては正しく動作しない場合があります',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                          border: Border.all(color: Colors.white)),
                      width: 150,
                      height: 150,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.music_note,
                            color: Colors.white,
                            size: 70,
                          ),
                          Text(
                            'リズムモード',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )),
                      const SizedBox(height: 20),
                  StreamBuilder<DocumentSnapshot>(
                      //各クラスのドキュメントをstreambuilderで監視
                      stream: FirebaseFirestore.instance
                          .collection('Live')
                          .doc('rythm')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text(
                            'error',
                            style: TextStyle(color: Colors.white),
                          );
                        }
                        if (!snapshot.hasData) {
                          return const Text(
                            'ee',
                            style: TextStyle(color: Colors.white),
                          );
                        }
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        intervalSeconds = data['duration'].toDouble();
                        startDateTime = data['starttime'].toDate();
                        bpm = 60 / (intervalSeconds / 1000); //BPMに変更
                        _scheduleVibration();
                        return Text(
                          'BPM : ${bpm.round()}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        );
                      }),
                  const SizedBox(height: 20),
                ],
              ),
            )));
  }
}
