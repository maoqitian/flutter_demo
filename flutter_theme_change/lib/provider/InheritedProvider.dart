/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019-11-17
/// email: maoqitian068@163.com
/// des:  保存需要共享的数据InheritedWidget

import 'package:flutter/material.dart';


class InheritedProvider<T> extends InheritedWidget{


  //共享状态数据使用泛型 外部传入
  final T data;

  InheritedProvider({@required this.data, Widget child}):super(child:child);


  @override
  bool updateShouldNotify(InheritedProvider<T> oldWidget) {
    ///返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`方法。
    return true;
  }

}