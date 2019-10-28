

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//有状态的 Widget
class DemoStateWidget extends StatefulWidget{

  @override
 _DemoStateWidgetState createState() => _DemoStateWidgetState("有状态的Widget demo");


/* 以上等于如下代码   => expr 语法是 { return expr; } 形式的缩写
 @override
  State<StatefulWidget> createState() {
    return _DemoStateWidgetState("有状态的Widget demo");
  }*/
}

class _DemoStateWidgetState extends State<StatefulWidget>{


   String text;

  _DemoStateWidgetState(this.text);


  ///  State 中主要的声明周期有 ：
  ///  initState ：初始化，理论上只有初始化一次，第二篇中会说特殊情况下。
  ///  didChangeDependencies：在 initState 之后调用，此时可以获取其他 State 。
  ///  dispose ：销毁，只会调用一次。

  @override
  void initState() {
    super.initState();
    ///定时3秒
    new Future.delayed(const Duration(seconds: 3),(){
      setState(() {
        text = "改变了Textd的值";
      });
    }
    );
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return new Container(
      color: Colors.white ,
      child: new Text(text ?? "这是一个有状态的Widget demo"),
    );
  }


}