/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/11/18 0018
/// email: maoqitian068@163.com
/// des:  事件 消费者 获得当前context和指定数据类型的Provider
import 'package:flutter/material.dart';
import 'package:flutter_theme_change/provider/ChangeNotifierProvider.dart';

class Consumer<T> extends StatelessWidget{


  final Widget child;
  //获得当前context
  final Widget Function(BuildContext context, T value) builder;

  Consumer({Key key,@required this.builder,this.child}):assert(builder !=null),super(key:key);



  @override
  Widget build(BuildContext context) {
    return builder(context,ChangeNotifierProvider.of<T>(context)); //自动获取Model
  }



}