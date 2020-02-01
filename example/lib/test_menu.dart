import 'package:mui/m_menu_page.dart';
import 'package:mui_example/page_showcase.dart';
import 'package:mui/mui.dart';
import 'package:mui_example/dialog_showcase.dart';
class TestMenu extends MMenuPage {  
  TestMenu(): super() {
    title = "Example";
    addCase("页面", (){
      MUI.route(this.context, PageShowcase());
    });

    addCase("弹出", (){
      MUI.route(this.context, DialogShowCase());
    });
  }
}