
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
        body: DemoStatelessWidget("Flutter Hello World ! 无状态的Widget"), //DemoStatelessWidget("Flutter Hello World ! 无状态的Widget") DemoStateWidget()
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
    return Container(
      constraints: BoxConstraints.expand(
        height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
      ),
      padding: const EdgeInsets.all(8.0),
      color: Colors.blue[600],
      alignment: Alignment.center,
      child: Text(text,
          style: Theme.of(context)
              .textTheme
              .display1
              .copyWith(color: Colors.white)),
      transform: Matrix4.rotationZ(0.1),
    );
  }
}