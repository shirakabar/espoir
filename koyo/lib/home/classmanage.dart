import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/home/classcrowd.dart';
import 'package:koyo/home/classticket.dart';

//クラス運営のタブ遷移先一覧

class Classmanage extends StatelessWidget {
  const Classmanage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text('クラス運営', style: TextStyle(color: Colors.white)),
            iconTheme: const IconThemeData(color: Colors.white),
            centerTitle: true,
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
                Tab(text: '混雑度'),
                Tab(text: '整理券'),
              ],
              dividerColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.white,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
            ),
          ),
          body: const TabBarView(
            children: [Classcrowd(), Classticket()],
          )),
    );
  }
}
