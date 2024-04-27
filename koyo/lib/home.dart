import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

//ほおむ
//

class Home extends StatefulWidget {
  const Home({super.key});

  
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.push('/');
          }, 
          icon: const Icon(Icons.menu),
          ),
        actions: [IconButton(
          onPressed: () {
            context.push('/');
          }, 
          icon: const Icon(Icons.menu),
          ),],
        backgroundColor: const Color(0xFFEEEEEE),
        title: const Text('第76回向陽祭',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
        centerTitle: true,

        ),
      body: 
         SingleChildScrollView(child:
        Column(
           mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 430,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.white,
                      Color(0xFFEEEEEE),
                      ],
               stops: [
                  0.5,
                  1.0,
                 ],
    ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),      
                child:  Container(
                decoration: (BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  /*boxShadow: const [BoxShadow(
                    color: (Color.fromARGB(255, 100, 159, 218)),  
                    blurRadius: 20.0,
                    spreadRadius: 5.0,
                )],*/
                color: Theme.of(context).primaryColor,
              )),
              width: double.infinity,//横無限
              height: 300,//機種によってはオーバーフローするっぽい
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                //const Text('第76回向陽祭',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                Image.asset('images/esupo.png',fit: BoxFit.fitHeight)//エスポワールの画像
              ],
              )
            ),
              ),
            ),
        
            const SizedBox(
             height: 40,
            ),
                             
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,//均等に横に並べる
                children: [
                OutlinedButton(
                onPressed: () {
                  context.push('/result');//結果ページへ遷移
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,//背景透明
                  side: const BorderSide(color: Colors.transparent),//OutlinedButtonのoutlineを透明にするという冒涜
                  fixedSize: const Size(135, 50)
                ),
                child: Column(
                  children: [
                    Icon(Icons.emoji_events,color: Theme.of(context).primaryColor,),//アイコン
                    const Text('結果',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                  ],
                )
                
                ),

                
                OutlinedButton(
                onPressed: () {
                  context.push('/ticket');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.transparent),
                   fixedSize: const Size(135, 50)
                ),
                child: Column(
                  children: [
                    Icon(Icons.receipt,color: Theme.of(context).primaryColor,),
                    const Text('整理券',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                  ],
                )
                
                ),

                
               OutlinedButton(
                onPressed: () {
                  context.push('/crowd');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.transparent),
                   fixedSize: const Size(135, 50)
                ),
                child: Column(
                  children: [
                    Icon(Icons.description,color: Theme.of(context).primaryColor,),
                    const Text('アンケート',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                  ],
                )
                
                ),
                ]
              
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                OutlinedButton(
                onPressed: () {
                  context.push('/');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.transparent),
                                     fixedSize: const Size(135, 50)
                ),
                child: Column(
                  children: [
                    Icon(Icons.account_circle,color: Theme.of(context).primaryColor,),
                    const Text('アカウント',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                  ],
                )
                
                ),
               
                OutlinedButton(
                  //お問い合わせじゃなかったら別のところに追いやってね
                onPressed: () {
                  final url = Uri.parse('https://forms.office.com/Pages/ResponsePage.aspx?id=DQSIkWdsW0yxEjajBLZtrQAAAAAAAAAAAAN__kqOgrtUOTlOV0lDVFZZSktRTDNGTUJGODYzODRENy4u');
                  launchUrl(url);
                  context.push('/');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.transparent),
                                     fixedSize: const Size(135, 50)
                ),
                child: Column(
                  children: [
                    Icon(Icons.support_agent,color: Theme.of(context).primaryColor,),
                    const Text('お問い合わせ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                  ],
                )
                
                ),
                OutlinedButton(
                onPressed: () {
                  context.push('/');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.transparent),
                                     fixedSize: const Size(135, 50)
                ),
                child: Column(
                  children: [
                    Icon(Icons.article,color: Theme.of(context).primaryColor,),
                    const Text('要項',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                    
                  ],
                )
                
                ),
              ],),

              const SizedBox(
                height: 20,
              ),

              const Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15), 
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('お知らせ',
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)
              ),
              )
              ),
              const SizedBox(
                height: 10,
              ),

              Padding(padding: const EdgeInsets.only(left: 5), 
              child:
              SizedBox(
                height:180,
                child: ListView.builder(//なぜか下の影が切れてる
                itemExtent: 180,//横幅
                scrollDirection: Axis.horizontal,//横スクロール
                itemCount: 3,//仮
                itemBuilder:  (BuildContext context, int index) {
            return Card(
                color: Colors.white,
                elevation: 5,//影
                margin: const EdgeInsets.symmetric(horizontal: 5), 
                shape: const RoundedRectangleBorder(
            //side: BorderSide(color: Colors.grey),
           borderRadius: BorderRadius.all(Radius.circular(20))//角はとろう
          ),
              child: ListTile(
                title: const Text('試験アナウンス',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                //subtitle: const Text('あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよわをん'),
                //tileColor: Colors.white,
                onTap: () {
                  context.push('/$index');
                },
                tileColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
            )
              
                );
                }
              ),
              )
              ),
             const SizedBox(
              height: 15,
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child:Column(children: [
              const Divider(//線
                  height: 1,
                  thickness: 1,
                  color: Colors.grey,
                ),
              ListTile(
                title: const Text('利用規約'),
                onTap: () {
                  context.push('/crowd');
                },
              ),
               const Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey,
                ),
              ]
              )
              )
             ],
        
        ),
         )
      );
      
    
  }
}
