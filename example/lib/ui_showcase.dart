import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mui/m_menu_page.dart';
import 'package:mui/mui.dart';
import 'package:mui/m_animation.dart';

class UIShowCase extends MMenuPage {
  UIShowCase() : super() {
    title = "浮层示例";
    addCase("loading", () {
      final l = MUI.loading(this.context);
      Timer(Duration(milliseconds: 3000), () {
        l.dismiss();
      });
    });

    addCase("loading+文字", () {
      final l = MUI.loading(this.context, text: "加载中", progressorSize: 20, strokeWidth: 2);
      Timer(Duration(milliseconds: 3000), () {
        l.dismiss();
      });
    });

    addCase("loading+上下排", () {
      final l = MUI.loading(this.context, text: "加载中", verticalLayout: true, progressorSize: 44);
      Timer(Duration(milliseconds: 3000), () {
        l.dismiss();
      });
    });
    addCase("进度", () {
      final l = MUI.progress(this.context, 0.1);
      MAnimation.tween<double>(l.value.v, 1.0, 3000, (double v){
        l.value.set(v);
      }, statusCallback: (AnimationStatus s){
        if (s == AnimationStatus.completed) {
          l.dismiss();
        }        
      });
    });

    addCase("进度 + 数字", () {
      final l = MUI.progress(this.context, 0.0, text: "0%", verticalLayout: true);
      MAnimation.tween<double>(l.value.v, 1.0, 3000, (double v){
        l.value.set(v);
        int v2 = (v * 100).toInt();
        l.text.set("$v2%");
      }, statusCallback: (AnimationStatus s){
        if (s == AnimationStatus.completed) {
          l.dismiss();
        }        
      });
    });

  }
}
