import 'package:flutter/material.dart';
import 'package:mui/m_dialog_base_window.dart';
import 'm_circular_progressor.dart';
import 'package:vrender/vrender.dart';

class MDialogProgressor extends MDialogBaseWindow {
  final VO<double> value = VO(null);
  final VO<String> text = VO(null);
  final Color progressorColor;
  final double progressorSize;
  final Color progressorBgColor;
  final double strokeWidth;
  final bool verticalLayout;

  MDialogProgressor(
      {double value,
      String text,
      this.progressorColor = Colors.red,
      this.progressorSize = 40.0,
      this.progressorBgColor,
      Color backgroundColor = const Color.fromARGB(204, 0, 0, 0),
      this.strokeWidth = 8,
      this.verticalLayout = false,
      double minWidth = 40,
      double maxWidth = 300})
      : super(
            align: Alignment.center,
            backgroundColor: backgroundColor,
            minWidth: minWidth,
            maxWidth: maxWidth) {
    this.value.set(value);
    this.text.set(text);
  }

  Widget buildProgressor(BuildContext c) {
    return VBind(() => MCircularProgressor(
        value: value.v,
        backgroundColor: progressorBgColor,
        color: progressorColor,
        strokeWidth: strokeWidth));
  }

  @override
  Widget buildContent(BuildContext c) {
    final items = List<Widget>();

    items.add(SizedBox(
        width: progressorSize,
        height: progressorSize,
        child: buildProgressor(c)));
    if (text.v != null) {
      items.add(SizedBox(width: interval, height: interval));

      final textV = VBind(() => Text(text.v,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16, color: Colors.white)));
      items.add(Flexible(child: textV));
    }

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
