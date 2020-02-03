import 'package:flutter/material.dart';
import 'package:mui/m_const.dart';
import 'package:mui/mui.dart';
import 'package:vrender/vrender.dart';


class MDialogBaseWindow extends StatelessWidget {
  final Alignment align;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double interval = 12.0;
  final double minWidth;
  final double maxWidth;
  
  final VO<BuildContext> c = VO(null);
  MDialogBaseWindow(
      {this.align = Alignment.center,
      this.backgroundColor = Colors.white,
      this.padding = const EdgeInsets.fromLTRB(20, 20, 20, 20),
      this.minWidth = 120.0,
      this.maxWidth = 300.0,});
  MDialogBaseWindow show(BuildContext c) {
    this.c.set(c);
    MUI.showDialog(c, this);
    return this;
  }
  void dismiss() {
    Navigator.of(this.c.v).pop();
  }
  @override
  Widget build(BuildContext c) {
    var _minWidth = minWidth;
    var _maxWidth = maxWidth;
    bool isCenter = (align == Alignment.center);
    if (!isCenter) {
      _minWidth = double.infinity;
      _maxWidth = double.infinity;
    }

    return Padding(
      padding: EdgeInsets.all(isCenter ? m_padding : 0),
      child: Align(
        alignment: align,
        child: Container(
          constraints: BoxConstraints(minWidth: _minWidth, maxWidth: _maxWidth),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: isCenter
                  ? BorderRadius.all(Radius.circular(m_radius))
                  : null),
          child: Padding(
            padding: padding,
            child: buildSafeArea(c),
          ),
        ),
      ),
    );
  }

  Widget buildSafeArea(BuildContext c) {
    bool isCenter = (align == Alignment.center);
    bool isTop = (align == Alignment.topLeft ||
        align == Alignment.topCenter ||
        align == Alignment.topRight);
    bool isBottom = (align == Alignment.bottomLeft ||
        align == Alignment.bottomCenter ||
        align == Alignment.bottomRight);
    if (isCenter)
      return buildContent(c);
    else
      return SafeArea(
        top: isTop,
        bottom: isBottom,
        child: buildContent(c),
      );
  }

  Widget buildContent(BuildContext c) {
    return SizedBox(width: 100, height: 100);
  }
}
