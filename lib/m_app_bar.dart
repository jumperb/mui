import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mui/m_const.dart';
import 'package:vrender/vrender.dart';

class MAppBar extends StatelessWidget implements PreferredSizeWidget {
  //快捷属性
  //标题
  final VO<String> title = VO("标题");
  //标题字号
  final VO<double> titleFontSize = VO(16);
  //左按钮包含对象，一般icon或者Text，前提是使用默认左按钮
  final VO<Widget> leftButtonChild = VO(null);
  //右按钮包含对象，一般icon或者Text，前提是使用默认右按钮
  final VO<Widget> rightButtonChild = VO(null);
  //前景颜色
  final VO<Color> frontColor = VO(Colors.black);
  //顶部栏高度
  final VO<double> height = VO(56);
  //顶部栏背景颜色
  final VO<Color> color = VO(Colors.white);
  //隐藏顶部栏
  final VO<bool> hideTopbar = VO(false);
  //状态栏控制-深浅色
  final VO<Brightness> statusBarBrightness = VO(Brightness.light);
  //隐藏状态栏
  final VO<bool> hideStatusBar = VO(false);

  //左边视图
  final VO<bool> hideLeft = VO(false);
  final VO<Widget> outerLeftItem = VO(null);

  //中间视图
  final VO<bool> hideCenter = VO(false);
  //中间paddingX
  final VO<double> centerPadding = VO(0);
  //中间对齐
  final VO<Alignment> centerAlign = VO(Alignment.center);
  final VO<Widget> outerCenterItem = VO(null);
  //右边视图
  final VO<bool> hideRight = VO(false);
  final VO<Widget> outerRightItem = VO(null);

  //底部边线
  final VO<Color> lineColor = VO(Colors.grey);
  //
  MAppBar(
      {String title,
      double titleFontSize,
      Widget leftButtonChild,
      Widget rightButtonChild,
      Color frontColor,
      double height,
      Color color,
      bool hideTopbar,
      Brightness statusBarBrightness,
      bool hideStatusBar,
      bool hideLeft,
      Widget outerLeftItem,
      bool hideCenter,
      double centerPadding,
      Alignment centerAlign,
      Widget outerCenterItem,
      bool hideRight,
      Widget outerRightItem,
      Color lineColor}) {
    if (title != null) this.title.set(title);
    if (titleFontSize != null) this.titleFontSize.set(titleFontSize);
    if (leftButtonChild != null) this.leftButtonChild.set(leftButtonChild);
    if (rightButtonChild != null) this.rightButtonChild.set(rightButtonChild);
    if (frontColor != null) this.frontColor.set(frontColor);
    if (height != null) this.height.set(height);
    if (color != null) this.color.set(color);
    if (hideTopbar != null) this.hideTopbar.set(hideTopbar);
    if (statusBarBrightness != null)
      this.statusBarBrightness.set(statusBarBrightness);
    if (hideStatusBar != null) this.hideStatusBar.set(hideStatusBar);
    if (hideLeft != null) this.hideLeft.set(hideLeft);
    if (outerLeftItem != null) this.outerLeftItem.set(outerLeftItem);
    if (hideCenter != null) this.hideCenter.set(hideCenter);
    if (centerPadding != null) this.centerPadding.set(centerPadding);
    if (centerAlign != null) this.centerAlign.set(centerAlign);
    if (outerCenterItem != null) this.outerCenterItem.set(outerCenterItem);
    if (hideRight != null) this.hideRight.set(hideRight);
    if (outerRightItem != null) this.outerRightItem.set(outerRightItem);
    if (lineColor != null) this.lineColor.set(lineColor);

    //状态栏深浅
    this.statusBarBrightness.then((dynamic brightness) {
      final SystemUiOverlayStyle overlayStyle =
          (this.statusBarBrightness.v == Brightness.dark
              ? SystemUiOverlayStyle.light
              : SystemUiOverlayStyle.dark);
      SystemChrome.setSystemUIOverlayStyle(overlayStyle);
    });
    //状态栏隐藏
    this.hideStatusBar.then((dynamic hide) {
      if (hide) {
        SystemChrome.setEnabledSystemUIOverlays([]);
      } else {
        SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
      }
    });
  }
  Widget buildLeft(BuildContext c) {
    return Visibility(
        visible: !this.hideLeft.v,
        child: VBind(() {
          if (this.outerLeftItem.v != null) {
            return this.outerLeftItem.v; //外部左部件
          } else {
            return MaterialButton(
              minWidth: 0,
              height: 48,
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.fromLTRB(m_padding_x, 0, m_padding_x, 0),
              child: VBind(() {
                if (this.leftButtonChild.v != null)
                  return leftButtonChild.v; //快捷左按钮内部件
                else
                  return Icon(Icons.arrow_back_ios,
                      color: this.frontColor.v); //默认部件，返回图片
              }),
              onPressed: () {
                Navigator.of(c).pop();
              },
            );
          }
        }));
  }

  Widget buildCenter(BuildContext c) {
    return Visibility(
        visible: !this.hideCenter.v,
        child: Padding(
            padding: EdgeInsets.fromLTRB(
                this.centerPadding.v, 0, this.centerPadding.v, 0),
            child: Align(
                alignment: this.centerAlign.v,
                child: VBind(() {
                  if (outerCenterItem.v != null)
                    return outerCenterItem.v; //外部中间部件
                  else
                    return Text(this.title.v,
                        style: TextStyle(
                            fontSize: this.titleFontSize.v,
                            color: this.frontColor.v));
                }))));
  }

  Widget buildRight(BuildContext c) {
    return Visibility(
        visible: !this.hideRight.v,
        child: VBind(() {
          if (outerRightItem.v != null)
            return outerRightItem.v;
          else if (rightButtonChild.v != null)
            return MaterialButton(
              minWidth: 0,
              height: 48,
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.fromLTRB(m_padding_x, 0, m_padding_x, 0),
              child: rightButtonChild.v,
              onPressed: () {
                Navigator.of(c).pop();
              },
            );
          else
            return SizedBox(width: 20, height: 20);
        }));
  }

  @override
  Size get preferredSize => Size.fromHeight(height.v);

  @override
  Widget build(BuildContext c) {
    return Material(
            type: MaterialType.transparency,
            child: VBind(() => Visibility(
                visible: !this.hideTopbar.v,
                child: Container(
                  color: this.color.v,
                  child: SafeArea(
                      top: true,
                      bottom: false,
                      child: SizedBox(
                        width: double.infinity,
                        height: this.height.v,
                        child: VBind(() => Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Expanded(
                                    child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: buildLeft(c),
                                    ),
                                    Positioned.fill(
                                      child: buildCenter(c),
                                    ),
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      bottom: 0,
                                      child: buildRight(c),
                                    )
                                  ],
                                )),
                                VBind(() => Divider(
                                    height:
                                        1 / MediaQuery.of(c).devicePixelRatio,
                                    color: this.lineColor.v)),
                              ],
                            )),
                      )),
                ))));
  }
}
