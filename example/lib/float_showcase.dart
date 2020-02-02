import 'package:mui/m_menu_page.dart';

class FloatShowCase extends MMenuPage {
  FloatShowCase() : super() {
    title = "浮层示例";
    addCase("loading", () {});

    addCase("loading+文字", () {});

    addCase("loading+上下排", () {});
    addCase("进度", () {});

    addCase("进度 + ", () {});
  }
}
