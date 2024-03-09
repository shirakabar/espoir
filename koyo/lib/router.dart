import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:koyo/crowd.dart';
import 'package:koyo/main.dart';
import 'package:koyo/come.dart';
import 'package:koyo/result.dart';
import 'package:koyo/ticket.dart';

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
  ]
);