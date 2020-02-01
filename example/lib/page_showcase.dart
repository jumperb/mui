import 'package:mui/m_menu_page.dart';
import 'package:mui/m_dialog_box_bottom_fixed.dart';
import 'package:mui_example/page_b.dart';
import 'package:mui_example/navi_bar_showcase.dart';
import 'package:mui/mui.dart';
import 'package:mui/m_page.dart';

class PageShowcase extends MMenuPage {  
  PageShowcase(): super() {
    title = "Page Example";
    addCase("页面跳转", (){
      MUI.route(this.context, PageB());
    });
    addCase("页面跳转-上升", (){
      MUI.route(this.context, PageB(), trans: RouteTransition.rais);
    });
    addCase("页面跳转-渐隐", (){
      MUI.route(this.context, PageB(), trans: RouteTransition.fade);
    });
    addCase("导航栏", (){
      MUI.route(this.context, NaviBarShowCase());
    });
  }
}