import 'package:flutter/material.dart';
import 'package:mui/m_page.dart';
import 'package:mui/m_app_bar.dart';

class PageB extends MPage {
  PageB() {
    title = "测试页面";
  }
  @override
  Widget buildBody(BuildContext context) {
    return Container(
        height: 300,
        width: 200,
        child: Center(
            child: Container(
          color: Color(0xffff0000),
          child: Center(
            child: Text("测试页面"),
          ),
          height: MediaQuery.of(context).size.height / 2,
        )));
  }
}
