import 'package:flutter/material.dart';
import 'package:koyo/sportsfestival/sports.dart';
import 'package:koyo/sportsfestival/spring.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/widget/widget.dart';

//スポーツの遷移一覧
class Sportshome extends StatelessWidget {
  const Sportshome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Draw(),
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text('スポーツ', style: TextStyle(color: Colors.white)),
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  context.push('/news');
                },
              ),
            ],
            bottom: TabBar(
              tabs: const [
                Tab(text: '体育祭'),
                Tab(text: 'スプリングフェア'),
              ],
              unselectedLabelColor: Colors.white,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              dividerColor: Theme.of(context).primaryColor,
            ),
          ),
          body: InteractiveViewer(
              child: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Sports(),
              Spring(),
            ],
          )),
        ));
  }
}