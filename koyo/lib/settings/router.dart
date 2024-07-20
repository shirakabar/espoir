import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:koyo/account/account.dart';
import 'package:koyo/home/mobilescan.dart';
import 'package:koyo/home/ticketlist.dart';
import 'package:koyo/staff/adminselect.dart';
import 'package:koyo/home/policyselect.dart';
import 'package:koyo/result/resultmake.dart';
import 'package:koyo/staff/staffselect.dart';
import 'package:koyo/widget/come.dart';
import 'package:koyo/result/result.dart';
import 'package:koyo/home/news.dart';
import 'package:koyo/staff/newsmake.dart';
import 'package:koyo/staff/pushnotificaion.dart';
import 'package:koyo/widget/bottomnavi.dart';

//gorouterは画面遷移用の外部パッケージ
//遷移先一覧

final goRouter = GoRouter(
  
  initialLocation: '/',//最初に表示される画面

  //各画面のpath、名前を指定
  routes: [GoRoute(
      path: '/',
      name: 'initial',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const Bottomnavi(),
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
      path: '/ticketlist',
      name: 'ticketlist',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const TicketList(),
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

    GoRoute(
      path: '/mobilescan',
      name: 'mobilescan',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const Mobilescan(),
        );
      },
    ),


  ]
);