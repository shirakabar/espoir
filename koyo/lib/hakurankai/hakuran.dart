import 'package:flutter/material.dart';
import 'package:koyo/hakurankai/butai.dart';
import 'package:koyo/hakurankai/hakurande.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/widget/widget.dart';

//博覧ページのタブ遷移先

class Hakuran extends StatelessWidget {
  const Hakuran({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          drawer: Draw(),
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text('博覧会', style: TextStyle(color: Colors.white)),
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
                Tab(text: '教室'),
                Tab(text: '舞台'),
                Tab(text: '部活動等'),
              ],
              dividerColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.white,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
            ),
          ),
          body: TabBarView(
            children: [const Kyo(), Butai(), const Club()],
          )),
    );
  }
}
