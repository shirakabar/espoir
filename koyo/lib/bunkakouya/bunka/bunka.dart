import 'package:flutter/material.dart';
import 'package:koyo/bunkakouya/bunka/bunkade.dart';
import 'package:koyo/data/basicdata.dart';

//文化祭ページのタブ遷移先一覧
class Bunka extends StatelessWidget {
  Bunka({super.key});
  final String bunkasaidate = BasicData().bunkasaidate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[_headerSection(), _tabSection()];
          },
          body: TabBarView(
            children: [Bunkagym(), Bunkahannichi()],
          ),
        ),
      ),
    );
  }
}

//header部分
Widget _headerSection() {
  return SliverList(
    delegate: SliverChildListDelegate(
      [
         Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 12,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '文化祭',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 35),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          BasicData().bunkasaidate,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ])),
            ]))
      ],
    ),
  );
}

//TabBar部分
Widget _tabSection() {
  return const SliverPersistentHeader(
    pinned: true,
    delegate: _StickyTabBarDelegate(
      tabBar: TabBar(tabs: [
        Tab(
          text: '部活動',
        ),
        Tab(
          text: '半日教室等',
        )
      ], dividerColor: Colors.white),
    ),
  );
}

//SliverPersistentHeaderDelegateを継承したTabBarを作る
class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate({required this.tabBar});

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
