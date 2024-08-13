import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ticketmanagedialog extends StatefulWidget {
  const Ticketmanagedialog({super.key,required this.classname, required this.index, required this.number, required this.hourhalf});
  final String classname;
  final int index;
  final int number;
  final String hourhalf;

  @override
  State<Ticketmanagedialog> createState() => _Ticketmanagedialog();
}

class _Ticketmanagedialog extends State<Ticketmanagedialog> {
  final List<String> hour = ['10:00', '11:00', '12:00', '13:00', '14:00', '15:00'];
  final List<String> half = ['10:30', '11:30', '12:30', '13:30', '14:30'];

  @override
  Widget build(BuildContext context) {
    final int index = widget.index;
    final String classname = widget.classname;
    int localnumber = widget.number;
    final String hourhalf = widget.hourhalf;
    return SimpleDialog(title: const Text('枚数変更'), children: [
      StatefulBuilder(
        builder: (context,setState) {
      return SimpleDialogOption(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                (hourhalf == 'hour') ? //hourとhalfの使い分け三項演算子
                Text(
                  '${hour[index]}~${half[index]}',
                  style: const TextStyle(fontSize: 25),
                ) : Text(
                  '${half[index]}~${hour[index + 1]}',
                  style: const TextStyle(fontSize: 25),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Theme.of(context).primaryColor,width: 2)
                        ),
                    child: Text('$localnumber',style: const TextStyle(fontSize: 20))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: (localnumber > 0) ? () {
                        setState(() {
                          --localnumber;
                        });
                      }: null,
                      onLongPress: (localnumber > 10) ?() {
                        setState(() {
                          localnumber -= 10;
                        });
                      }: null,
                      style: OutlinedButton.styleFrom(
                          minimumSize: const Size(100, 40),
                          backgroundColor: Colors.transparent,
                          side: const BorderSide(color: Colors.transparent)),
                      child: const Icon(Icons.remove,
                          color: Colors.grey, size: 40),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          ++localnumber;
                        });
                      },
                      onLongPress: () {
                        setState(() {
                          localnumber += 10;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                          minimumSize: const Size(100, 40),
                          backgroundColor: Colors.transparent,
                          side: const BorderSide(color: Colors.transparent)),
                      child: const Icon(Icons.add,
                          color: Colors.grey, size: 40),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text('※長押しで10ずつ変更します',style: TextStyle(color: Colors.grey,fontSize: 15)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize: const Size(100, 40),
                            backgroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        onPressed: () {
                          (hourhalf == 'hour') ? //三項演算子
                          FirebaseFirestore.instance
                              .collection("Ticket")
                              .doc(classname)
                              .update({hour[index]: localnumber}) : 
                          FirebaseFirestore.instance
                              .collection("Ticket")
                              .doc(classname)
                              .update({half[index]: localnumber});  
                            
                          Navigator.pop(context);
                          const snackBar = SnackBar(
                            content: Text("更新しました"),
                            duration: Duration(seconds: 1),
                          );
                          if (context.mounted) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: const Text(
                          '更新',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 2,
                      width: 20,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize: const Size(100, 40),
                            backgroundColor: Theme.of(context).primaryColor,
                            side: BorderSide(
                                color: Theme.of(context).primaryColor)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('閉じる',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)))
                  ],
                )
              ])));})
    ]);
  }
}