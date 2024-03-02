import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//ほおむ

class Home extends StatefulWidget {
  const Home({super.key});

  
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: 
         SingleChildScrollView(child:
        Column(
           mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Theme.of(context).primaryColor,
              width: double.infinity,//横無限
              height: 425,//機種によってはオーバーフローするっぽい
              child: Column(children: [
                const Text('第76回向陽祭',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
                Image.asset('images/esupo.png',fit: BoxFit.contain)//エスポワールの画像
              ],
              )
              ),
            Container(
              color: Colors.indigo[900],
              width: double.infinity,
              height: 15,
              //child: const Text('博覧会:8:00~8:00',style: (TextStyle(color: Colors.white)),textAlign: TextAlign.center,),
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
                  context.push('/crowd');
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
                  context.push('/');
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

              Padding(padding: const EdgeInsets.symmetric(horizontal: 5), 
              child:
              SizedBox(
                height:200,
                child: ListView.builder(
                shrinkWrap: true,//なんか必要
                itemExtent: 180,//高さ
                scrollDirection: Axis.horizontal,//横スクロール
                itemCount: 3,//仮
                itemBuilder:  (BuildContext context, int index) {
            return  Card(
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

