import 'package:flutter/material.dart';
import 'package:mui/m_menu_page.dart';
import 'package:mui/mui.dart';
import 'package:mui/m_page.dart';
import 'package:mui/m_dialog_box_bottom_fixed.dart';
import 'package:mui_example/page_b.dart';

class DialogShowCase extends MMenuPage {  
  DialogShowCase(): super() {
    title = "弹出示例";
    addCase("半屏页面-固定1", (){
      MUI.showDialog(this.context, MDialogBoxBottomFix1(WidgetContainer(page:PageB())), trans: RouteTransition.rais);
    });
    addCase("半屏页面-固定2", (){
      MUI.showDialog(this.context, MDialogBoxBottomFix2(WidgetContainer(page:PageB())), trans: RouteTransition.rais);
    });
    addCase("半屏页面-固定3", (){
      MUI.showDialog(this.context, MDialogBoxBottomFix3(WidgetContainer(page:PageB())), trans: RouteTransition.rais);
    });
    addCase("toast", (){
      MUI.toast(this.context, "短");
    });
    addCase("toast 长", (){
      MUI.toast(this.context, "很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长");
    });
    addCase("底部 toast", (){
      MUI.toast(this.context, "底部 toast", align: Alignment.bottomCenter);
    });
    addCase("多行 toast", (){
      MUI.toast(this.context, "很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长", align: Alignment.topCenter, maxlines: 3);
    });
    addCase("toast+图标", (){
      MUI.toast(this.context, "toast+图标", icon: Icon(Icons.alarm_on));
    });

    addCase("toast+上下排", (){
      MUI.toast(this.context, "toast+上下排", icon: Icon(Icons.alarm_on, size: 100,), verticalLayout: true);
    });

    

    addCase("alert", (){
      
    });

    addCase("alert+3按钮", (){
      
    });

    addCase("alert+自定义", (){
      
    });
    addCase("loading", (){
      
    });

    addCase("loading+文字", (){
      
    });

    addCase("loading+上下排", (){
      
    });
    addCase("进度", (){
      
    });

    addCase("进度 + ", (){
      
    });

    addCase("action sheet", (){
      
    });
  }
}