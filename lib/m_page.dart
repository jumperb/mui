import 'package:flutter/material.dart';

import 'm_app_bar.dart';



class MPage extends State {
  var title = "标题";
  final bool showBodyOnly; //只buildbody不build top和bottom
  final bool fullfillBody; //body 填满，沉浸式
  Widget topBar;
  Widget bottomBar;
  Widget allContent;
  MPage({this.showBodyOnly = false, this.fullfillBody = false});
  Widget buildTopBar(BuildContext c) {
    return MAppBar(title: this.title);
  }

  Widget buildBody(BuildContext c) {
    return Center(
      child: Text('page'),
    );
  }

  Widget buildBottomBar(BuildContext c) {
    return null;
  }

  Widget buildAll(BuildContext c) {
    if (showBodyOnly) {
      return buildBody(c);
    }

    if (fullfillBody) {
      final items = List<Widget>();
      this.topBar = buildTopBar(c);
      if (this.topBar != null) {
        final topbarCon = Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: this.topBar,
        );
        items.add(topbarCon);
      }

      final body = buildBody(c);
      if (body != null) {
        final bodyCon = Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: body,
        );
        items.add(bodyCon);
      }

      this.bottomBar = buildBottomBar(c);
      if (this.bottomBar != null) {
        final bottomBarCon = Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: this.bottomBar,
        );
        items.add(bottomBarCon);
      }

      return Scaffold(
        body: Stack(children: items),
      );
    }
    else {
      final items = List<Widget>();
      this.topBar = buildTopBar(c);
      if (this.topBar != null) {        
        items.add(this.topBar);
      }

      final body = buildBody(c);
      if (body != null) {        
        items.add(Expanded(
          child: body
        ));
      }

      this.bottomBar = buildBottomBar(c);
      if (this.bottomBar != null) {        
        items.add(this.bottomBar);
      }
      return Scaffold(
        body: Column(children: items)
      );
    }
  }
  @override
  Widget build(BuildContext c) {
    //避免重复build
    if (this.allContent == null) {
      this.allContent = buildAll(c);
    }
    return this.allContent;
  }

  static PageNavigatorObserver pageNavigatorObserver = PageNavigatorObserver();
  static RouteTransitionsBuilder transitionsBuilderFromType(RouteTransition t) {
    return (BuildContext context, Animation<double> animation1,
        Animation<double> animation2, Widget child) {
      switch (t) {
        case RouteTransition.fade:
          {
            return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animation1, curve: Curves.fastOutSlowIn)),
                child: child);
          }
        case RouteTransition.push:
          return null;
        case RouteTransition.rais:
          return SlideTransition(
              position: new Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: const Offset(0.0, 0.0),
              ).animate(CurvedAnimation(
                  parent: animation1, curve: Curves.fastOutSlowIn)),
              child: child);
      }
    };
  }

  static void sRouteTo(BuildContext context, MPage page,
      {RouteTransition trans = RouteTransition.push}) {
    if (trans == RouteTransition.push) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return PageWidget(page);
      }));
      return;
    }
    Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> animation2) {
          return PageWidget(page);
        },
        transitionsBuilder: transitionsBuilderFromType(trans)));
  }

  void route(MPage page, {RouteTransition trans = RouteTransition.push}) {
    sRouteTo(this.context, page, trans: trans);
  }

  static void sShowDialog(BuildContext context, Widget child,
      {RouteTransition trans = RouteTransition.fade}) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (BuildContext buildContext, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Material(type: MaterialType.transparency, child: child);
        },
        transitionBuilder: transitionsBuilderFromType(trans));
  }

  void showDialog(Widget child,
      {RouteTransition trans = RouteTransition.fade}) {
    sShowDialog(this.context, child, trans: trans);
  }
}

enum RouteTransition {
  push,
  fade,
  rais,
}

class PageNavigatorObserver extends NavigatorObserver {
  static final PageNavigatorObserver o = PageNavigatorObserver._internal();
  factory PageNavigatorObserver() {
    return o;
  }
  PageNavigatorObserver._internal();

  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    print(route);
    print(previousRoute);
  }
}


class PageWidget extends StatefulWidget {
  final MPage page;
  PageWidget(this.page);
  @override
  State<StatefulWidget> createState() => this.page;
}

class WidgetContainer extends StatefulWidget {
  final MPage page;
  final State state;
  WidgetContainer({this.page, this.state});
  @override
  State<StatefulWidget> createState() {
    if (state != null) {
      return state;
    }
    if (page != null) {
      page.showBodyOnly = true;
      return page;
    }
    return null;
  }
}