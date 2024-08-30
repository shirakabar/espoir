import 'package:flutter/material.dart';
import 'package:koyo/hakurankai/butaide.dart';

//舞台のスケジュール一覧
class Butai extends StatelessWidget {
  const Butai({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[_headerSection(), _tabSection()];
          },
          body: const TabBarView(
            children: [
              Ichiran(),
              First(),
              Second(),
            ],
          ),
        ),
      ),
    );
  }
}

//header部分
Widget _headerSection() {
  return SliverList(
      delegate: SliverChildListDelegate([
    const Padding(
        //余白設定
        padding: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 12,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 20, top: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '博覧会',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 35),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '9月6日（金）9:30 ~ 15:30\n9月7日（土）9:00 ~ 15:00',
                      style: TextStyle(fontSize: 18),
                    ),
                  ])),
          SizedBox(
            //間設定
            height: 5,
          ),
        ]))
  ]));
}

//TabBar部分
Widget _tabSection() {
  return const SliverPersistentHeader(
    pinned: true,
    delegate: _StickyTabBarDelegate(
      tabBar: TabBar(
        tabs: [
          Tab(
            text: '発表一覧',
          ),
          Tab(
            text: '一日目',
          ),
          Tab(
            text: '二日目',
          )
        ],
        dividerColor: Colors.white,
      ),
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
