import 'package:flutter/material.dart';
import 'package:mui/m_page.dart';
import 'test_menu.dart';

void main() => runApp(MaterialApp(
  home: PageWidget(TestMenu()),
  navigatorObservers: [MPage.pageNavigatorObserver]
));
