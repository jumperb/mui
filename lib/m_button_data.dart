import 'package:flutter/material.dart';

class MButtonData {
  final String text;
  final Color color;
  final Widget child;
  final Function() callback;
  MButtonData({this.text = "按钮", this.color = Colors.black, this.child, this.callback});
}