import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:koyo/widget/widget.dart';

//お知らせ作成ページ
class Newsmake extends StatefulWidget {
  const Newsmake({super.key});

  @override
  State<Newsmake> createState() => _Newsmake();
}

class _Newsmake extends State<Newsmake> {
  final TextEditingController _makecontroller = TextEditingController();
  final TextEditingController _contentcontroller = TextEditingController();
  final TextEditingController _titlecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _makecontroller.dispose();
    _contentcontroller.dispose();
    _titlecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Bar(title: 'おしらせ作成'),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: (value) {
                          // _formKey.currentState.validate()でコールされる
                          if (value == null || value.isEmpty) {
                            return 'タイトルを入力してください'; // エラー表示のメッセージを返す
                          }
                          return null; // 問題ない場合はnullを返す
                        },
                        controller: _titlecontroller,
                        onChanged: (value) => setState(() {}),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2.0,
                              ),
                            ),
                            labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                            labelText: 'タイトル',
                            floatingLabelStyle: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1.0,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFFB71C1C),
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xFFB71C1C), //red900
                              ),
                            ),
                            errorStyle:
                                const TextStyle(color: Color(0xFFB71C1C))),
                      ),
                      const SizedBox(height: 10, width: double.infinity),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: (value) {
                          // _formKey.currentState.validate()でコールされる
                          if (value == null || value.isEmpty) {
                            return '作成者名を入力してください'; // エラー表示のメッセージを返す
                          }
                          return null; // 問題ない場合はnullを返す
                        },
                        controller: _makecontroller,
                        onChanged: (value) => setState(() {}),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2.0,
                              ),
                            ),
                            labelStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                            labelText: '作成者名',
                            floatingLabelStyle: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 1.0,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xFFB71C1C),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFFB71C1C),
                              ),
                            ),
                            errorStyle:
                                const TextStyle(color: Color(0xFFB71C1C))),
                      ),
                      const SizedBox(height: 10, width: double.infinity),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: (value) {
                          // _formKey.currentState.validate()でコールされる
                          if (value == null || value.isEmpty) {
                            return '内容を入力してください'; // エラー表示のメッセージを返す
                          }
                          return null; // 問題ない場合はnullを返す
                        },
                        controller: _contentcontroller,
                        onChanged: (value) => setState(() {}),
                        maxLines: 6,
                        minLines: 6,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            labelText: '内容',
                            floatingLabelStyle: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).primaryColor,
                            ),
                            labelStyle: const TextStyle(
                                fontSize: 18, color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xFFB71C1C),
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Color(0xFFB71C1C),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 2,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            errorStyle:
                                const TextStyle(color: Color(0xFFB71C1C))),
                      ),
                      const SizedBox(height: 10, width: double.infinity),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await FirebaseFirestore.instance
                                  .collection("news")
                                  .doc(_titlecontroller.text)
                                  .set({
                                "createdAt": Timestamp.fromDate(DateTime.now()),
                                "content": _contentcontroller.text,
                                "createdBy": _makecontroller.text
                              });
                              _contentcontroller.text = '';
                              _titlecontroller.text = '';
                              _makecontroller.text = '';
                              const snackBar = SnackBar(
                                content: Text("お知らせを作成しました"),
                                duration: Duration(seconds: 1),
                              );
                              if (context.mounted) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            }
                          },
                          child: const Text('送信'))
                    ])))));
  }
}
