import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vibration/vibration.dart';

class Rythm extends ConsumerStatefulWidget {
  const Rythm({super.key});
  //リズムモードのスタート画面

  @override
  ConsumerState<Rythm> createState() => _Rythm();
}

class _Rythm extends ConsumerState<Rythm> {
  Timer? _timer;
  DateTime startDateTime = DateTime(2024, 10, 27, 21, 50); 
  double intervalSeconds = 0; // バイブレーションの間隔
  double bpm = 0;

  void _scheduleVibration() {
    DateTime now = DateTime.now();

    // 指定日時が過去の場合、intervalSecondsを足して未来の時刻に調整
    while (startDateTime.isBefore(now)) {
      startDateTime = startDateTime.add(Duration(milliseconds: intervalSeconds.toInt()));
    }

    // 現在の時刻と調整後のstartDateTimeの差を計算
    Duration delay = startDateTime.difference(now);

    // 調整後の時刻まで待機してからバイブレーションを開始
    Future.delayed(delay, () {
      _startVibration();
    });
  }

  void _startVibration() {
    _timer = Timer.periodic(Duration(milliseconds: intervalSeconds.toInt()), (Timer timer) async {
      // デバイスがバイブレーションに対応しているか確認
      if (await Vibration.hasVibrator() ?? false) {
        Vibration.vibrate(duration: 200); // バイブレーション
      }
      
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
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
                    '※開始後、他の画面に行ってもストップしない限り続きます\n※お使いの機種によっては正しく動作しない場合があります',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  StreamBuilder<DocumentSnapshot>(
                      //各クラスのドキュメントをstreambuilderで監視
                      stream: FirebaseFirestore.instance
                          .collection('Live')
                          .doc('rythm')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('error',style: TextStyle(color: Colors.white),);
                        }
                        if (!snapshot.hasData) {
                          return const Text('ee',style: TextStyle(color: Colors.white),);
                        }
                        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
                        intervalSeconds = data['duration'] as double;
                        startDateTime = data['starttime'].toDate();
                        bpm = 60 / ( intervalSeconds / 1000 ); //BPMに変更
                        _timer?.cancel();//タイマーストップ
                        _scheduleVibration();
                        return Text('BPM : ${bpm.round()}',style: const TextStyle(color: Colors.white,fontSize: 25),);
                      }),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        minimumSize: const Size(200, 50),
                        backgroundColor: Colors.black,
                        side: const BorderSide(color: Colors.white)),
                    onPressed: () {
                      _timer?.cancel();//タイマーストップ
                      context.go('/');
                    },
                    child: const Text(
                      'ストップ',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )));
  }
}
