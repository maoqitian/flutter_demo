import 'package:flutter/material.dart';
import 'package:flutter_grid_demo/bean/article_data.dart';
import 'package:flutter_grid_demo/grid_view_item.dart';
import 'package:flutter_grid_demo/refresh_grid_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Grid Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  Widget buildCard(data){

    return GridViewItem(articleData: data);
  }

  //构造假数据
  Future<Map> getPageListData([Map<String, dynamic> params]) async {
    var pageIndex = (params is Map) ? params['pageIndex'] : 0;
    bool isRefresh = (params is Map) ? params['isRefresh'] : false;

    if(pageIndex == 0&& !isRefresh){ //置顶 数据 正常列表数据 同时请求 第一次请求
      List<ArticleData> articleAllList = [];

      for(int i = 0; i<=10;i++){
        ArticleData articleData = new ArticleData();
        articleData.title = widget.title+i.toString();
        articleData.des = "描述"+i.toString();
        articleAllList.add(articleData);
      }
      pageIndex++;
      //延迟3秒
      await Future.delayed(Duration(seconds: 2), () {
        return [];
      });
      return  {"list":articleAllList, 'total':2, 'pageIndex':pageIndex};
    }else if(pageIndex == 0 && isRefresh){ //模拟下拉刷新数据
      List<ArticleData> articleAllList = [];

      for(int i = 0; i<=10;i++){
        ArticleData articleData = new ArticleData();
        articleData.title = widget.title+" 下拉刷新数据"+i.toString();
        articleData.des = widget.title+"描述 下拉刷新数据"+i.toString();
        articleAllList.add(articleData);
      }
      pageIndex++;
      //延迟3秒
      await Future.delayed(Duration(seconds: 2), () {
        return [];
      });
      return  {"list":articleAllList, 'total':2, 'pageIndex':pageIndex};
    } else{
      //正常列表数据 加载更多
      List<ArticleData> articleAllList = [];
      for(int i = 0; i<=10;i++){
        ArticleData articleData = new ArticleData();
        articleData.title = widget.title+"加载更多数据 "+i.toString();
        articleData.des = widget.title+"描述 加载更多数据"+i.toString();
        articleAllList.add(articleData);
      }
      //延迟3秒
      await Future.delayed(Duration(seconds: 2), () {
        return [];
      });
      Map<String, dynamic> result = {"list":articleAllList, 'total':2, 'pageIndex':pageIndex++};
      return result;
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: RefreshGridPage(
              requestApi: getPageListData ,renderItem: buildCard,
            ),
      ),
    );
  }
}
