import 'package:flutter/material.dart';
import 'package:flutter_tab_refresh/tab_page_view.dart';

void main() => runApp(MyApp());


List <String>_titles=['湖人','勇士','雄鹿','快船','凯尔特人','马刺','76人','猛龙'];
TabController  _tabController;

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: _titles.length,vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: buildTabBar(),
        //bottom: buildTabBar(),
      ),
      body: TabBarViewLayout()
    );
  }

  Widget buildTabBar() {
    return  TabBar(
          //构造Tab集合
          tabs: _titles.map((String title){
            return Tab(
              text: title,
            );
          }).toList(),
          //tabs 的长度超出屏幕宽度后，TabBar，是否可滚动
          //设置为false tab 将平分宽度，为true tab 将会自适应宽度
          isScrollable: true,
          //设置tab文字得类型
          labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          labelPadding: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
          ///指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽,TabBarIndicatorSize.tab跟每个tab等宽
          indicatorSize: TabBarIndicatorSize.label,
          //设置tab选中得颜色
          labelColor: Colors.white,
          //设置tab未选中得颜色
          unselectedLabelColor: Colors.white54,
          indicatorColor: Colors.white,
          controller: _tabController,
        );
  }
}


// TabBarView Widget
class TabBarViewLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("TabBarViewLayout build.......");
    return TabBarView(
      controller: _tabController,
      children: _titles.map((String title){
        return TabPageView(title);
      }).toList(),
    );
  }
}
