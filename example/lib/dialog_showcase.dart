import 'package:flutter/material.dart';
import 'package:mui/m_menu_page.dart';
import 'package:mui/mui.dart';
import 'package:mui/m_page.dart';
import 'package:mui/m_dialog_box_bottom_fixed.dart';
import 'package:mui_example/page_b.dart';
import 'package:mui/m_const.dart';

class DialogShowCase extends MMenuPage {
  DialogShowCase() : super() {
    title = "弹出示例";
    addCase("半屏页面-固定1", () {
      MDialogBoxBottomFix1(WidgetContainer(page: PageB())).show(this.context);
    });
    addCase("半屏页面-固定2", () {
      MDialogBoxBottomFix2(WidgetContainer(page: PageB())).show(this.context);
    });
    addCase("半屏页面-固定3", () {
      MDialogBoxBottomFix3(WidgetContainer(page: PageB())).show(this.context);
    });
    addCase("toast", () {
      MUI.toast(this.context, "短");
    });
    addCase("toast 长", () {
      MUI.toast(this.context, "很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长");
    });
    addCase("底部 toast", () {
      MUI.toast(this.context, "底部 toast", align: Alignment.bottomCenter);
    });
    addCase("多行 toast", () {
      MUI.toast(this.context,
          "很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长",
          align: Alignment.topCenter, maxlines: 3);
    });
    addCase("toast+图标", () {
      MUI.toast(this.context, "toast+图标", icon: Icon(Icons.alarm_on));
    });

    addCase("toast+上下排", () {
      MUI.toast(this.context, "toast+上下排",
          icon: Icon(
            Icons.alarm_on,
            size: 100,
          ),
          verticalLayout: true);
    });

    addCase("alert", () {
      MUI.alert(title: "普通alert").addCancelButton().show(this.context);
    });
    addCase("alert 2个按钮", () {
      MUI
          .alert(title: "alert 2个按钮")
          .addCancelButton()
          .addButton(text: "确定", callback: () {})
          .show(this.context);
    });
    addCase("alert+3按钮", () {
      MUI
          .alert(title: "alert 3个按钮")
          .addButton(text: "按钮一", callback: () {})
          .addButton(text: "按钮2")
          .addCancelButton()
          .show(this.context);
    });
    addCase("alert 主副标题", () {
      MUI
          .alert(title: "主标题", subTitle: "子标题子标题子标题子标题子标题子标题子标题子标题子标题子标题子标题子标题")
          .addCancelButton()
          .addButton(text: "确定", callback: () {})
          .show(this.context);
    });
    addCase("alert 副标题", () {
      MUI
          .alert(subTitle: "子标题子标题子标题子标题子标题子标题子标题子标题子标题子标题子标题子标题")
          .addCancelButton()
          .addButton(text: "确定", callback: () {})
          .show(this.context);
    });

    addCase("alert+自定义头部", () {
      
      MUI
          .alert(
              topWidget: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(m_radius)),
              child: Image.asset('assets/img/bg.jpg', fit: BoxFit.cover)
            )))
          .addCancelButton()
          .addButton(text: "确定", callback: () {})
          .show(this.context);
    });

    addCase("action sheet", () {
      MUI.actionSheet().addButton(text:"壹壹壹壹壹壹壹壹").addButton(text:"贰贰贰贰贰贰贰贰").show(this.context);
    });
    addCase("action sheet 标题", () {
      MUI.actionSheet(title:"标题").addButton(text:"壹壹壹壹壹壹壹壹").addButton(text:"贰贰贰贰贰贰贰贰").addButton(text:"叁叁叁叁叁叁叁叁").show(this.context);
    });    
  }
}
