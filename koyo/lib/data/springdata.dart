library springdata;
import 'package:koyo/sportsfestival/spring.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final List<String> items1 = [
  '指定なし',
  '08:40',
  '08:50',
  '09:00',
  '09:10',
  '09:20',
  '09:30',
  '09:40',
  '09:50',
  '10:00',
  '10:10',
  '10:20',
  '10:30',
  '10:40',
  '10:50',
  '11:00',
  '11:10',
  '11:20',
  '11:30',
  '11:40',
  '11:50',
  '12:00',
  '12:10',
  '12:20',
  '12:30',
  '12:40',
  '12:50',
  '13:00',
  '13:10',
  '13:20',
  '13:30',
  '13:40',
  '13:50',
  '14:00',
  '14:10',
  '14:20',
  '14:30',
  '14:40',
  '14:50',
  '15:00',
  '15:10',
  '終了',
];

final List<String> items2 = [
  '指定なし',
  '08:40',
  '08:50',
  '09:00',
  '09:10',
  '09:20',
  '09:30',
  '09:40',
  '09:50',
  '10:00',
  '10:10',
  '10:20',
  '10:30',
  '10:40',
  '10:50',
  '11:00',
  '11:10',
  '11:20',
  '11:30',
  '11:40',
  '11:50',
  '12:00',
  '12:10',
  '12:20',
  '12:30',
  '12:40',
  '12:50',
  '13:00',
  '13:10',
  '13:20',
  '13:30',
  '13:40',
  '13:50',
  '14:00',
  '14:10',
  '14:20',
  '14:30',
  '14:40',
  '14:50',
  '15:00',
  '15:10',
  '終了',
];

final List<String> dateitems = [
  '指定なし',
  '１日目',
  '２日目',
];

final List<String> classesitems = [
  '指定なし',
  '101',
  '102',
  '103',
  '104',
  '105',
  '106',
  '107',
  '108',
  '109',
  '201',
  '202',
  '203',
  '204',
  '205',
  '206',
  '207',
  '208',
  '209',
  '301',
  '302',
  '303',
  '304',
  '305',
  '306',
  '307',
  '308',
  '309',
  '教員1',
  '教員2',
  '教員3',
];
final List<String> competitionitems = [
  '指定なし',
  'サッカー',
  '卓球',
  '男子バドミントン',
  '女子バドミントン',
  '男子バレー',
  '女子バレー',
  'モルック',
];



final List<int> notificationdaylist = [
  8,
  9,
  12,
  13,
];
List<DateTime> notificationSelect = [DateTime(2030, 1, 1, 17, 59)];

class SpringdataListfirst {
  List<Springdata> springdatafirst = [
 Springdata(time: '08:50',team1: '101',team2: '103',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
 Springdata(time: '08:50',team1: '106',team2: '108',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
 Springdata(time: '09:03',team1: '106',team2: '108',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
 Springdata(time: '09:03',team1: '108',team2: '104',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '09:16',team1: '201',team2: '206',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '09:16',team1: '208',team2: '205',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '09:29',team1: '202',team2: '209',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '09:29',team1: '206',team2: '204',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '09:42',team1: '302',team2: '304',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '09:42',team1: '302',team2: '307',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '09:55',team1: '306',team2: '307',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '09:55',team1: '306',team2: '309A',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '10:08',team1: '109',team2: '107',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '10:08',team1: '105',team2: '107',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '10:21',team1: '309',team2: '303',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '10:21',team1: '102',team2: '108',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '10:34',team1: '204',team2: '205',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '10:34',team1: '201',team2: '203',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '10:47',team1: '206',team2: '203',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '10:47',team1: '102',team2: '105',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '11:00',team1: '308',team2: '301A',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '11:00',team1: '308',team2: '303',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '11:13',team1: '304',team2: '305',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '11:13',team1: '307',team2: '309B',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '11:26',team1: '108',team2: '102',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '11:26',team1: '106',team2: '103',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '11:41',team1: '101',team2: '104',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '11:41',team1: '109',team2: '105',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '11:54',team1: '209',team2: '208',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '11:54',team1: '205',team2: '202',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '12:07',team1: '205',team2: '207',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '12:07',team1: '309A',team2: '304',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '12:20',team1: '307',team2: '301B',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '12:20',team1: '203',team2: '207',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '12:33',team1: '301A',team2: '309',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '12:33',team1: '303',team2: '305',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '12:46',team1: '303',team2: '308',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '12:46',team1: '104',team2: '102',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '12:59',team1: '107',team2: '105',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '12:59',team1: '107',team2: '109',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '13:12',team1: '102',team2: '106',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '13:12',team1: '209',team2: '205',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '13:25',team1: '203',team2: '201',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '13:25',team1: '202',team2: '208',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '13:38',team1: '208',team2: '202',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '13:38',team1: '309B',team2: '302',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '13:51',team1: '305',team2: '302',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '13:51',team1: '304',team2: '306',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '14:04',team1: '301B',team2: '306',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '14:04',team1: '103',team2: '101',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '14:17',team1: '104',team2: '103',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '14:17',team1: '207',team2: '201',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '14:30',team1: '207',team2: '204',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
Springdata(time: '14:30',team1: '305',team2: '308',competition: '女子バドミントン',date: '１日目',matchplace: '体育館B',),
Springdata(time: '14:43',team1: '105',team2: '109',competition: '男子バドミントン',date: '１日目',matchplace: '体育館A',),
//体育館B空き



Springdata(time: '08:50',team1: '107',team2: '109',competition: '男子バレー',date: '１日目',matchplace: 'テニスA',),
Springdata(time: '08:50',team1: '102',team2: '103',competition: '男子バレー',date: '１日目',matchplace: 'テニスB',),
Springdata(time: '08:50',team1: '108',team2: '105',competition: '男子バレー',date: '１日目',matchplace: 'テニスC',),
Springdata(time: '08:50',team1: '308A',team2: '303',competition: '女子バレー',date: '１日目',matchplace: 'テニスD',),
Springdata(time: '08:50',team1: '304',team2: '307A',competition: '女子バレー',date: '１日目',matchplace: 'テニスE',),
Springdata(time: '09:24',team1: '207',team2: '209',competition: '男子バレー',date: '１日目',matchplace: 'テニスA',),
Springdata(time: '09:24',team1: '309',team2: '301',competition: '男子バレー',date: '１日目',matchplace: 'テニスB',),
Springdata(time: '09:24',team1: '304',team2: '305',competition: '男子バレー',date: '１日目',matchplace: 'テニスC',),
Springdata(time: '09:24',team1: '301',team2: '309',competition: '女子バレー',date: '１日目',matchplace: 'テニスD',),
Springdata(time: '09:24',team1: '104',team2: '109',competition: '女子バレー',date: '１日目',matchplace: 'テニスE',),
Springdata(time: '09:58',team1: '302',team2: '308',competition: '男子バレー',date: '１日目',matchplace: 'テニスA',),
Springdata(time: '09:58',team1: '206',team2: '201',competition: '男子バレー',date: '１日目',matchplace: 'テニスB',),
Springdata(time: '09:58',team1: '202',team2: '208',competition: '男子バレー',date: '１日目',matchplace: 'テニスC',),
Springdata(time: '09:58',team1: '101',team2: '107',competition: '女子バレー',date: '１日目',matchplace: 'テニスD',),
Springdata(time: '09:58',team1: '105',team2: '106',competition: '女子バレー',date: '１日目',matchplace: 'テニスE',),
Springdata(time: '10:32',team1: '109',team2: '101',competition: '男子バレー',date: '１日目',matchplace: 'テニスA',),
Springdata(time: '10:32',team1: '103',team2: '104',competition: '男子バレー',date: '１日目',matchplace: 'テニスB',),
Springdata(time: '10:32',team1: '105',team2: '106',competition: '男子バレー',date: '１日目',matchplace: 'テニスC',),
Springdata(time: '10:32',team1: '208',team2: '205',competition: '女子バレー',date: '１日目',matchplace: 'テニスD',),
Springdata(time: '10:32',team1: '207',team2: '209',competition: '女子バレー',date: '１日目',matchplace: 'テニスE',),
Springdata(time: '11:06',team1: '209',team2: '205',competition: '男子バレー',date: '１日目',matchplace: 'テニスA',),
Springdata(time: '11:06',team1: '201',team2: '204',competition: '男子バレー',date: '１日目',matchplace: 'テニスB',),
//ネットの高さ変更（コードの順番が崩れそうなのでこのコメントを残す）
Springdata(time: '11:06',team1: '202',team2: '206',competition: '女子バレー',date: '１日目',matchplace: 'テニスD',),
Springdata(time: '11:06',team1: '307B',team2: '308B',competition: '女子バレー',date: '１日目',matchplace: 'テニスE',),
Springdata(time: '11:40',team1: '208',team2: '203',competition: '男子バレー',date: '１日目',matchplace: 'テニスA',),
Springdata(time: '11:40',team1: '301',team2: '306',competition: '男子バレー',date: '１日目',matchplace: 'テニスB',),
Springdata(time: '11:40',team1: '303',team2: '305',competition: '女子バレー',date: '１日目',matchplace: 'テニスC',),
Springdata(time: '11:40',team1: '306',team2: '302',competition: '女子バレー',date: '１日目',matchplace: 'テニスD',),
Springdata(time: '11:40',team1: '204',team2: '203',competition: '女子バレー',date: '１日目',matchplace: 'テニスE',),
Springdata(time: '12:14',team1: '101',team2: '107',competition: '男子バレー',date: '１日目',matchplace: 'テニスA',),
Springdata(time: '12:14',team1: '104',team2: '102',competition: '男子バレー',date: '１日目',matchplace: 'テニスB',),
Springdata(time: '12:14',team1: '109',team2: '103',competition: '女子バレー',date: '１日目',matchplace: 'テニスC',),
Springdata(time: '12:14',team1: '107',team2: '108',competition: '女子バレー',date: '１日目',matchplace: 'テニスD',),
Springdata(time: '12:14',team1: '106',team2: '102',competition: '女子バレー',date: '１日目',matchplace: 'テニスE',),
Springdata(time: '12:48',team1: '205',team2: '207',competition: '男子バレー',date: '１日目',matchplace: 'テニスA',),
Springdata(time: '12:48',team1: '204',team2: '206',competition: '男子バレー',date: '１日目',matchplace: 'テニスB',),
Springdata(time: '12:48',team1: '205',team2: '202',competition: '女子バレー',date: '１日目',matchplace: 'テニスC',),
Springdata(time: '12:48',team1: '203',team2: '207',competition: '女子バレー',date: '１日目',matchplace: 'テニスD',),
Springdata(time: '12:48',team1: '305',team2: '308A',competition: '女子バレー',date: '１日目',matchplace: 'テニスE',),
Springdata(time: '13:22',team1: '308',team2: '304',competition: '男子バレー',date: '１日目',matchplace: 'テニスA',),
Springdata(time: '13:22',team1: '306',team2: '303',competition: '男子バレー',date: '１日目',matchplace: 'テニスB',),
Springdata(time: '13:22',team1: '307A',team2: '306',competition: '女子バレー',date: '１日目',matchplace: 'テニスC',),
Springdata(time: '13:22',team1: '302',team2: '304',competition: '女子バレー',date: '１日目',matchplace: 'テニスD',),
Springdata(time: '13:22',team1: '308B',team2: '301',competition: '女子バレー',date: '１日目',matchplace: 'テニスE',),
Springdata(time: '13:56',team1: '305',team2: '302',competition: '男子バレー',date: '１日目',matchplace: 'テニスA',),
Springdata(time: '13:56',team1: '106',team2: '108',competition: '男子バレー',date: '１日目',matchplace: 'テニスB',),
Springdata(time: '13:56',team1: '206',team2: '208',competition: '女子バレー',date: '１日目',matchplace: 'テニスC',),
Springdata(time: '13:56',team1: '108',team2: '101',competition: '女子バレー',date: '１日目',matchplace: 'テニスD',),
Springdata(time: '13:56',team1: '305',team2: '308A',competition: '女子バレー',date: '１日目',matchplace: 'テニスE',),
Springdata(time: '14:30',team1: '203',team2: '202',competition: '男子バレー',date: '１日目',matchplace: 'テニスA',),
Springdata(time: '14:30',team1: '303',team2: '309',competition: '男子バレー',date: '１日目',matchplace: 'テニスB',),
Springdata(time: '14:30',team1: '103',team2: '104',competition: '女子バレー',date: '１日目',matchplace: 'テニスC',),
Springdata(time: '14:30',team1: '209',team2: '204',competition: '女子バレー',date: '１日目',matchplace: 'テニスD',),
Springdata(time: '14:30',team1: '309',team2: '307B',competition: '女子バレー',date: '１日目',matchplace: 'テニスE',),


Springdata(time: '08:50',team1: '205',team2: '208',competition: 'サッカー',date: '１日目',matchplace: 'Aコート',),
Springdata(time: '08:50',team1: '202',team2: '204',competition: 'サッカー',date: '１日目',matchplace: 'Bコート',),
Springdata(time: '09:15',team1: '306',team2: '301',competition: 'サッカー',date: '１日目',matchplace: 'Aコート',),
Springdata(time: '09:15',team1: '108',team2: '105',competition: 'サッカー',date: '１日目',matchplace: 'Bコート',),
Springdata(time: '09:40',team1: '302',team2: '303',competition: 'サッカー',date: '１日目',matchplace: 'Aコート',),
Springdata(time: '09:40',team1: '106',team2: '101',competition: 'サッカー',date: '１日目',matchplace: 'Bコート',),
//Aコート空き
Springdata(time: '10:05',team1: '209',team2: '201B',competition: 'サッカー',date: '１日目',matchplace: 'Bコート',),
Springdata(time: '10:30',team1: '204',team2: '207',competition: 'サッカー',date: '１日目',matchplace: 'Aコート',),
//Bコート空き
Springdata(time: '10:55',team1: '203',team2: '206',competition: 'サッカー',date: '１日目',matchplace: 'Aコート',),
Springdata(time: '10:55',team1: '107',team2: '109',competition: 'サッカー',date: '１日目',matchplace: 'Bコート',),
Springdata(time: '11:20',team1: '208',team2: '201A',competition: 'サッカー',date: '１日目',matchplace: 'Aコート',),
Springdata(time: '11:20',team1: '105',team2: '104',competition: 'サッカー',date: '１日目',matchplace: 'Bコート',),
Springdata(time: '11:45',team1: '109',team2: '102',competition: 'サッカー',date: '１日目',matchplace: 'Aコート',),
Springdata(time: '11:45',team1: '101',team2: '103',competition: 'サッカー',date: '１日目',matchplace: 'Bコート',),
Springdata(time: '12:10',team1: '301',team2: '307',competition: 'サッカー',date: '１日目',matchplace: 'Aコート',),
Springdata(time: '12:10',team1: '304',team2: '305',competition: 'サッカー',date: '１日目',matchplace: 'Bコート',),
Springdata(time: '12:35',team1: '201A',team2: '205',competition: 'サッカー',date: '１日目',matchplace: 'Aコート',),
Springdata(time: '12:35',team1: '104',team2: '108',competition: 'サッカー',date: '１日目',matchplace: 'Bコート',),
Springdata(time: '13:25',team1: '201B',team2: '203',competition: 'サッカー',date: '１日目',matchplace: 'Aコート',),
Springdata(time: '13:25',team1: '103',team2: '106',competition: 'サッカー',date: '１日目',matchplace: 'Bコート',),
Springdata(time: '13:50',team1: '303',team2: '304',competition: 'サッカー',date: '１日目',matchplace: 'Aコート',),
Springdata(time: '13:50',team1: '102',team2: '107',competition: 'サッカー',date: '１日目',matchplace: 'Bコート',),
Springdata(time: '14:15',team1: '307',team2: '306',competition: 'サッカー',date: '１日目',matchplace: 'Aコート',),
Springdata(time: '14:15',team1: '207',team2: '202',competition: 'サッカー',date: '１日目',matchplace: 'Bコート',),
Springdata(time: '14:40',team1: '206',team2: '209',competition: 'サッカー',date: '１日目',matchplace: 'Aコート',),
Springdata(time: '14:40',team1: '305',team2: '302',competition: 'サッカー',date: '１日目',matchplace: 'Bコート',),




Springdata(time: '09:12',team1: '206',team2: '208',competition: '卓球',date: '１日目',matchplace: '格技場A',),
Springdata(time: '09:12',team1: '204',team2: '201',competition: '卓球',date: '１日目',matchplace: '格技場B',),
Springdata(time: '09:34',team1: '203',team2: '202',competition: '卓球',date: '１日目',matchplace: '格技場A',),
Springdata(time: '09:34',team1: '303',team2: '309',competition: '卓球',date: '１日目',matchplace: '格技場B',),
Springdata(time: '09:56',team1: '307',team2: '305',competition: '卓球',date: '１日目',matchplace: '格技場A',),
Springdata(time: '09:56',team1: '308',team2: '301',competition: '卓球',date: '１日目',matchplace: '格技場B',),
Springdata(time: '10:18',team1: '107',team2: '101',competition: '卓球',date: '１日目',matchplace: '格技場A',),
Springdata(time: '10:18',team1: '201',team2: '205',competition: '卓球',date: '１日目',matchplace: '格技場B',),
Springdata(time: '10:40',team1: '105',team2: '109',competition: '卓球',date: '１日目',matchplace: '格技場A',),
Springdata(time: '10:40',team1: '106',team2: '108',competition: '卓球',date: '１日目',matchplace: '格技場B',),

Springdata(time: '11:02',team1: '208',team2: '209',competition: '卓球',date: '１日目',matchplace: '格技場A',),
Springdata(time: '11:02',team1: '202',team2: '207',competition: '卓球',date: '１日目',matchplace: '格技場B',),
Springdata(time: '11:24',team1: '309',team2: '304',competition: '卓球',date: '１日目',matchplace: '格技場A',),
Springdata(time: '11:24',team1: '302',team2: '308',competition: '卓球',date: '１日目',matchplace: '格技場B',),
Springdata(time: '11:46',team1: '306',team2: '307',competition: '卓球',date: '１日目',matchplace: '格技場A',),
Springdata(time: '11:46',team1: '101',team2: '103',competition: '卓球',date: '１日目',matchplace: '格技場B',),
Springdata(time: '12:08',team1: '108',team2: '102',competition: '卓球',date: '１日目',matchplace: '格技場A',),
Springdata(time: '12:08',team1: '109',team2: '104',competition: '卓球',date: '１日目',matchplace: '格技場B',),
Springdata(time: '12:30',team1: '209',team2: '206',competition: '卓球',date: '１日目',matchplace: '格技場A',),
Springdata(time: '12:30',team1: '207',team2: '203',competition: '卓球',date: '１日目',matchplace: '格技場B',),

Springdata(time: '12:52',team1: '301',team2: '302',competition: '卓球',date: '１日目',matchplace: '格技場A',),
Springdata(time: '12:52',team1: '304',team2: '303',competition: '卓球',date: '１日目',matchplace: '格技場B',),
Springdata(time: '13:14',team1: '305',team2: '306',competition: '卓球',date: '１日目',matchplace: '格技場A',),
Springdata(time: '13:14',team1: '205',team2: '204',competition: '卓球',date: '１日目',matchplace: '格技場B',),
Springdata(time: '13:36',team1: '103',team2: '107',competition: '卓球',date: '１日目',matchplace: '格技場A',),
Springdata(time: '13:36',team1: '102',team2: '106',competition: '卓球',date: '１日目',matchplace: '格技場B',),
Springdata(time: '13:58',team1: '104',team2: '105',competition: '卓球',date: '１日目',matchplace: '格技場A',),
//コートB空き



Springdata(time: '08:50',team1: '204',team2: '209',competition: 'モルック',date: '１日目',matchplace: 'モルックA',),
Springdata(time: '08:50',team1: '203',team2: '102',competition: 'モルック',date: '１日目',matchplace: 'モルックB',),
Springdata(time: '08:50',team1: '303',team2: '107',competition: 'モルック',date: '１日目',matchplace: 'モルックC',),
Springdata(time: '08:50',team1: '308',team2: '302',competition: 'モルック',date: '１日目',matchplace: 'モルックD',),
Springdata(time: '09:15',team1: '304',team2: '206',competition: 'モルック',date: '１日目',matchplace: 'モルックA',),
Springdata(time: '09:15',team1: '305',team2: '教員1',competition: 'モルック',date: '１日目',matchplace: 'モルックB',),
Springdata(time: '09:15',team1: '207',team2: '306',competition: 'モルック',date: '１日目',matchplace: 'モルックC',),
Springdata(time: '09:15',team1: '104',team2: '105',competition: 'モルック',date: '１日目',matchplace: 'モルックD',),
Springdata(time: '09:40',team1: '205',team2: '301',competition: 'モルック',date: '１日目',matchplace: 'モルックA',),
Springdata(time: '09:40',team1: '教員2',team2: '106',competition: 'モルック',date: '１日目',matchplace: 'モルックB',),
Springdata(time: '09:40',team1: '201',team2: '101',competition: 'モルック',date: '１日目',matchplace: 'モルックC',),
Springdata(time: '09:40',team1: '107',team2: '109',competition: 'モルック',date: '１日目',matchplace: 'モルックD',),
Springdata(time: '10:05',team1: '207',team2: '108',competition: 'モルック',date: '１日目',matchplace: 'モルックA',),
Springdata(time: '10:05',team1: '203',team2: '202',competition: 'モルック',date: '１日目',matchplace: 'モルックB',),
Springdata(time: '10:05',team1: '303',team2: '208',competition: 'モルック',date: '１日目',matchplace: 'モルックC',),
Springdata(time: '10:05',team1: '308',team2: '307',competition: 'モルック',date: '１日目',matchplace: 'モルックD',),
Springdata(time: '10:30',team1: '304',team2: '教員3',competition: 'モルック',date: '１日目',matchplace: 'モルックA',),
Springdata(time: '10:30',team1: '109',team2: '309',competition: 'モルック',date: '１日目',matchplace: 'モルックB',),
Springdata(time: '10:30',team1: '306',team2: '305',competition: 'モルック',date: '１日目',matchplace: 'モルックC',),
Springdata(time: '10:30',team1: '102',team2: '104',competition: 'モルック',date: '１日目',matchplace: 'モルックD',),

Springdata(time: '10:55',team1: '103',team2: '205',competition: 'モルック',date: '１日目',matchplace: 'モルックA',),
Springdata(time: '10:55',team1: '308',team2: '教員2',competition: 'モルック',date: '１日目',matchplace: 'モルックB',),
Springdata(time: '10:55',team1: '206',team2: '204',competition: 'モルック',date: '１日目',matchplace: 'モルックC',),
Springdata(time: '10:55',team1: '208',team2: '107',competition: 'モルック',date: '１日目',matchplace: 'モルックD',),
Springdata(time: '11:20',team1: '教員1',team2: '108',competition: 'モルック',date: '１日目',matchplace: 'モルックA',),
Springdata(time: '11:20',team1: '105',team2: '202',competition: 'モルック',date: '１日目',matchplace: 'モルックB',),
Springdata(time: '11:20',team1: '301',team2: '101',competition: 'モルック',date: '１日目',matchplace: 'モルックC',),
Springdata(time: '11:20',team1: '106',team2: '307',competition: 'モルック',date: '１日目',matchplace: 'モルックD',),
Springdata(time: '11:45',team1: '209',team2: '教員3',competition: 'モルック',date: '１日目',matchplace: 'モルックA',),
Springdata(time: '11:45',team1: '302',team2: '教員2',competition: 'モルック',date: '１日目',matchplace: 'モルックB',),
Springdata(time: '11:45',team1: '207',team2: '305',competition: 'モルック',date: '１日目',matchplace: 'モルックC',),
Springdata(time: '11:45',team1: '203',team2: '104',competition: 'モルック',date: '１日目',matchplace: 'モルックD',),
Springdata(time: '12:10',team1: '201',team2: '205',competition: 'モルック',date: '１日目',matchplace: 'モルックA',),
Springdata(time: '12:10',team1: '103',team2: '301',competition: 'モルック',date: '１日目',matchplace: 'モルックB',),
Springdata(time: '12:10',team1: '304',team2: '204',competition: 'モルック',date: '１日目',matchplace: 'モルックC',),
Springdata(time: '12:10',team1: '107',team2: '309',competition: 'モルック',date: '１日目',matchplace: 'モルックD',),
Springdata(time: '12:35',team1: '306',team2: '教員1',competition: 'モルック',date: '１日目',matchplace: 'モルックA',),
Springdata(time: '12:35',team1: '102',team2: '105',competition: 'モルック',date: '１日目',matchplace: 'モルックB',),
Springdata(time: '12:35',team1: '教員2',team2: '307',competition: 'モルック',date: '１日目',matchplace: 'モルックC',),
Springdata(time: '12:35',team1: '302',team2: '106',competition: 'モルック',date: '１日目',matchplace: 'モルックD',),

Springdata(time: '13:00',team1: '201',team2: '103',competition: 'モルック',date: '１日目',matchplace: 'モルックA',),
Springdata(time: '13:00',team1: '208',team2: '109',competition: 'モルック',date: '１日目',matchplace: 'モルックB',),
Springdata(time: '13:00',team1: '305',team2: '108',competition: 'モルック',date: '１日目',matchplace: 'モルックC',),
Springdata(time: '13:00',team1: '104',team2: '202',competition: 'モルック',date: '１日目',matchplace: 'モルックD',),
Springdata(time: '13:25',team1: '205',team2: '101',competition: 'モルック',date: '１日目',matchplace: 'モルックA',),
Springdata(time: '13:25',team1: '206',team2: '209',competition: 'モルック',date: '１日目',matchplace: 'モルックB',),
Springdata(time: '13:25',team1: '204',team2: '教員3',competition: 'モルック',date: '１日目',matchplace: 'モルックC',),
Springdata(time: '13:25',team1: '303',team2: '309',competition: 'モルック',date: '１日目',matchplace: 'モルックD',),
Springdata(time: '13:50',team1: '207',team2: '教員1',competition: 'モルック',date: '１日目',matchplace: 'モルックA',),
Springdata(time: '13:50',team1: '203',team2: '105',competition: 'モルック',date: '１日目',matchplace: 'モルックB',),
Springdata(time: '13:50',team1: '201',team2: '301',competition: 'モルック',date: '１日目',matchplace: 'モルックC',),
Springdata(time: '13:50',team1: '308',team2: '106',competition: 'モルック',date: '１日目',matchplace: 'モルックD',),
Springdata(time: '14:15',team1: '304',team2: '209',competition: 'モルック',date: '１日目',matchplace: 'モルックA',),
Springdata(time: '14:15',team1: '303',team2: '109',competition: 'モルック',date: '１日目',matchplace: 'モルックB',),
Springdata(time: '14:15',team1: '306',team2: '108',competition: 'モルック',date: '１日目',matchplace: 'モルックC',),
Springdata(time: '14:15',team1: '102',team2: '202',competition: 'モルック',date: '１日目',matchplace: 'モルックD',),
Springdata(time: '14:40',team1: '103',team2: '101',competition: 'モルック',date: '１日目',matchplace: 'モルックA',),
Springdata(time: '14:40',team1: '302',team2: '307',competition: 'モルック',date: '１日目',matchplace: 'モルックB',),
Springdata(time: '14:40',team1: '206',team2: '教員3',competition: 'モルック',date: '１日目',matchplace: 'モルックC',),
Springdata(time: '14:40',team1: '208',team2: '309',competition: 'モルック',date: '１日目',matchplace: 'モルックD',),
   ];
}

  // Springdata(
  //   time: '09:00',
  //   team1: '101',
  //   team2: '102',
  //   competition: 'サッカー',
  //   date: '１日目',
  //   matchplace: '体育館A',
  //   result: '',
  //   notificationTimes: DateTime(2025, 1, 6, 21, 25),
  // ),


Future<void> clearCollection(String collectionPath) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // コレクション内のすべてのドキュメントを取得
  QuerySnapshot snapshot = await firestore.collection(collectionPath).get();

  // ドキュメントを削除
  for (var doc in snapshot.docs) {
    await doc.reference.delete();
  }

}

class Springdatafire {
  final String time;
  final String team1;
  final String team2;
  final String competition;
  final String date;
  final String matchplace;
  DateTime? notificationTimes;

  Springdatafire({
    required this.time,
    required this.team1,
    required this.team2,
    required this.competition,
    required this.date,
    required this.matchplace,
    this.notificationTimes,
  });
  

  // Firestoreに保存するメソッド
  Future<void> saveToFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // 連番ID用の変数
    int newMatchId = 0;

    try {
      // トランザクションを開始
      await firestore.runTransaction((transaction) async {
        // カウンター用のドキュメントを参照
        DocumentReference counterRef = firestore.collection('counters').doc('matchCounter');
        
        // 現在のカウンターの値を取得
        DocumentSnapshot counterSnapshot = await transaction.get(counterRef);
        
        if (counterSnapshot.exists) {
          // 既存のカウンターがあれば、その値を使ってインクリメント
          newMatchId = counterSnapshot['matchId'] + 1;
        } else {
          // `matchCounter` ドキュメントが存在しない場合は初期値を設定
          newMatchId = 1;
          transaction.set(counterRef, {'matchId': newMatchId});  // 初期カウンター値をセット
        }

        // 新しい試合のIDを決定
        String matchId = newMatchId.toString().padLeft(3, '0');  // 例: 001, 002, 003

        // 試合データをFirestoreに保存
        Map<String, dynamic> matchData = {
          'time': time,
          'team1': team1,
          'team2': team2,
          'competition': competition,
          'date': date,
          'matchplace': matchplace,
        };

        // 新しいドキュメントを追加（IDをmatchIdに設定）
        transaction.set(firestore.collection('springdata').doc(matchId), matchData);

        // カウンターを更新
        transaction.update(counterRef, {'matchId': newMatchId});
      });

      // Firestoreに保存した後に新しいmatchIdを出力
    // ignore: empty_catches
    } catch (e) {
    }
  }
}
class Springdatafiredata {
  List<Springdata> springdatafiredata = [
Springdata(time: '09:00',team1: '300',team2: '300',competition: '男子バドミントン',date: '２日目',matchplace: '体育館A'), 
Springdata(time: '09:00',team1: '300',team2: '300',competition: '女子バドミントン',date: '２日目',matchplace: '体育館B'),
Springdata(time: '09:30',team1: '300',team2: '300',competition: '男子バドミントン',date: '２日目',matchplace: '体育館A'),
Springdata(time: '09:30',team1: '300',team2: '300',competition: '女子バドミントン',date: '２日目',matchplace: '体育館B'),
Springdata(time: '10:00',team1: '200',team2: '200',competition: '男子バドミントン',date: '２日目',matchplace: '体育館A'),
Springdata(time: '10:00',team1: '200',team2: '200',competition: '女子バドミントン',date: '２日目',matchplace: '体育館B'),
Springdata(time: '10:30',team1: '200',team2: '200',competition: '男子バドミントン',date: '２日目',matchplace: '体育館A'),
Springdata(time: '10:30',team1: '200',team2: '200',competition: '女子バドミントン',date: '２日目',matchplace: '体育館B'),
Springdata(time: '11:00',team1: '100',team2: '100',competition: '男子バドミントン',date: '２日目',matchplace: '体育館A'),
Springdata(time: '11:00',team1: '100',team2: '100',competition: '女子バドミントン',date: '２日目',matchplace: '体育館B'),
Springdata(time: '11:30',team1: '100',team2: '100',competition: '男子バドミントン',date: '２日目',matchplace: '体育館A'),
Springdata(time: '11:30',team1: '100',team2: '100',competition: '女子バドミントン',date: '２日目',matchplace: '体育館B'),
Springdata(time: '12:00',team1: '300',team2: '300',competition: '男子バドミントン',date: '２日目',matchplace: '体育館A'),
Springdata(time: '12:00',team1: '300',team2: '300',competition: '女子バドミントン',date: '２日目',matchplace: '体育館B'),
Springdata(time: '12:30',team1: '200',team2: '200',competition: '男子バドミントン',date: '２日目',matchplace: '体育館A'),
Springdata(time: '12:30',team1: '200',team2: '200',competition: '女子バドミントン',date: '２日目',matchplace: '体育館B'),
Springdata(time: '13:10',team1: '100',team2: '100',competition: '男子バドミントン',date: '２日目',matchplace: '体育館A'),
Springdata(time: '13:10',team1: '100',team2: '100',competition: '女子バドミントン',date: '２日目',matchplace: '体育館B'),

Springdata(time: '09:30',team1: '200',team2: '200',competition: '男子バレーボール',date: '２日目',matchplace: 'テニスA'),
Springdata(time: '09:30',team1: '200',team2: '200',competition: '男子バレーボール',date: '２日目',matchplace: 'テニスB'),
Springdata(time: '09:30',team1: '200',team2: '200',competition: '女子バレーボール',date: '２日目',matchplace: 'テニスC'),
Springdata(time: '09:30',team1: '200',team2: '200',competition: '女子バレーボール',date: '２日目',matchplace: 'テニスD'),
Springdata(time: '10:15',team1: '100',team2: '100',competition: '男子バレーボール',date: '２日目',matchplace: 'テニスA'),
Springdata(time: '10:15',team1: '100',team2: '100',competition: '男子バレーボール',date: '２日目',matchplace: 'テニスB'),
Springdata(time: '10:15',team1: '100',team2: '100',competition: '女子バレーボール',date: '２日目',matchplace: 'テニスC'),
Springdata(time: '10:15',team1: '100',team2: '100',competition: '女子バレーボール',date: '２日目',matchplace: 'テニスD'),
Springdata(time: '11:00',team1: '300',team2: '300',competition: '男子バレーボール',date: '２日目',matchplace: 'テニスA'),
Springdata(time: '11:00',team1: '300',team2: '300',competition: '男子バレーボール',date: '２日目',matchplace: 'テニスB'),
Springdata(time: '11:00',team1: '300',team2: '300',competition: '女子バレーボール',date: '２日目',matchplace: 'テニスC'),
Springdata(time: '11:00',team1: '300',team2: '300',competition: '女子バレーボール',date: '２日目',matchplace: 'テニスD'),
Springdata(time: '11:45',team1: '200',team2: '200',competition: '男子バレーボール',date: '２日目',matchplace: 'テニスB'),
Springdata(time: '11:45',team1: '200',team2: '200',competition: '女子バレーボール',date: '２日目',matchplace: 'テニスC'),
Springdata(time: '12:30',team1: '100',team2: '100',competition: '男子バレーボール',date: '２日目',matchplace: 'テニスB'),
Springdata(time: '12:30',team1: '100',team2: '100',competition: '女子バレーボール',date: '２日目',matchplace: 'テニスC'),
Springdata(time: '13:15',team1: '300',team2: '300',competition: '男子バレーボール',date: '２日目',matchplace: 'テニスB'),
Springdata(time: '13:15',team1: '300',team2: '300',competition: '女子バレーボール',date: '２日目',matchplace: 'テニスC'),

Springdata(time: '09:30',team1: '100',team2: '100',competition: 'サッカー',date: '２日目',matchplace: 'グラウンドA'),
Springdata(time: '09:30',team1: '100',team2: '100',competition: 'サッカー',date: '２日目',matchplace: 'グラウンドB'),
Springdata(time: '10:15',team1: '300',team2: '300',competition: 'サッカー',date: '２日目',matchplace: 'グラウンドA'),
Springdata(time: '10:15',team1: '300',team2: '300',competition: 'サッカー',date: '２日目',matchplace: 'グラウンドB'),
Springdata(time: '11:00',team1: '200',team2: '200',competition: 'サッカー',date: '２日目',matchplace: 'グラウンドA'),
Springdata(time: '11:00',team1: '200',team2: '200',competition: 'サッカー',date: '２日目',matchplace: 'グラウンドB'),
Springdata(time: '11:45',team1: '100',team2: '100',competition: 'サッカー',date: '２日目',matchplace: 'グラウンドB'),
Springdata(time: '12:30',team1: '300',team2: '300',competition: 'サッカー',date: '２日目',matchplace: 'グラウンドB'),
Springdata(time: '13:15',team1: '200',team2: '200',competition: 'サッカー',date: '２日目',matchplace: 'グラウンドB'),

Springdata(time: '09:15',team1: '100',team2: '100',competition: '卓球',date: '２日目',matchplace: '格技場A'),
Springdata(time: '09:15',team1: '100',team2: '100',competition: '卓球',date: '２日目',matchplace: '格技場B'),
Springdata(time: '10:00',team1: '200',team2: '200',competition: '卓球',date: '２日目',matchplace: '格技場A'),
Springdata(time: '10:00',team1: '200',team2: '200',competition: '卓球',date: '２日目',matchplace: '格技場B'),
Springdata(time: '10:45',team1: '300',team2: '300',competition: '卓球',date: '２日目',matchplace: '格技場A'),
Springdata(time: '10:45',team1: '300',team2: '300',competition: '卓球',date: '２日目',matchplace: '格技場B'),
Springdata(time: '11:30',team1: '100',team2: '100',competition: '卓球',date: '２日目',matchplace: '格技場A'),
Springdata(time: '12:15',team1: '200',team2: '200',competition: '卓球',date: '２日目',matchplace: '格技場A'),
Springdata(time: '13:00',team1: '300',team2: '300',competition: '卓球',date: '２日目',matchplace: '格技場A'),



Springdata(time: '09:30',team1: '000',team2: '000',competition: 'モルック',date: '２日目',matchplace: 'モルックA'),
Springdata(time: '09:30',team1: '000',team2: '000',competition: 'モルック',date: '２日目',matchplace: 'モルックC'),
Springdata(time: '10:15',team1: '000',team2: '000',competition: 'モルック',date: '２日目',matchplace: 'モルックA'),
Springdata(time: '10:15',team1: '000',team2: '000',competition: 'モルック',date: '２日目',matchplace: 'モルックC'),
Springdata(time: '11:00',team1: '000',team2: '000',competition: 'モルック',date: '２日目',matchplace: 'モルックA'),
Springdata(time: '11:00',team1: '000',team2: '000',competition: 'モルック',date: '２日目',matchplace: 'モルックC'),
Springdata(time: '12:30',team1: '000',team2: '000',competition: 'モルック',date: '２日目',matchplace: 'モルックB'),

  ];
  Future<void> updatedata() async {
    // springdatafiredataがList<Springdata>型なので、forループで回せる
    for (var springdata in springdatafiredata) {
      // Springdatafire インスタンスを作成
      Springdatafire springdatafire = Springdatafire(
        time: springdata.time,
        team1: springdata.team1,
        team2: springdata.team2,
        competition: springdata.competition,
        date: springdata.date,
        matchplace: springdata.matchplace,
        // notificationTimes: springdata.notificationTimes,
      );

      // saveToFirestore メソッドを呼び出す
      await springdatafire.saveToFirestore();
    }
  }
}