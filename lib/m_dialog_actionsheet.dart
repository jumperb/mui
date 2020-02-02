import 'package:flutter/material.dart';
import 'package:mui/m_dialog_box_bottom_fixed.dart';
import 'm_button_data.dart';

class MDialogActionSheet extends MDialogBoxBottomFix {
  final String title;
  final Color lineColor;
  final List<MButtonData> buttonsData = List();
  final buttonHeight = 50.0;
  MDialogActionSheet({this.title, this.lineColor = Colors.grey}) : super(null);
  MDialogActionSheet addButton(
      {String text, Color color = Colors.black, Widget child, Function() callback}) {
    buttonsData.add(MButtonData(text:text, color:color, child:child, callback:callback));
    return this;
  }
  @override
  Widget buildTop(BuildContext c) {
    if (title != null) {
      return Center(
        child: Text(title,
            style: TextStyle(
              fontSize: 14,
            )),
      );
    } else
      return null;
  }
  @override
  Widget buildCenter(BuildContext c) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: buildButtonList(c),
    );
  }
  @override
  Widget buildBottom(BuildContext c) {
    return FlatButton(
        child: Text("取消", style: TextStyle(fontSize: 16)),
        color: Colors.white,
        onPressed: () {
          Navigator.of(c).pop();
        });
  }
  List<Widget> buildButtonList(BuildContext c) {
    final list = List<Widget>();
    if (buttonsData != null) {
      var index = 0;
      for (final b in buttonsData) {
        //分割线
        if (index != 0) {
          list.add(Divider(
                height: 1 / MediaQuery.of(c).devicePixelRatio,
                color: this.lineColor));          
        }
        
        list.add(SizedBox(
          width: double.infinity,
          height: buttonHeight,
          child: buildButton(c, b),
        ));
        
        index += 1;
      }
    }
    return list;
  }
  Widget buildButton(BuildContext c, MButtonData b) {
    Widget bChild = b.child;
    if (bChild == null) {
      bChild = Text(b.text, style: TextStyle(fontSize: 16, color: b.color??Colors.black));
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
