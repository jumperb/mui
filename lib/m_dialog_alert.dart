import 'package:flutter/material.dart';
import 'package:mui/m_dialog_base_window.dart';
import 'm_button_data.dart';

class MDialogAlert extends MDialogBaseWindow {
  final String title;
  final String subTitle;
  final Color lineColor;
  final Widget topWidget;
  final List<MButtonData> buttonsData = List();
  final buttonHeight = 50.0;
  MDialogAlert(
      {this.title,
      this.subTitle,
      this.lineColor = Colors.grey,
      this.topWidget,
      double minWidth,
      double maxWidth})
      : super(minWidth: 260.0, maxWidth: 260.0, padding: EdgeInsets.zero);

  MDialogAlert addCancelButton({String text = "取消"}) {
    buttonsData.add(MButtonData(text:text));
    return this;
  }

  MDialogAlert addButton(
      {String text, Color color = Colors.black, Widget child, Function() callback}) {
    buttonsData.add(MButtonData(text:text, color:color, child:child, callback:callback));
    return this;
  }

  @override
  Widget buildContent(BuildContext c) {
    final list = List<Widget>();
    list.add(buildTop(c));
    list.add(Divider(
        height: 1 / MediaQuery.of(c).devicePixelRatio, color: this.lineColor));
    list.addAll(buildBottom(c));
    return Column(
        children: list,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center);
  }

  Widget buildTop(BuildContext c) {
    if (topWidget != null) return topWidget;
    final list = List<Widget>();
    if (title != null) {
      list.add(Text(title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)));
    }
    if (subTitle != null) {
      if (list.length > 0) {
        list.add(SizedBox(height: 16, width: double.infinity));
      }
      list.add(Text(subTitle, style: TextStyle(fontSize: 14)));
    }

    return Padding(
        padding: EdgeInsets.fromLTRB(18, 28, 18, 28),
        child: Column(children: list));
  }

  List<Widget> buildBottom(BuildContext c) {
    if (buttonsData.length > 2) {
      return buildButtonList(c, true);
    } else {
      return [
        SizedBox(
            width: double.infinity,
            height: buttonHeight,
            child: Row(
              children: buildButtonList(c, false),
            ))
      ];
    }
  }

  List<Widget> buildButtonList(BuildContext c, bool vertical) {
    final list = List<Widget>();
    if (buttonsData != null) {
      var index = 0;
      for (final b in buttonsData) {
        //分割线
        if (index != 0) {
          if (vertical) {
            list.add(Divider(
                height: 1 / MediaQuery.of(c).devicePixelRatio,
                color: this.lineColor));
          } else {
            list.add(VerticalDivider(
                width: 1 / MediaQuery.of(c).devicePixelRatio,
                color: this.lineColor));
          }
        }
        //横竖排包裹方式不同
        if (vertical) {
          list.add(SizedBox(
            width: double.infinity,
            height: buttonHeight,
            child: buildButton(c, b),
          ));
        } else {
          list.add(Expanded(child: buildButton(c, b)));
        }
        index += 1;
      }
    }
    return list;
  }

  Widget buildButton(BuildContext c, MButtonData b) {
    Widget bChild = b.child;
    if (bChild == null) {
      bChild = Text(b.text, style: TextStyle(fontSize: 14, color: b.color??Colors.black));
    }
    return MaterialButton(
        elevation: 0,
        height: buttonHeight,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: bChild,
        onPressed: () {
          this.dismiss();
          if (b.callback != null) b.callback();
        });
  }
}
