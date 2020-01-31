import 'package:flutter/material.dart';
import 'package:mui/m_menu_page.dart';
import 'package:mui/m_app_bar.dart';


class NaviBarShowCase extends MMenuPage {  
  var bgColorIndex = 0;
  var titleColorIndex = 0;
  var leftChildIndex = 0;
  var rightChildIndex = 0;
  NaviBarShowCase(): super() {
    title = "Page Example";
    addCase("背景色变化", (){      
      MAppBar bar = this.topBar;
      bgColorIndex ++;
      if (bgColorIndex % 2 == 1) {
        bar.color.set(Colors.red);
      }      
      else {
        bar.color.set(Colors.white);
      }
    });
    addCase("前景色变化", (){      
      MAppBar bar = this.topBar;
      bar.color.set(Colors.blue);
      titleColorIndex ++;
      if (titleColorIndex % 2 == 1) {
        bar.statusBarBrightness.set(Brightness.dark);
        bar.frontColor.set(Colors.red);
      }      
      else {
        bar.statusBarBrightness.set(Brightness.light);
        bar.frontColor.set(Colors.black);
      }
    });
    addCase("标题变化", (){
      MAppBar bar = this.topBar;
      if (bar.title.v == this.title) {
        bar.title.set("换个标题");
        bar.titleFontSize.set(12);
        bar.centerAlign.set(Alignment.centerLeft);
        bar.centerPadding.set(60);
      }
      else {
        bar.title.set(this.title);
        bar.titleFontSize.set(16);
        bar.centerAlign.set(Alignment.center);
      }      
    });
    addCase("高度变化", (){
      MAppBar bar = this.topBar;
      if (bar.height.v == 20) {
        bar.height.set(56);
      }
      else {
        bar.height.set(20);
      }

    });
    addCase("隐藏导航栏", (){
      MAppBar bar = this.topBar;
      bar.hideStatusBar.set(!bar.hideStatusBar.v);
      bar.hideTopbar.set(!bar.hideTopbar.v);
    });
    addCase("沉浸式", (){
    });
    addCase("左边按钮变化", (){
      MAppBar bar = this.topBar;
      leftChildIndex ++;
      if (leftChildIndex % 2 == 1) {
        bar.leftButtonChild.set(Text("返回"));
      }
      else {
        bar.leftButtonChild.set(Icon(Icons.arrow_back_ios));
      }            
    });
    addCase("右边按钮变化", (){
      MAppBar bar = this.topBar;
      rightChildIndex ++;
      if (rightChildIndex % 3 == 1) {
        bar.rightButtonChild.set(Text("按钮"));
      }
      else if (rightChildIndex % 3 == 2) {
        bar.rightButtonChild.set(Icon(Icons.close));
      }
      else {
        bar.rightButtonChild.set(null);
      }
    });
    addCase("隐藏方法", (){
      MAppBar bar = this.topBar;
      bar.hideCenter.set(true);
      bar.hideLeft.set(true);
    });
    addCase("修改中间视图", (){
    });
  }
}