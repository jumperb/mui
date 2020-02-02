import 'package:flutter/material.dart';
import 'package:mui/m_const.dart';
import 'package:vrender/vrender.dart';
import 'mui.dart';

class MDialogBoxBottomFix extends StatelessWidget {
  final Widget child;
  final Color lineColor;
  final VO<BuildContext> c = VO(null);
  MDialogBoxBottomFix(this.child, {this.lineColor = Colors.grey});

  MDialogBoxBottomFix show(BuildContext c) {
    this.c.set(c);
    MUI.showDialog(c, this, trans: RouteTransition.rais);
    return this;
  }
  void dismiss() {
    Navigator.of(this.c.v).pop();
  }


  @override
  Widget build(BuildContext c) {
    var items = List<Widget>();
    final head = buildTop(c);

    if (head != null) {
      items.add(SizedBox(height: 44, width: double.infinity, child: head));
    }
    
    items.add(buildCenter(c));
    
    final tail = buildBottom(c);
    if (tail != null) {
      items.add(Divider(
                height: 1 / MediaQuery.of(c).devicePixelRatio,
                color: this.lineColor));
      items.add(SizedBox(height: 44, width: double.infinity, child: tail));
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        constraints: BoxConstraints(minWidth: double.infinity),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(m_radius),
                topRight: Radius.circular(m_radius))),
        child: SafeArea(
            top: false,
            child: Column(children: items, mainAxisSize: MainAxisSize.min)),
      ),
    );
  }

  Widget buildTop(BuildContext c) {
    return null;
  }
  Widget buildCenter(BuildContext c) {
    return this.child;
  }
  Widget buildBottom(BuildContext c) {
    return null;
  }
}

class MDialogBoxBottomFix1 extends MDialogBoxBottomFix {
  MDialogBoxBottomFix1(Widget child) : super(child);
  @override
  Widget buildTop(BuildContext c) {
    return Center(
      child: Text("标题",
          style: TextStyle(
            fontSize: 16,
          )),
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
}

class MDialogBoxBottomFix2 extends MDialogBoxBottomFix {
  MDialogBoxBottomFix2(Widget child) : super(child);
  @override
  Widget buildTop(BuildContext c) {
    return Padding(
      padding: EdgeInsets.fromLTRB(m_padding, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("标题",
              style: TextStyle(
                fontSize: 16,
              )),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(c).pop();
            },
          )
        ],
      ),
    );
  }
}

class MDialogBoxBottomFix3 extends MDialogBoxBottomFix {
  MDialogBoxBottomFix3(Widget child) : super(child);
  @override
  Widget buildTop(BuildContext c) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          MaterialButton(
            minWidth: 0,
            elevation: 0,
            padding: EdgeInsets.fromLTRB(m_padding, 0, m_padding, 0),
            child: Text("取消", style: TextStyle(fontSize: 16)),
            onPressed: () {
              Navigator.of(c).pop();
            },
          ),
          Text("标题",
              style: TextStyle(
                fontSize: 16,
              )),
          MaterialButton(
            minWidth: 0,
            elevation: 0,
            padding: EdgeInsets.fromLTRB(m_padding, 0, m_padding, 0),
            child: Text("确定", style: TextStyle(fontSize: 16)),
            onPressed: () {
              Navigator.of(c).pop();
            },
          )
        ],
      ),
    );
  }
}
