import 'package:flutter/material.dart';

/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/10/31 0031
/// email: maoqitian068@163.com
/// des:  首页 widget


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white ,
      child: new Center(
        child: new Text("Home Page"),
      ),);
  }
}
