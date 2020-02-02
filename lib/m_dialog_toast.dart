import 'package:flutter/material.dart';
import 'package:mui/m_dialog_base_window.dart';

class MDialogToast extends MDialogBaseWindow {
  final String title;
  final int maxlines;
  final Widget icon;
  final bool verticalLayout;
  MDialogToast(this.title,
      {this.maxlines = 1,
      this.icon,
      Alignment align,
      this.verticalLayout = false,
      double minWidth,
      double maxWidth})
      : super(align: align, minWidth: minWidth, maxWidth: maxWidth);

  @override
  Widget buildContent(BuildContext c) {
    final items = List<Widget>();
    if (icon != null) {
      items.add(icon);
      items.add(SizedBox(width: interval, height: interval));
    }
    final text = Text(title,
        maxLines: maxlines,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16));
    items.add(Flexible(child: text));
    if (verticalLayout) {
      return Column(
          children: items,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center);
    } else {
      return Row(
          children: items,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center);
    }
  }
}
