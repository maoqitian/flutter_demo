/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/11/1 0001
/// email: maoqitian068@163.com
/// des:  首页最新博文 page 轮播图 + 文章列表
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/api/Api.dart';
import 'package:flutter_wanandroid/components/list_view_item.dart';
import 'package:flutter_wanandroid/http/data_utils.dart';
import 'package:flutter_wanandroid/http/http_utils.dart';
import 'package:flutter_wanandroid/model/article_data.dart';
import 'package:flutter_wanandroid/components/list_refresh.dart' as listComp;
import 'package:flutter_wanandroid/views/home/page/banner_page.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {


  @override
  void initState() {
    super.initState();
  }

  //  ListViewItem
  Widget makeCard(index,item){
    var myTitle = '${item.title}';
    var myUsername = item.author;
    if(myUsername == ""){
      myUsername = '${'👲'}: ${item.shareUser} ';
    }else{
      myUsername = '${'👲'}: ${item.author} ';
    }
    var codeUrl = '${item.link}';  //item 地址
    return new ListViewItem(itemUrl:codeUrl,itemTitle: myTitle,data: myUsername);
  }


  headerView (){
    return Column(
      children: <Widget>[
           Stack(
             children: <Widget>[
               //轮播图 page
               new BannerPage(),
               //Positioned(//方法二
                 //  top: 10.0,
                   //left: 0.0,
                   //child: DisclaimerMsg(key:key,pWidget:this)
             ],),
        SizedBox(height: 1, child:Container(color: Theme.of(context).primaryColor)),
        SizedBox(height: 10),
      ],
    );
  }


  Future<Map> getIndexListData([Map<String, dynamic> params]) async {
    var pageIndex = (params is Map) ? params['pageIndex'] : 0;
    var  pageTotal = 0;
    String path = '/article/list/$pageIndex/json';

    List<ArticleData> articleList = [];
    try{
    var response = await HttpUtils.get(Api.BASE_URL+path);
    if(response != null && response['errorCode'] == 0){
      pageTotal = response['data']['pageCount'];
      if (!(pageTotal is int) || pageTotal <= 0) {
        pageTotal = 0;
      }
      for (int i = 0; i < response['data']['datas'].length; i++) {
        Map<String, dynamic> json = response['data']['datas'][i];
        articleList.add(ArticleData.fromJson(json));
       }
      }
     }catch(e){
    }
    pageIndex += 1;
    Map<String, dynamic> result = {"list":articleList, 'total':pageTotal, 'pageIndex':pageIndex};
    return result;
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Expanded(
            child:listComp.ListRefresh(getIndexListData,makeCard,headerView)
        )
      ],
    );
  }
}

