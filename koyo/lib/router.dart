import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
//import 'package:koyo/crowd.dart';
import 'package:koyo/main.dart';
import 'package:koyo/come.dart';
import 'package:koyo/firestore.dart';

//遷移先一覧

final goRouter = GoRouter(
  
  initialLocation: '/',
  
  routes: [
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
      path: '/store',
      name: 'store',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const MyWidget(),
        );
      },
    ),

    /*GoRoute(
      path: '/crowd',
      name: 'crowd',
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const Crowd(),
        );
      },
    ),*/
  ]
);