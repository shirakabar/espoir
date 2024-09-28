import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:rainbow_color/rainbow_color.dart';

class Penlight extends HookWidget {
  //ペンライト表示画面　flutter_hooks使用
  const Penlight({super.key, required this.color});
  final Color color;

  Future<void> setBrightness(double brightness) async {
    try {
      await ScreenBrightness().setScreenBrightness(brightness);
    } catch (e) {
      debugPrint(e.toString());
      throw '明るさのセットに失敗しました';
    }
  }

  // resetBrightnessはsetBrightnessで変更した輝度を元に戻す
  Future<void> resetBrightness() async {
    try {
      await ScreenBrightness().resetScreenBrightness();
    } catch (e) {
      debugPrint(e.toString());
      throw '明るさのリセットに失敗しました';
    }
  }

  @override
  Widget build(BuildContext context) {
    final AnimationController controller = useAnimationController(
      duration: const Duration(seconds: 60),
    );

    final Animation<Color?> animation = RainbowColorTween([
      Colors.red,
      Colors.deepOrange,
      Colors.orange,
      Colors.amber,
      Colors.yellow,
      Colors.lightGreen,
      Colors.green,
      Colors.cyan,
      Colors.blue,
      Colors.indigo,
      Colors.purple,
      Colors.pink,
      Colors.red,
    ]).animate(controller);

    useEffect(
      () {
        // 画面表示時、本体設定に干渉せずにスクリーンの輝度を最大（1.0）にする
        Future(() async {
          await setBrightness(1);
          WakelockPlus.enable();
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
          controller.repeat();
        });

        return () => {
              // 画面から離れる時、スクリーンの明るさを本体設定の輝度に戻す
              Future(() async {
                await resetBrightness();
                WakelockPlus.disable;
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
              })
            };
      },
      const [],
    );

    useEffect(() {
      controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          controller.forward();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
          debugPrint('dismissed');
        }
      });
      // 初回実行
      final progress = DateTime.now().second / 60;
      controller.forward(from: progress);
      debugPrint(progress.toString());
      // クリーンアップ処理
      return () {
        controller.dispose();
      };
    }, [controller]);

    return Scaffold(
        body: GestureDetector(
            onDoubleTap: () {
              Navigator.pop(context);
            },
            child: Container(
                color: Colors.black,
                height: double.infinity,
                width: double.infinity,
                child: (color == Colors.black)
                    ? //色が指定されていない場合
                    AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          return Stack(alignment: Alignment.center, children: [
                            Container(
                              height: double.infinity,
                              width: 350,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    animation.value!,
                                    Colors.white,
                                  ],
                                  stops: const [
                                    0.6,
                                    1.0,
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: animation.value!,
                                    spreadRadius: 10,
                                    blurRadius: 20,
                                    offset: const Offset(1, 1),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              //グラデーションを重ねて白くなりすぎないように調整
                              height: double.infinity,
                              width: 350,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    animation.value!.withOpacity(0.1),
                                    animation.value!.withOpacity(0.4),
                                  ],
                                  stops: const [
                                    0.6,
                                    1.0,
                                  ],
                                ),
                              ),
                            )
                          ]);
                        })
                    : //色が設定されている場合
                    Stack(alignment: Alignment.center, children: [
                        Container(
                          height: double.infinity,
                          width: 350,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                color,
                                Colors.white,
                              ],
                              stops: const [
                                0.6,
                                1.0,
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: color,
                                spreadRadius: 10,
                                blurRadius: 20,
                                offset: const Offset(1, 1),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: double.infinity,
                          width: 350,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                color.withOpacity(0.1),
                                color.withOpacity(0.4),
                              ],
                              stops: const [
                                0.6,
                                1.0,
                              ],
                            ),
                          ),
                        )
                      ]))));
  }
}
