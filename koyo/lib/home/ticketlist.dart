import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:koyo/data/localdata.dart';
import 'package:koyo/widget/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:koyo/data/hakurandata.dart';

class Ticket {
  const Ticket(
      {required this.time,
      required this.classname,
      required this.day,
      required this.starttime});

  final String time;
  final String classname;
  final String day;
  final String starttime;
}

//獲得整理券一覧

class TicketList extends StatefulWidget {
  const TicketList({super.key});

  @override
  State<TicketList> createState() => _TicketList();
}

class _TicketList extends State<TicketList> {
  final List<String> timelist = [
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00'
  ];
  final List<String> classlist = [
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
  List<dynamic> ticketlist = [];
  List<dynamic> newticketlist = [];
  bool isloaded = false;
  final _hakurankaidata = HakurankaidataList().hakurankaidata;

  Widget useticketdialog(
      {required time, required classname, required day, required starttime}) {
    return AlertDialog(
      title: const Text("整理券詳細"),
      content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "この画面をスタッフに見せてください",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              "日付：$day",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "時間：$time",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "クラス：$classname",
              style: const TextStyle(fontSize: 20),
            ),
          ]),
      actions: [
        TextButton(
            child: const Text("使用"),
            onPressed: () {
              Navigator.pop(context);
              showDialog(
                    context: context,
                    builder: (context) {
                      return seconduseticketdialog(
                        starttime: starttime,
                      );
                    }).then((value) {
                  setState(() {
                    isloaded = false;
                  });
                });
            }),
        TextButton(
          child: const Text("閉じる"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget seconduseticketdialog({required starttime}) {
    return AlertDialog(
      title: const Text("整理券使用"),
      content: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "本当に使用しますか？",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            SizedBox(height: 10)
          ]),
      actions: [
        TextButton(
            child: const Text("使用"),
            onPressed: () {
              _removeticket(starttime: starttime);
            }),
        TextButton(
          child: const Text("閉じる"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Future<void> getTicket() async {
    newticketlist = [];
    ticketlist = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (String time in timelist) {
      if (prefs.containsKey(time)) {
        String? jsonString = prefs.getString(time);
        Map<String, dynamic> decodedJson = jsonDecode(jsonString!);
        debugPrint('decodedjson:${decodedJson.toString()}');
        newticketlist.add(Ticket(
          time: decodedJson['time'],
          classname: decodedJson['classname'],
          day: decodedJson['day'],
          starttime: decodedJson['starttime'],
        ));
      }
      debugPrint(time);
      debugPrint('finished');
    }
    setState(() {
      ticketlist = newticketlist;
    });
  }

  _removeticket({required starttime}) {
    try {
      LocalData.deleteLocalData(starttime);
      const snackBar = SnackBar(
        content: Text("整理券を使用しました"),
        duration: Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    } catch (e) {
      const snackBar = SnackBar(
        content: Text("エラーが発生しました"),
        duration: Duration(seconds: 1),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    }
  }

  int _getindex(index) {
    return classlist.indexOf(ticketlist[index].classname);
  }

  //初期設定用に使ってねfloating actionbuttonとかで実行させるといいと思う
  /*void _firstsetting() {
    for (String classname in classlist) {
      debugPrint(classname);
      for (String time in timelist) {
        debugPrint(time);
        FirebaseFirestore.instance
            .collection('Ticket')
            .doc(classname)
            .update({time: 10});
      }
    }
  }*/
  Widget ticketcard({required index}) {
    return GestureDetector(onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return useticketdialog(
                        time: ticketlist[index].time, //ticketlist[index].time は10:00 ~ 10:30の形
                        classname: ticketlist[index].classname,
                        day: ticketlist[index].day,
                        starttime: ticketlist[index].starttime,
                      );
                    });
              },child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            color: const Color.fromARGB(255, 241, 249, 255),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Stack(children: [
              Padding(
              padding: const EdgeInsets.only(left: 20,right: 10,top: 10,bottom: 10),
              child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                ticketlist[index].time,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              Text(_hakurankaidata[_getindex(index)].place,style: TextStyle(fontSize: 15, color: Colors.grey[600])),
              const Divider(color: Colors.grey,thickness: 1,),
              Text(
                _hakurankaidata[_getindex(index)].title,
                style: const TextStyle(fontSize: 19),
              ),
              const SizedBox(height: 30,)
            ],) ),
              Positioned(
                right: 20,
                top: 0,
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 7,left: 7,top: 3,bottom: 3),
                    child: Center(child: Text('${ticketlist[index].day}限り有効',style: const TextStyle(color: Colors.white,fontSize: 11),)), ),
                    )
              ),
            ]
                    )
              ),
            );
  }

  @override
  Widget build(BuildContext context) {
    if (!isloaded) {
      getTicket();
      isloaded = true;
    }
    return Scaffold(
        appBar: const Bar(title: '整理券'),
        floatingActionButton: FloatingActionButton(
            onPressed: () => context.push('/mobilescan'),
            child: const Icon(Icons.add)),
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
                          child: Column(children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '※タップで使用します',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                            ),
                          ])),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          //一覧表示
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: ticketlist.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ticketcard(index: index);
                          })
                    ]))));
  }
}
