import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:koyo/butai.dart';

//博覧のdetailそれぞれのページの内容記載

class Kyo extends StatefulWidget {
  const Kyo({super.key});

  @override
  State<Kyo> createState() => _Kyo();
}

class _Kyo extends State<Kyo> {
  List<String> kyo = [
    "101",
    "102",
    "103",
    "104",
    "105",
    "106",
    "107",
    "108",
    "109"
  ];
  List<String> title = [
    "格付けチェック",
    "104格付けチェック",
    "104格付けチェック",
    "104格付けチェック",
    "104格付けチェック",
    "104格付けチェック",
    "104格付けチェック",
    "104格付けチェック",
    "104格付けチェック",
  ];
  List<String> kyoat = [
    "@中棟3階 104教室",
    "@中棟3階",
    "@中棟3階",
    "@中棟3階",
    "@中棟3階",
    "@中棟3階",
    "@中棟3階",
    "@中棟3階",
    "@中棟3階",
  ];
  List<dynamic> post = [
    Image.asset('images/postest.jpg'),
    Image.asset('images/postest.jpg'),
    Image.asset('images/postest.jpg'),
    Image.asset('images/postest.jpg'),
    Image.asset('images/postest.jpg'),
    Image.asset('images/postest.jpg'),
    Image.asset('images/postest.jpg'),
    Image.asset('images/postest.jpg'),
    Image.asset('images/postest.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            //スクロール可能
            child: Padding(
                //余白設定
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 12,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(left: 20, top: 15),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '博覧会',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 35),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '6月19日（月）9:00~15:00\n6月19日（月）9:30~15:30',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ])),
                      const SizedBox(
                        //間設定
                        height: 15,
                      ),
                      const Center(
                        child: Text(
                          '教室発表',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                                //体育祭の各種目を一覧表示
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 9,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      //ここからを表示
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 1),
                                      child: Card(
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ListTile(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20),
                                            leading: FittedBox(
                                                fit: BoxFit.fitHeight,
                                                child: post.elementAt(index)),
                                            title: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5),
                                              child: Text(
                                                title[index],
                                                style: const TextStyle(
                                                    fontSize: 17),
                                              ),
                                            ),
                                            subtitle: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              child: Text(kyoat[index],
                                                  style: const TextStyle(
                                                      fontSize: 14)),
                                            ),
                                            tileColor: const Color.fromARGB(
                                                255, 241, 249, 255),
                                            trailing: FittedBox(
                                                fit: BoxFit.fitHeight,
                                                child: Crowd(index: index,)),

                                            /*DropdownButton(
              items: const [
                DropdownMenuItem(
                  value: 0,
                  child: Text('1'),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text('2'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('3'),
                ),
              ],
              onChanged: (value) {
               FirebaseFirestore.instance
                        .collection('classes')
                        .doc(doc.id)
                        .update({'crowd' : value});
              },
              value: data['crowd'],
            ),]
            ),*/
                                            onTap: () {
                                              context.push('/$index');
                                            }, //gorouterでのタップ時遷移　仮
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                          )));
                                })
                    ]))));
  }
}

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
                      '6月19日（月）9:00~15:00\n6月19日（月）9:30~15:30',
                      style: TextStyle(fontSize: 18),
                    ),
                  ])),
          SizedBox(
            //間設定
            height: 15,
          ),
          Center(
            child: Text(
              '舞台発表',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 10,
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
        labelColor: Colors.black,
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

class Club extends StatefulWidget {
  const Club({super.key});

  @override
  State<Club> createState() => _Club();
}

class _Club extends State<Club> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        //スクロール可能
        child: Padding(
            //余白設定
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 12,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                  padding: EdgeInsets.only(left: 20, top: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '博覧会',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 35),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '6月19日（月）9:00~15:00\n6月19日（月）9:30~15:30',
                          style: TextStyle(fontSize: 18),
                        ),
                      ])),
              const SizedBox(
                //間設定
                height: 15,
              ),
              const Center(
                child: Text(
                  '展示一覧',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  //体育祭の各種目を一覧表示
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        //ここからを表示
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                        child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                //side: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                              tileColor:
                                  const Color.fromARGB(255, 241, 249, 255),
                              onTap: () {
                                context.push('/$index');
                              }, //gorouterでのタップ時遷移　仮
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            )));
                  })
            ])));
  }
}

class Crowd extends StatefulWidget{
   const Crowd({super.key,required this.index});
   final int index;

  @override
  State<Crowd> createState() => _Crowd();
}

class _Crowd extends State<Crowd> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('classes')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Image.asset('images/crowdone.jpg');
                            }
                            if (!snapshot.hasData) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            final docs = snapshot.data!.docs;
                            final doc = docs[widget.index];
                                  final data =
                                      doc.data()! as Map<String, dynamic>;
                                  final List<Widget> crowdimg = <Widget>[
                                    Image.asset('images/crowdone.jpg'),
                                    Image.asset('images/crowdtwo.jpg'),
                                    Image.asset('images/crowdthree.jpg'),
                                  ];
                            return crowdimg.elementAt(data['crowd']);
                          }
    );

  }
}