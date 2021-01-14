import 'package:flutter/material.dart';
import 'm_circular_progressor.dart';
import 'package:vrender/vrender.dart';

enum MLoadState { loading, network, nodata, error, success }

class MLoad extends StatelessWidget {
  final Widget Function(BuildContext c) loadChild;
  final Color backgroundColor;
  final Function() reloadCallback;
  final VO<MLoadState> _state = VO(MLoadState.loading);
  final VO<double> childOpacity = VO(1.0);
  MLoad(this.loadChild, this.reloadCallback,
      {this.backgroundColor = Colors.transparent});

  void setState(MLoadState state) {
    this._state.set(state);
    if (state == MLoadState.success) {
      //TODO 动画
    }
  }

  @override
  Widget build(BuildContext c) {
    return Stack(children: [
      Positioned.fill(child: VBind(() {
        if (this._state.v == MLoadState.success) {
          return Opacity(opacity: this.childOpacity.v, child: buildSuccess(c));
        } else {
          return Container(color: backgroundColor);
        }
      })),
      Positioned.fill(
          child: VBind(() {
                switch (this._state.v) {
                  case MLoadState.loading:
                    return buildLoading(c);
                  case MLoadState.network:
                    return buildReloadButton(c, buildNetworkError(c));
                  case MLoadState.nodata:
                    return buildReloadButton(c, buildNoDataError(c));
                  case MLoadState.error:
                    return buildReloadButton(c, buildError(c));
                  default:
                    return Visibility(visible: false, child: SizedBox());
                }
              }))
    ]);
  }

  Widget buildLoading(BuildContext c) {
    return Center(
        child: SizedBox(
            width: 40,
            height: 40,
            child:
                MCircularProgressor(color: Color(0x33000000), strokeWidth: 2)));
  }

  Widget buildReloadButton(BuildContext c, Widget child) {
    return MaterialButton(
        elevation: 0,
        child: child,
        onPressed: () {
          if (reloadCallback != null) reloadCallback();
        });
  }

  Widget buildNetworkError(BuildContext c) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.wifi, size: 80, color: Color(0x22000000)),
          SizedBox(width: 20, height: 20),
          Text("网络无法连接",
              style: TextStyle(fontSize: 14, color: Color(0x66000000))),
          Text("点击任意位置重试",
              style: TextStyle(fontSize: 12, color: Color(0x22000000)))
        ],
      ),
    );
  }

  Widget buildNoDataError(BuildContext c) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.wallpaper, size: 80, color: Color(0x22000000)),
          SizedBox(width: 20, height: 20),
          Text("没有数据",
              style: TextStyle(fontSize: 14, color: Color(0x66000000))),
          Text("点击任意位置重试",
              style: TextStyle(fontSize: 12, color: Color(0x22000000)))
        ],
      ),
    );
  }

  Widget buildError(BuildContext c) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.cloud_off, size: 80, color: Color(0x22000000)),
          SizedBox(width: 20, height: 20),
          Text("服务器开小差了",
              style: TextStyle(fontSize: 14, color: Color(0x66000000))),
          Text("点击任意位置重试",
              style: TextStyle(fontSize: 12, color: Color(0x22000000)))
        ],
      ),
    );
  }

  Widget buildSuccess(BuildContext c) {
    if (this.loadChild != null)
      return this.loadChild(c);
    else
      return null;
  }
}
