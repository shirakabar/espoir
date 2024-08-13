import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:koyo/settings/loginprovider.dart';

//整理券配布

class Classcrowd extends ConsumerStatefulWidget {
  const Classcrowd({super.key});

  @override
  ConsumerState<Classcrowd> createState() => _Classcrowd();
}

class _Classcrowd extends ConsumerState<Classcrowd> {
  int localcrowd = 0;
  int remotecrowd = 0;
  String classname = '';
  final List<Widget> crowdimg = <Widget>[
    Image.asset('assets/images/crowdone.png'),
    Image.asset('assets/images/crowdtwo.png'),
    Image.asset('assets/images/crowdthree.png'),
  ];
  final List<String> crowdtextList = [
    '混雑度レベル：１\nほぼ並ばずに入場できる',
    '混雑度レベル：２\n教室の幅に収まるほどの列がある',
    '混雑度レベル：３\n教室の幅に収まらないほどの列がある',
  ];

  _imgcrowd() {
    return SizedBox(
      height: 250,
      width: 250,
      child: crowdimg.elementAt(localcrowd)
    );
  }

  void _getcrowd(String classname) async {
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection('Crowd')
            .doc('classes')
            .get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;/*Unhandled Exception: type 'Null' is not a subtype of type 'int'*/
    remotecrowd = data[classname];
    setState(() {
      localcrowd = remotecrowd;
    });
  }

  @override
  void initState() {
    super.initState();
    Future(() {
   _getcrowd(classname);
  });
  }

  //初期設定用に使ってねicon buttonとかで実行させるといいと思う
  /*final List<String> classlist = ['101','102','103','104','105','106','107','108','109',
  '201','202','203','204','205','206','207','208','209',
  '301','302','303','304','305','306','307','308','309',
  ];
  void _firstsetting() {
    for (String classname in classlist) {
      debugPrint(classname);
        FirebaseFirestore.instance
            .collection('Crowd')
            .doc('classes')
            .update({classname : 0});
      
    }
  }*/

  @override
  Widget build(BuildContext context) {
    classname = ref.watch(loggedInClassProvider);
    return Scaffold(
        body: Padding(
            //余白設定
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 12,
            ),
            child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
              Text(
                '$classname混雑度変更',
                style: const TextStyle(color: Colors.black, fontSize: 26),
              ),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor,width: 4),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.transparent
                ),
                child: _imgcrowd()),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (localcrowd == 0) return;
                          setState((){
                         --localcrowd;
                         debugPrint(localcrowd.toString());
                          });
                        },
                        icon: const Icon(Icons.arrow_left,
                            color: Colors.grey, size: 70)),
                    IconButton(
                        onPressed: () {
                          if (localcrowd == 2) return;
                          setState((){
                            ++localcrowd; 
                            debugPrint(localcrowd.toString());
                          });
                        },
                        icon: const Icon(Icons.arrow_right,
                            color: Colors.grey, size: 70)),
                  ],
                ),
              Text(crowdtextList[localcrowd], style: const TextStyle(fontSize: 20)),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                            minimumSize: const Size(200, 50),
                              backgroundColor: Theme.of(context).primaryColor,
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                onPressed: (localcrowd == remotecrowd) ? null : () {
                FirebaseFirestore.instance.collection('Crowd').doc('classes').update({
                  classname : localcrowd
                });
                setState(() {
                  remotecrowd = localcrowd;
                });
                const snackBar = SnackBar(
                  content: Text("混雑度を更新しました"),
                  duration: Duration(seconds: 1),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }, child: const Text('更新',style : TextStyle(color: Colors.white,fontWeight: FontWeight.bold)))
            ])));
  }
}
