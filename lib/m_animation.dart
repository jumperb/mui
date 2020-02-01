import 'package:flutter/material.dart';
class MAnimation extends State with TickerProviderStateMixin {
  static final MAnimation o = MAnimation._internal();
  factory MAnimation() {
    return o;
  }
  MAnimation._internal();
  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
  
  static void tween<T>(T from, T to, int ms, Function(T v) updater, {Function(AnimationStatus status) statusCallback}){
    AnimationController controller = AnimationController(duration: Duration(milliseconds: ms), vsync: MAnimation());
        Animation animation = Tween<T>(begin: from, end: to).animate(controller);
        animation.addListener((){
          updater(animation.value);
        });
        animation.addStatusListener((AnimationStatus status){
          if (statusCallback != null) statusCallback(status);
          if (status == AnimationStatus.completed) {            
            controller.dispose();
          }
        });
        controller.forward();
  }
  static void colorTween(Color from, Color to, int ms, Function(Color v) updater, {Function(AnimationStatus status) statusCallback}){
    AnimationController controller = AnimationController(duration: Duration(milliseconds: ms), vsync: MAnimation());
        Animation animation = ColorTween(begin: from, end: to).animate(controller);
        animation.addListener((){
          updater(animation.value);
        });
        animation.addStatusListener((AnimationStatus status){
          if (statusCallback != null) statusCallback(status);
          if (status == AnimationStatus.completed) {            
            controller.dispose();
          }
        });
        controller.forward();
  }
}