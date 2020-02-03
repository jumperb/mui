import 'package:flutter/material.dart';
import 'package:mui/m_menu_page.dart';
import 'package:mui_example/page_showcase.dart';
import 'package:mui/mui.dart';
import 'dialog_showcase.dart';
import 'package:mui/m_app_bar.dart';
import 'ui_showcase.dart';

class TestMenu extends MMenuPage {  
  TestMenu(): super() {
    title = "Example";
    addCase("页面", (){
      MUI.route(this.context, PageShowcase());
    });

    addCase("弹出", (){
      MUI.route(this.context, DialogShowCase());
    });

    addCase("常用UI", (){
      MUI.route(this.context, UIShowCase());
    });
  }
  
  @override
  Widget buildTopBar(BuildContext c) {
    return MAppBar(title: this.title, hideLeft: true);
  }
}