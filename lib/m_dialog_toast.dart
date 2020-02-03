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
      Alignment align = Alignment.center,
      this.verticalLayout = false,
      double minWidth = 120,
      double maxWidth = 300})
      : super(align: align, backgroundColor: const Color.fromARGB(204, 0, 0, 0), minWidth: minWidth, maxWidth: maxWidth);

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
        style: TextStyle(fontSize: 16, color: Colors.white));
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
