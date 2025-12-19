import 'package:flutter/material.dart';

extension Buiddd on BuildContext {
  Size get size => MediaQuery.sizeOf(this);
  double get screeHeight => size.height;
  double get screenWidth => size.width;
}
