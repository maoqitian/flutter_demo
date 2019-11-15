/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/11/15 0015
/// email: maoqitian068@163.com
/// des:  创建一个按钮，每点击一次，就将ShareDataWidget的值自增
import 'package:flutter/material.dart';
import 'package:flutter_hellow_world/InheritedWidget/ShareDataWidget.dart';
import 'package:flutter_hellow_world/InheritedWidget/TestWidget.dart';


class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() => _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: TestWidget()//子widget中依赖ShareDataWidget
            ),
            RaisedButton(
              child: Text("Increment"),
              onPressed: (){ //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
                setState(() {
                  ++ count;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
