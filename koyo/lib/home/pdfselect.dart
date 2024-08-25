import 'package:flutter/material.dart';
import 'package:koyo/widget/pdfview.dart';
import 'package:koyo/widget/widget.dart';

class Pdfselect extends StatelessWidget {
  const Pdfselect({super.key});


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: const Bar(title: '要項一覧'),
      body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(//ここからを表示
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child:
              Column(children: [
                
                ListTile(
                        title: const Text('体育祭実施要項'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pdfview(
                                    pdf: 'assets/docs/sportsprogram.pdf',
                                    title: '体育祭実施要項')),
                          );
                        },
                      ),
                      
                      const Divider(
                        //線
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),
              ListTile(
                        title: const Text('文化祭実施要項'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pdfview(
                                    pdf: 'assets/docs/bunkasaipolicy.pdf',
                                    title: '文化祭実施要項')),
                          );
                        },
                      ),
                      
                      const Divider(
                        //線
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),      
              ListTile(
                        title: const Text('博覧会実施要項'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pdfview(
                                    pdf: 'assets/docs/hakurankaipolicy.pdf',
                                    title: '博覧会実施要項')),
                          );
                        },
                      ),
                      
                      const Divider(
                        //線
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),      
              ListTile(
                        title: const Text('後夜祭実施要項'),
                        onTap: null /*() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Pdfview(
                                    pdf: 'assets/docs/.pdf',
                                    title: '後夜祭実施要項')),
                          );
                        },*/
                      ),
                      
                      const Divider(
                        //線
                        height: 1,
                        thickness: 1,
                        color: Colors.grey,
                      ),        

              ],)
            )],
         )
        );
      
}
}