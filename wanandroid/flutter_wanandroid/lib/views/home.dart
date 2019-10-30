/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/10/30 0030
/// email: maoqitian068@163.com
/// des: 首页

import 'package:flutter/material.dart';



class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {


  //存放 底部导航栏 对应的每个 widget
  List<Widget> _list = List();

  //当前 tab
  int _currentIndex = 0;

  List tabData = [
    {'text': '首页', 'icon': Icon(Icons.home)},
    {'text': '知识体系', 'icon': Icon(Icons.assignment)},
    {'text': '公众号', 'icon': Icon(Icons.chat)},
    {'text': '导航', 'icon': Icon(Icons.navigation)},
    {'text': '公众号', 'icon': Icon(Icons.android)},
    //https://flutter-go.pub/api/isInfoOpen
  ];

  //BottomNavigationBar 数据
  List<BottomNavigationBarItem> _myTabs = [];

  ///遍历加入 tab widget 和 icon data



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white ,
      child: new Center(
        child: new Text("Home Page"),
      ),
    );
  }
}