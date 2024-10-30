import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:koyo/account/account.dart';
import 'package:koyo/bunkakouya/live/liveselect.dart';
import 'package:koyo/bunkakouya/live/penlightselect.dart';
import 'package:koyo/bunkakouya/live/rythm.dart';
import 'package:koyo/home/classmanage.dart';
import 'package:koyo/home/firstoverboard.dart';
import 'package:koyo/staff/rythmmake.dart';
import 'package:koyo/ticket/mobilescan.dart';
import 'package:koyo/home/pdfselect.dart';
import 'package:koyo/ticket/ticketlist.dart';
import 'package:koyo/home/ticketmanage.dart';
import 'package:koyo/result/hakuranresultmake.dart';
import 'package:koyo/staff/adminselect.dart';
import 'package:koyo/home/policyselect.dart';
import 'package:koyo/result/resultmake.dart';
import 'package:koyo/staff/staffselect.dart';
import 'package:koyo/result/result.dart';
import 'package:koyo/home/news.dart';
import 'package:koyo/staff/newsmake.dart';
import 'package:koyo/staff/pushnotificaion.dart';
import 'package:koyo/widget/bottomnavi.dart';

//gorouterは画面遷移用パッケージ
//遷移先一覧

final goRouter = GoRouter(
    initialLocation: '/', //最初に表示される画面

    //各画面のpath、名前を指定
    routes: [
      GoRoute(
        path: '/',
        name: '/',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const Bottomnavi(),
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
      GoRoute(
        path: '/classmanage',
        name: 'classmanage',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const Classmanage(),
          );
        },
      ),
      GoRoute(
        path: '/ticketmanage',
        name: 'ticketmanage',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const Ticketmanage(),
          );
        },
      ),
      GoRoute(
        path: '/pdfselect',
        name: 'pdfselect',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const Pdfselect(),
          );
        },
      ),
      GoRoute(
        path: '/resultmakehakuran',
        name: 'resultmakehakuran',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const Resultmakehakuran(),
          );
        },
      ),
      GoRoute(
        path: '/penlightselect',
        name: 'penlightselect',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const Penlightselect(),
          );
        },
      ),
      GoRoute(
        path: '/firstoverboard',
        name: 'firstoverboard',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const FirstOverBoard()
          );
        },
      ),
      GoRoute(
        path: '/rythm',
        name: 'rythm',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const Rythm()
          );
        },
      ),
      GoRoute(
        path: '/liveselect',
        name: 'liveselect',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const Liveselect()
          );
        },
      ),
      GoRoute(
        path: '/rythmmake',
        name: 'rythmmake',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const Rythmmake()
          );
        },
      ),
         ]);
