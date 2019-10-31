/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/10/30 0030
/// email: maoqitian068@163.com
/// des: 首页

import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/components/search_input.dart';
import 'package:flutter_wanandroid/views/home/home_page.dart';
import 'package:flutter_wanandroid/views/knowledge/knowledge_page.dart';
import 'package:flutter_wanandroid/views/navigation/navigation_page.dart';
import 'package:flutter_wanandroid/views/oa/oa_page.dart';
import 'package:flutter_wanandroid/views/project/project_page.dart';



class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {


  //存放 底部导航栏 对应的每个 widget
  List<Widget> _list = List();

  String appBarTitle;

  //当前 tab
  int _currentIndex = 0;

  List tabData = [
    {'text': '首页', 'icon': Icon(Icons.home)},
    {'text': '知识体系', 'icon': Icon(Icons.assignment)},
    {'text': '公众号', 'icon': Icon(Icons.chat)},
    {'text': '导航', 'icon': Icon(Icons.navigation)},
    {'text': '项目', 'icon': Icon(Icons.android)},
  ];

  //BottomNavigationBar 数据
  List<BottomNavigationBarItem> _myTabs = [];

  ///遍历加入 tab widget 和 icon data


  @override
  void initState() {
    super.initState();
    appBarTitle = tabData[0]['text'];

    for(int i = 0; i < tabData.length; i++){
        _myTabs.add(new BottomNavigationBarItem(
            icon: tabData[i]['icon'],
            title: new Text(tabData[i]['text']),
        ));
    }

    _list
        ..add(new HomePage())
        ..add(new KnowledgePage())
        ..add(new OfficialAccountsPage())
        ..add(new NavigationPage())
        ..add(new ProjectPage());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
         title: new Center(
           child: Text(appBarTitle),
         ),
        actions: <Widget>[
          IconButton(
              icon:  Icon(Icons.search),
              onPressed: () {
               print('点击了搜索');
              })
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,
        //高亮  被点击高亮
        currentIndex: _currentIndex,
        //修改 页面
        onTap: _itemTapped,
        //shifting :按钮点击移动效果
        //fixed：固定
        type: BottomNavigationBarType.fixed,

        fixedColor: Theme.of(context).primaryColor,
      ),
    );
  }

  buildSearchInput(BuildContext context) {
      return new SearchInput((value) {}, (value) {}, () {});
  }
  // BottomNavigationBar 点击执行方法
  void _itemTapped(int index) {
     setState(() {
        _currentIndex = index;
        appBarTitle = tabData[index]['text'];
     });
  }
}