import 'package:flutter/material.dart';
import 'package:koyo/bunkakouya/kouyade.dart';
//import 'package:koyo/bunkakouya/ondemand.dart';

//文化祭ページのタブ遷移先一覧
//stickeytabbarはネットから
class Kouya extends StatelessWidget {
  const Kouya({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              _headerSection(),
              _tabSection()
            ];
          },
          body: const TabBarView(
            children: [
               Kouyagym(),
               Kouyagym(),
               //Ondemand(),
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
    delegate: SliverChildListDelegate(
      [ const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 12,),
          child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                  children:[ 
                     Padding(
                     padding: EdgeInsets.only(left:20,top:15),
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children:[ 
                        Text('後夜祭',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 35),),
                     SizedBox(
                      height: 5,
                    ),
                Text('9月7日（土）',style: TextStyle(fontSize: 18),),
                  ]
            )
                  ),
                  ]
            ),
        ),
      ],
    ),
  );
}

//TabBar部分
Widget _tabSection() {
  return const SliverPersistentHeader(
    pinned: true,
    delegate: _StickyTabBarDelegate(
      tabBar: TabBar(
        tabs: [
          Tab(
            text: '体育館',
          ),
          Tab(
            text: '運動場',
          ),
          /*Tab(
            text: 'オンデマンド',
          )*/
        ],
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
      color: const Color.fromARGB(255, 251, 251, 251),
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
