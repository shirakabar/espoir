import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Resultdetail {
  const Resultdetail({required this.resultname, required this.ismulti});

  final String resultname;
  final bool ismulti;
}

class Resulthakuran extends StatefulWidget {
  const Resulthakuran({super.key});

  @override
  State<Resulthakuran> createState() => _Resulthakuran();
}

class _Resulthakuran extends State<Resulthakuran> {

  final List resultdetaillist = const [
    Resultdetail(resultname: '向陽大賞', ismulti: false),
    Resultdetail(resultname: 'ポスター大賞', ismulti: false),
    Resultdetail(resultname: '学年最優秀賞', ismulti: true),
    Resultdetail(resultname: '学年ポスター大賞', ismulti: true),
    ];
  final List keyList = ['1年','2年','3年'];

  Widget _resultmulti(resultMap) {
    if (resultMap['1年'].isEmpty) {
      return const Text('発表をお待ちください');
    } else {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: resultMap.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              ListTile(
              leading: Text(keyList[index],style: const TextStyle(fontSize: 16),),
              title: Text(resultMap[keyList[index]],style: const TextStyle(fontSize: 16),),
            ),
            const Divider(height: 1,color: Colors.grey,indent: 5,endIndent: 5),
            ]);
          }
          
      );
    }
  }

  Widget _resultone(classname) {
    if (classname.isEmpty) {
      return const Text('発表をお待ちください');
    } else {
      return Text(classname,style: const TextStyle(fontSize: 18));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Results')
                .doc('hakurankairesult')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('エラーが発生しました');
              }
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                   final eachresult =  data[resultdetaillist[index].resultname];
                  return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 2),
                      child: Card(
                        color: const Color.fromARGB(255, 241, 249, 255),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                  padding: const EdgeInsets.only(right: 10, left: 10,top: 12,bottom: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        resultdetaillist[index].resultname,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                        width: double.infinity,
                                      ),
                                    (resultdetaillist[index].ismulti == true) ?  
                                      _resultmulti(eachresult) : 
                                      _resultone(eachresult)
                                    ],
                                  ),
                                )
                          ]),)
                      );
                },
              );
            }));
  }
}
