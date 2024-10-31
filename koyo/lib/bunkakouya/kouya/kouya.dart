import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/bunkakouya/kouya/kouyade.dart';
import 'package:koyo/data/basicdata.dart';
import 'package:koyo/widget/videoplayer.dart';

//後夜祭ページのタブ遷移先一覧
class Kouya extends StatefulWidget {
  const Kouya({super.key});

  @override
  State<Kouya> createState() => _Kouya();
}

class _Kouya extends State<Kouya> {
  final String kouyasaidate = BasicData().kouyasaidate;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              //_headerSection(),
              //buildcontextの関係で直書き
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 12,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 15),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      '後夜祭',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 35),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      kouyasaidate,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                                //minimumSize: const Size(200, 50),
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor,
                                                side: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor)),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Videoplayer(
                                                              title: '後夜祭紹介動画',
                                                              videourl: 'kouyasaivideo.mp4')));
                                            },
                                            child: const Text(
                                              '後夜祭紹介動画',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        const SizedBox(width: 10),
                                        OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                                //minimumSize: const Size(200, 50),
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor,
                                                side: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor)),
                                            onPressed: () {
                                              context.push('/liveselect');
                                            },
                                            child: const Text(
                                              'ライブモード',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ],
                                    )
                                  ]),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              _tabSection()
            ];
          },
          body: TabBarView(
            children: [Kouyagym(), Kouyaground(), Ondemand()],
          ),
        ),
      ),
    );
  }
}

//header部分
/*Widget _headerSection(context) {
  return SliverList(
    delegate: SliverChildListDelegate(
      [ Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 12,),
          child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                  children:[ 
                     Padding(
                     padding: const EdgeInsets.only(left:20,top:15),
                     child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children:[ 
                        const Text('後夜祭',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 35),),
                     const SizedBox(
                      height: 5,
                    ),
                const Text('9月7日（土）',style: TextStyle(fontSize: 18),),
                const SizedBox(
                      height: 5,
                    ),
                OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            //minimumSize: const Size(200, 50),
                              backgroundColor: Theme.of(context).primaryColor,
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          onPressed: () {
                            context.push('/videoplayer');
                          },
                          child: const Text('後夜祭紹介動画',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                  ]
            )
                  ),
                  ]
            ),
        ),
      ],
    ),
  );
}*/

//TabBar部分
Widget _tabSection() {
  return const SliverPersistentHeader(
    pinned: true,
    delegate: _StickyTabBarDelegate(
      tabBar: TabBar(tabs: [
        Tab(
          text: '体育館',
        ),
        Tab(
          text: 'グラウンド',
        ),
        Tab(
          text: 'オンデマンド',
        ),
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
