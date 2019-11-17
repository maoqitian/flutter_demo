/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019-11-17
/// email: maoqitian068@163.com
/// des:  订阅者

import 'package:flutter/material.dart';
import 'package:flutter_theme_change/provider/InheritedProvider.dart';

// 该方法用于在Dart中获取模板类型
Type _typeOf<T>(){
  return T;
}


class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget{


  final Widget child;
  final T data;

  ChangeNotifierProvider({Key key,this.child,this.data});


  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T> (BuildContext context){

    final type = _typeOf<InheritedProvider<T>>();
    final provider = context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>;

    return provider.data;

  }


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChangeNotifierProviderState<T>();
  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>>{



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }



  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }



  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }



}