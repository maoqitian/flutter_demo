import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/components/main_app_bar.dart';
import 'package:flutter_wanandroid/views/home/page/first_page.dart';

/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/10/31 0031
/// email: maoqitian068@163.com
/// des:  首页 widget



DefaultTabController _tabController;
TabBar _tabBar;

//页面标题和id对象
class _Page {
  final String labelId;
  final int labelIndex;

  _Page(this.labelId,this.labelIndex);
}

//页面标题和id对象 集合
final List<_Page> _allPages = <_Page>[
  _Page('最新博文', 1),
  _Page('最新项目', 2),
];

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    _tabController = new DefaultTabController(
        length: _allPages.length,
        child: new Scaffold(
             appBar: MyAppBar(
                 leading: Container(
                     child: ClipOval(
                       child: Image.network(
                         "https://hbimg.huabanimg.com/9bfa0fad3b1284d652d370fa0a8155e1222c62c0bf9d-YjG0Vt_fw658",
                         scale: 15.0,
                       ),
                     ),
                 ),
                 centerTitle: true,
                 title: TabLayout(),
             ),
             body: TabBarViewLayout(),
        ));
    return _tabController;
  }
}

class TabBarViewLayout extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    print("TabBarViewLayout build.......");
    return TabBarView(
        children: _allPages.map((_Page page){
          return buildTabView(context, page);
        }).toList(),
    );
  }

  Widget buildTabView(BuildContext context, _Page page) {
    int labelIndex = page.labelIndex;
    switch(labelIndex){
      case 1:
        return FirstPage();
        break;
      default:
        return  Container(
          child: new Center(
            child: new Text("暂未实现 Page"),
          ),
        );
        break;
    }
  }
}



class TabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _tabBar = new TabBar(
        tabs: _allPages.map((_Page page){
          return Tab(
            text: page.labelId,
          );
        }).toList(),
        isScrollable: true,
        labelPadding: EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
        indicatorSize: TabBarIndicatorSize.label,
        onTap: (index){
          if(index == 0){
             DefaultTabController.of(context).animateTo(0);
             print("点击切换最新博文");

          }else if(index == 1){
            DefaultTabController.of(context).animateTo(0);
            print("点击切换最新项目");

          }
        },
    );
    return _tabBar;
  }
}


