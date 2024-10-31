import 'package:flutter/material.dart';
import 'package:koyo/data/hakurandata.dart';
import 'package:koyo/hakurankai/hakuranclassde.dart';
import 'package:koyo/map/fourthfloor.dart';
import 'package:koyo/map/firstfloor.dart';
import 'package:koyo/map/secondfloor.dart';
import 'package:koyo/map/thirdfloor.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/widget/widget.dart';

//マップの遷移一覧
class Map extends StatelessWidget {
  const Map({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          drawer: Draw(),
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text('校内マップ', style: TextStyle(color: Colors.white)),
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
                Tab(text: '1F'),
                Tab(text: '2F'),
                Tab(text: '3F'),
                Tab(text: '4F'),
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
              FirstFloor(),
              SecondFloor(),
              ThirdFloor(),
              FourthFloor(),
            ],
          )),
        ));
  }
}

class Classbutton extends StatelessWidget {
  Classbutton({super.key, required this.classname, this.buttonname});
  final _hakurankaidata = HakurankaidataList().hakurankaidata;
  final _ichirandata = IchirandataList().ichirandata;
  final String classname;
  final String? buttonname;
  final List<String> onetwoclasslist = [
    '101',
    '102',
    '103',
    '104',
    '105',
    '106',
    '107',
    '108',
    '109',
    '201',
    '202',
    '203',
    '204',
    '205',
    '206',
    '207',
    '208',
    '209',
  ];
  final List<String> threeclasslist = [
    '301',
    '302',
    '303',
    '304',
    '305',
    '306',
    '307',
    '308',
    '309',
  ];

  @override
  Widget build(BuildContext context) {
    int index;
    if (classname.startsWith('3')) {
      index = threeclasslist.indexOf(classname);
    } else {
      index = onetwoclasslist.indexOf(classname);
    }
    return TextButton(
        onPressed: () {
          if (classname.startsWith('3')) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => KyoDe(
                      classname: _ichirandata[index].classname,
                      title: _ichirandata[index].title,
                      place: '体育館',
                      detail: _ichirandata[index].detail)),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => KyoDe(
                      classname: _hakurankaidata[index].classname,
                      title: _hakurankaidata[index].title,
                      place: _hakurankaidata[index].place,
                      detail: _hakurankaidata[index].detail)),
            );
          }
        },
        child: FittedBox(
            fit: BoxFit.fitWidth,
            child:
                (buttonname == null) ? Text(classname) : Text('$buttonname')));
  }
}
