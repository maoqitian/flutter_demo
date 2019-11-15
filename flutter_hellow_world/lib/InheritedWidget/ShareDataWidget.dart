/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/11/15 0015
/// email: maoqitian068@163.com
/// des:  InheritedWidget是Flutter中非常重要的一个功能型组件，它提供了一种数据在widget树中从上到下传递、共享的方式
import 'package:flutter/material.dart';


class ShareDataWidget extends InheritedWidget  {


  final int data; //需要在子树中共享的数据，保存点击次数

  ShareDataWidget( {@required this.data,Widget child})
      :super(child:child);


  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context){
    //return context.inheritFromWidgetOfExactType(ShareDataWidget);
    //使用 ancestorInheritedElementForWidgetOfExactType 方法当数据变化则不会调用 子widget 的didChangeDependencies 方法
    return context.ancestorInheritedElementForWidgetOfExactType(ShareDataWidget).widget;
  }


  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return oldWidget.data != data;
  }

}
