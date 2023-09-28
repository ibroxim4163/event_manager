import 'package:flutter/material.dart';

abstract class AppUtils {
  ///padding only
  static const pTop12Left10 = EdgeInsets.only(left: 10, top: 12);
  static const pLeft8 = EdgeInsets.only(left: 8);
  static const pTop12 = EdgeInsets.only(top: 12);
  static const pTop8Sym8 = EdgeInsets.only(top: 8, left: 8, right: 8);
  static const pSym15 = EdgeInsets.symmetric(horizontal: 15);

  // padding all
  static const pAll8 = EdgeInsets.all(8);
  static const pAll15 = EdgeInsets.all(15);

  //border radius
  static const bAll8 = BorderRadius.all(Radius.circular(8));
  static const bBottom8 = BorderRadius.only(
    bottomLeft: Radius.circular(8),
    bottomRight: Radius.circular(8),
  );

  static const bBottom20 = BorderRadius.only(
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(20),
  );
}
