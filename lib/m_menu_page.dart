import 'package:flutter/material.dart';
import 'package:mui/m_page.dart';

class MMenuItem {
  String title;
  Function block;
  MMenuItem(this.title, this.block);
}

class MMenuPage extends MPage {
  List<MMenuItem> _items = List();
  MMenuPage() {
    title = "菜单";
  }
  void addCase(String title, void block()) {
    _items.add(MMenuItem(title, block));
  }
  
  @override
  Widget buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length * 2,
      itemBuilder: (context, index) {
        if (index.isOdd) {
          return Divider();
        }
        return ListTile(
          title: Text(_items[index~/2].title),          
          onTap: (){
            _items[index~/2].block();
          }
        );
      },
    );
  }
  
}