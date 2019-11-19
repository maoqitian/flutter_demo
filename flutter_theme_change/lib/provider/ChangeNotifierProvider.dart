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


  //方便子树中的widget获取共享数据
  static T of<T> (BuildContext context,{bool listen = true}){ //listen 是否注册依赖关系 默认注册
    final type = _typeOf<InheritedProvider<T>>();
    final provider = listen ? context.inheritFromWidgetOfExactType(type) as InheritedProvider<T> :
    context.ancestorInheritedElementForWidgetOfExactType(type)?.widget as InheritedProvider<T>;
    return provider.data;

  }


  @override
  State<StatefulWidget> createState() {
    return _ChangeNotifierProviderState<T>();
  }
}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>>{


  @override
  void initState() {
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }




  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if(widget.data != oldWidget.data){
       oldWidget.data.removeListener(update);
       widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }



  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }


  @override
  void dispose() {
    // 移除model监听器
    widget.data.removeListener(update);
    super.dispose();
  }

  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() => {

    });
  }
}