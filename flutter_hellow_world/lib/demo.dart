
import 'package:flutter/material.dart';
import 'package:flutter_hellow_world/DemoStateWidget.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
      home: new Scaffold(
        appBar: new AppBar(
            title: new Center(
              child: new Text("Welcome to Flutter"),
            )
        ),
        body: new Center(
          child: DemoStateWidget(), //DemoStatelessWidget("无状态的Widget demo")
        ),
      ),
    );
  }

}

//无状态 Widget
class DemoStatelessWidget extends StatelessWidget{

  final String text;

  //构造方法传入 text 值
  DemoStatelessWidget(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.white,
        child: new Text(text ?? "这是一个无状态的Widget demo "),
    );
  }


}