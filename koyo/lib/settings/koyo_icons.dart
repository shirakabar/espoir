import 'package:flutter/widgets.dart';
//インポートしたアイコン
class Koyo {
  Koyo._();

  static const _kFontFam = 'Koyo';
  static const String? _kFontPkg = null;

  static const IconData ticketicon = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData kouyasaiicon = IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData hakurankaiicon = IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

class Live {
  Live._();

  static const _kFontFam = 'Live';
  static const String? _kFontPkg = null;

  static const IconData penlight = IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}