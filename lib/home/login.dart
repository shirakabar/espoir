import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:koyo/loginprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Login extends ConsumerStatefulWidget {
  const Login({super.key});

  @override
  ConsumerState<Login> createState() => _Login();
}

class _Login extends ConsumerState<Login> {
  final TextEditingController _classcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _classcontroller.dispose();
    _passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(children: [
                      /*const Text(
                          'ログイン',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                      const SizedBox(height: 20,),*/
                      TextFormField(
                        autovalidateMode: AutovalidateMode.disabled,
                        validator: (value) {
                          // _formKey.currentState.validate()でコールされる
                          if (value == null || value.isEmpty) {
                            return 'クラスを入力してください'; // エラー表示のメッセージを返す
                          }
                          return null; // 問題ない場合はnullを返す
                        },
                        controller: _classcontroller,
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
                            labelText: 'クラス(例:101)',
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
                            return 'パスワードを入力してください'; // エラー表示のメッセージを返す
                          }
                          return null; // 問題ない場合はnullを返す
                        },
                        controller: _passcontroller,
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
                            labelText: 'パスワード',
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
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            fixedSize: const Size(120, 40),
                              backgroundColor: Theme.of(context).primaryColor,
                              side: BorderSide(
                                  color: Theme.of(context).primaryColor)),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              bool canlogin = false;
                              LoginType? logintype;
                              var password = await FirebaseFirestore.instance
                                  .collection('Password')
                                  .doc('password')
                                  .get();

                              if (_passcontroller.text == password['student']) {
                                canlogin = true;
                                logintype = LoginType.student;
                              } else if (_passcontroller.text == password['admin']) {
                                canlogin = true;
                                logintype = LoginType.admin;
                              } else if (_passcontroller.text == password['staff']) {
                                canlogin = true;
                                logintype = LoginType.staff;
                              }

                              if (canlogin) {
                                await LoginDataManager.login(ref, logintype!, _classcontroller.text);
                                const snackBar = SnackBar(
                                  content: Text("ログインしました"),
                                  duration: Duration(seconds: 1),
                                );
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            }
                          },
                          child: const Text('ログイン',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))
                    ])));
  }
}
