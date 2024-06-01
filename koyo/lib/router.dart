import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:koyo/home/account.dart';
import 'package:koyo/home/adminselect.dart';
import 'package:koyo/home/policyselect.dart';
import 'package:koyo/home/resultmake.dart';
import 'package:koyo/home/staffselect.dart';
import 'package:koyo/main.dart';
import 'package:koyo/come.dart';
import 'package:koyo/home/result.dart';
import 'package:koyo/home/ticket.dart';
import 'package:koyo/news.dart';
import 'package:koyo/staff/newsmake.dart';
import 'package:koyo/home/crowd.dart';
import 'package:koyo/staff/pushnotificaion.dart';

//gorouterは画面遷移用の外部パッケージ
//遷移先一覧

final goRouter = GoRouter(
  
  initialLocation: '/',//最初に表示される画面
  
  routes: [//各画面のpath、名前を指定
    GoRoute(
      path: '/',
      name: 'initial',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const MyHomePage(),
        );
      },
    ),
    
    GoRoute(
      path: '/come',
      name: 'come',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const Come(),
        );
      },
    ),

    GoRoute(
      path: '/crowd',
      name: 'crowd',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const Crowd(),
        );
      },
    ),

    GoRoute(
      path: '/result',
      name: 'result',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const Result(),
        );
      },
    ),

    GoRoute(
      path: '/ticket',
      name: 'ticket',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const Ticket(),
        );
      },
    ),

     GoRoute(
      path: '/news',
      name: 'news',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const News(),
        );
      },
    ),

    GoRoute(
      path: '/account',
      name: 'account',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const Account(),
        );
      },
    ),

    GoRoute(
      path: '/newsmake',
      name: 'newsmake',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const Newsmake(),
        );
      },
    ),

    GoRoute(
      path: '/push',
      name: 'push',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const Push(),
        );
      },
    ),

    GoRoute(
      path: '/resultmake',
      name: 'resultmake',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const Resultmakesp(),
        );
      },
    ),

    GoRoute(
      path: '/adminselect',
      name: 'adminselect',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const Adminselect(),
        );
      },
    ),

    GoRoute(
      path: '/staffselect',
      name: 'staffselect',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const Staffselect(),
        );
      },
    ),

    GoRoute(
      path: '/policyselect',
      name: 'policyselect',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const Policyselect(),
        );
      },
    ),


  ]
);