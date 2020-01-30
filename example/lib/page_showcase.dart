import 'package:mui/m_menu_page.dart';
import 'package:mui/m_page.dart';
import 'package:mui/m_dialog_box_bottom_fixed.dart';
import 'package:mui_example/page_b.dart';
import 'package:mui_example/navi_bar_showcase.dart';

class PageShowcase extends MMenuPage {  
  PageShowcase(): super() {
    title = "Page Example";
    addCase("页面跳转", (){
      route(PageB());
    });
    addCase("页面跳转-上升", (){
      route(PageB(), trans: RouteTransition.rais);
    });
    addCase("页面跳转-渐隐", (){
      route(PageB(), trans: RouteTransition.fade);
    });

    addCase("半屏页面-固定1", (){
      showDialog(MDialogBoxBottomFix1(WidgetContainer(page:PageB())), trans: RouteTransition.rais);
    });
    addCase("半屏页面-固定2", (){
      showDialog(MDialogBoxBottomFix2(WidgetContainer(page:PageB())), trans: RouteTransition.rais);
    });
    addCase("半屏页面-固定3", (){
      showDialog(DialogBoxBottomFix3(WidgetContainer(page:PageB())), trans: RouteTransition.rais);
    });    

    addCase("导航栏", (){
      route(NaviBarShowCase());
    });
  }
}