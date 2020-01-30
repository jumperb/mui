import 'package:mui/m_menu_page.dart';
import 'package:mui_example/page_showcase.dart';

class TestMenu extends MMenuPage {  
  TestMenu(): super() {
    title = "Example";
    addCase("Page", (){
      route(PageShowcase());
    });

    addCase("Half Page", (){
      route(PageShowcase());
    });
  }
}