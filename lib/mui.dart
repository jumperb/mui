import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'm_page.dart';
import 'm_dialog_toast.dart';
import 'm_dialog_alert.dart';
import 'm_dialog_actionsheet.dart';
import 'm_dialog_progressor.dart';

enum RouteTransition {
  push,
  fade,
  rais,
}

class MUI {
  static const MethodChannel _channel = const MethodChannel('mui');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static RouteTransitionsBuilder transitionsBuilderFromType(RouteTransition t) {
    return (BuildContext context, Animation<double> animation1,
        Animation<double> animation2, Widget child) {
      switch (t) {
        case RouteTransition.fade:
          {
            return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation1, curve: Curves.fastOutSlowIn)),
                child: child);
          }
        case RouteTransition.push:
          return null;
        case RouteTransition.rais:
          return SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: const Offset(0.0, 0.0),
              ).animate(CurvedAnimation(
                  parent: animation1, curve: Curves.fastOutSlowIn)),
              child: child);
      }
    };
  }

  static void route(BuildContext context, MPage page,
      {RouteTransition trans = RouteTransition.push}) {
    if (trans == RouteTransition.push) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return PageWidget(page);
      }));
      return;
    }
    Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> animation2) {
          return PageWidget(page);
        },
        transitionsBuilder: transitionsBuilderFromType(trans)));
  }

  static void showDialog(BuildContext context, Widget child,
      {RouteTransition trans = RouteTransition.fade}) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black.withOpacity(0.1),
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (BuildContext buildContext, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Material(type: MaterialType.transparency, child: child);
        },
        transitionBuilder: transitionsBuilderFromType(trans));
  }

  static void toast(BuildContext context, String title,
      {Alignment align = Alignment.center,
      int maxlines = 1,
      Widget icon,
      bool verticalLayout = false,
      double minWidth = 120.0,
      double maxWidth = 300.0}) {
    final toast = MDialogToast(title,
            align: align,
            maxlines: maxlines,
            icon: icon,
            verticalLayout: verticalLayout,
            minWidth: minWidth,
            maxWidth: maxWidth)
        .show(context);
    Timer(Duration(milliseconds: 2000), () {
      toast.dismiss();
    });
  }

  static MDialogAlert alert({String title, String subTitle, Widget topWidget}) {
    return MDialogAlert(title: title, subTitle: subTitle, topWidget: topWidget);
  }

  static MDialogActionSheet actionSheet({String title}) {
    return MDialogActionSheet(title: title);
  }

  static MDialogProgressor loading(BuildContext context,
      {String text,
      double value,
      Color progressorColor = Colors.white,
      Color progressorBgColor = const Color(0xff444444),
      double progressorSize = 40.0,
      Color backgroundColor = const Color.fromARGB(204, 0, 0, 0),
      double strokeWidth = 8,
      bool verticalLayout = false,
      double minWidth = 40,
      double maxWidth = 300}) {
    return MDialogProgressor(
            value: value,
            text: text,
            progressorColor: progressorColor,
            progressorBgColor: progressorBgColor,
            progressorSize: progressorSize,
            backgroundColor: backgroundColor,
            strokeWidth: strokeWidth,
            verticalLayout: verticalLayout,
            minWidth: minWidth,
            maxWidth: maxWidth)
        .show(context);
  }

  static MDialogProgressor progress(BuildContext context, double value,
      {String text,
      Color progressorColor = Colors.white,
      Color progressorBgColor = const Color(0xff444444),
      double progressorSize = 40.0,
      Color backgroundColor = const Color.fromARGB(204, 0, 0, 0),
      double strokeWidth = 8,
      bool verticalLayout = false,
      double minWidth = 40,
      double maxWidth = 300}) {
    return MDialogProgressor(
            value: value,
            text: text,
            progressorColor: progressorColor,
            progressorBgColor: progressorBgColor,
            progressorSize: progressorSize,
            backgroundColor: backgroundColor,
            strokeWidth: strokeWidth,
            verticalLayout: verticalLayout,
            minWidth: minWidth,
            maxWidth: maxWidth)
        .show(context);
  }
}
