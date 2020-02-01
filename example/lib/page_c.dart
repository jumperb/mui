import 'package:flutter/material.dart';
import 'package:mui/m_page.dart';
import 'package:mui/m_app_bar.dart';

class PageC extends MPage {
  PageC(): super(fullfillBody: true) {
    title = "沉浸式页面";
  }
  @override
  Widget buildTopBar(BuildContext c) {
    return MAppBar(title: this.title, color: Colors.transparent, frontColor: Colors.white, lineColor: Colors.transparent, statusBarBrightness: Brightness.dark,);
  }
  @override
  Widget buildBody(BuildContext context) {
    return Image.asset('assets/img/bg.jpg', fit: BoxFit.cover);
  }
}
