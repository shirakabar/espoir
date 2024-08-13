import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:koyo/hakurankai/butai.dart';
import 'package:koyo/widget/pdfview.dart';
import 'package:koyo/data/hakurandata.dart';


//博覧のdetailそれぞれのページの内容記載

class Kyo extends StatefulWidget {
  const Kyo({super.key});
  
  @override
  State<Kyo> createState() => _Kyo();
}

class _Kyo extends State<Kyo> {
  final _hakurankaidata = HakurankaidataList().hakurankaidata;

  _crowd(int index) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('classes').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Image.asset('assets/images/crowdzero.png');
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;
          final doc = docs[index];
          final data = doc.data()! as Map<String, dynamic>;
          final List<Widget> crowdimg = <Widget>[
            Image.asset('assets/images/crowdone.png'),
            Image.asset('assets/images/crowdtwo.png'),
            Image.asset('assets/images/crowdthree.png'),
          ];
          return crowdimg.elementAt(data['crowd']);
        });
  }

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
                                  '9月6日（金）\n9月7日（土）',
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
                          itemCount: _hakurankaidata.length,
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
                                          child: Image.asset('assets/images/postest.jpg')),//仮の画像
                                      title: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(
                                          _hakurankaidata[index].title,
                                          style: const TextStyle(fontSize: 17),
                                        ),
                                      ),
                                      subtitle: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        child: Text(_hakurankaidata[index].place,
                                            style:
                                                const TextStyle(fontSize: 14)),
                                      ),
                                      tileColor: const Color.fromARGB(
                                          255, 241, 249, 255),
                                      trailing:  ClipRRect(
                                            borderRadius: BorderRadius.circular(5), 
                                            child: FittedBox(
                                          fit: BoxFit.fitHeight,
                                          child: _crowd(index))),
                                      onTap: () {
                                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pdfview(
                                    pdf: 'assets/docs/hakurankaipolicy.pdf',
                                    title: '博覧会実施要項')),
                          );
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
                      '9月6日（金）\n9月7日（土）',
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
                          '9月6日（金）\n9月7日（土）',
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
                                context.push('/come');
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
