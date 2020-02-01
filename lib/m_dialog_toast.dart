import 'package:flutter/material.dart';
import 'package:mui/m_const.dart';

class MDialogToast extends StatelessWidget {
  final String title;
  final int maxlines;
  final Alignment align;
  final Widget icon;
  final bool verticalLayout;
  final padding = EdgeInsets.fromLTRB(20, 20, 20, 20);
  final interval = 10.0;
  final double minWidth;
  final double maxWidth;
  MDialogToast(this.title,
      {this.align = Alignment.center,
      this.maxlines = 1,
      this.icon,      
      this.verticalLayout = false,
      this.minWidth = 120.0,
      this.maxWidth = 300.0});

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
      padding: EdgeInsets.all(isCenter?m_padding:0),
      child: Align(
        alignment: align,
        child: Container(
          constraints: BoxConstraints(minWidth: _minWidth, maxWidth: _maxWidth),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: isCenter?BorderRadius.all(Radius.circular(m_radius)):null),
          child: Padding(
            padding: padding,
            child: buildContent(c),
          ),
        ),
      ),
    );
  }
  Widget buildContent(BuildContext c) {
    bool isCenter = (align == Alignment.center);
    bool isTop = (align == Alignment.topLeft || align == Alignment.topCenter || align == Alignment.topRight);
    bool isBottom = (align == Alignment.bottomLeft || align == Alignment.bottomCenter || align == Alignment.bottomRight);
    if (isCenter) return buildContent2(c);
    else return SafeArea(
      top: isTop,
      bottom: isBottom,
      child: buildContent2(c),
    );
  }
  Widget buildContent2(BuildContext c) {
    final items = List<Widget>();
    if (icon != null) {
      items.add(icon);
      items.add(SizedBox(width: interval, height: interval));
    }
    final text = Text(title, maxLines: maxlines, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16));
    items.add(Flexible(child: text));
    if (verticalLayout) {
      return Column(children: items, mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center);
    } else {
      return Row(children: items, mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center);
    }
  }
}
