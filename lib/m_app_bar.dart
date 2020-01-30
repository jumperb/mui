import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mui/m_const.dart';

class MAppBar extends StatefulWidget implements PreferredSizeWidget {
  double height;
  Brightness brightness;
  MAppBar({this.height = 56, this.brightness = Brightness.light});
  @override
  State<StatefulWidget> createState() => _MAppBarState(brightness, height);

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _MAppBarState extends State {
  final Brightness brightness;
  double height;
  _MAppBarState(this.brightness, this.height);
  @override
  Widget build(BuildContext c) {
    final SystemUiOverlayStyle overlayStyle =
        (this.brightness == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Material(
            child: Material(
                type: MaterialType.transparency,
                child: Container(
                  color: Colors.white,
                  child: SafeArea(
                      top: true,
                      child: SizedBox(
                        width: double.infinity,
                        height: this.height,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  MaterialButton(
                                    minWidth: 0,
                                    height: 48,
                                    elevation: 0,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    padding: EdgeInsets.fromLTRB(
                                        m_padding_x, 0, m_padding_x, 0),
                                    child: Icon(Icons.arrow_back_ios),
                                    onPressed: () {
                                      Navigator.of(c).pop();
                                    },
                                  ),
                                  Text("标题", style: TextStyle(fontSize: 16))
                                ],
                              ),
                            ),
                            Divider(
                                height: 1 / MediaQuery.of(c).devicePixelRatio,
                                color: Color(0xff000000)),
                          ],
                        ),
                      )),
                ))));
  }
}
