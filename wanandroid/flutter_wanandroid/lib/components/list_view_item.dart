import 'package:fluro/fluro.dart';
/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/11/5 0005
/// email: maoqitian068@163.com
/// des:  
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/model/article_data.dart';
import 'package:flutter_wanandroid/routers/application.dart';
import 'package:flutter_wanandroid/routers/routes.dart';

class ListViewItem extends StatelessWidget {

  final String itemUrl;
  final String itemTitle;
  final String data;
  final ArticleData articleData;

  const ListViewItem({Key key, this.itemUrl, this.itemTitle, this.data,this.articleData})
      :super(key:key);


  @override
  Widget build(BuildContext context) {
    return new Card(
      color: Colors.white,
      elevation: 4.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
      child: ListTile(
        onTap: (){
          Application.router.navigateTo(context, '${Routes.webViewPage}?title=${Uri.encodeComponent(articleData.title)}&url=${Uri.encodeComponent(articleData.link)}');
        },
        title: Padding( //文章标题
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
             articleData.title,
             style: TextStyle(color: Colors.black, fontSize: 15.0),
           ),
        ),
        subtitle: Row( //作者名称
          children: <Widget>[
             Padding(
               child: Text(articleData.author == ""? '👲 :  '+ articleData.shareUser : '👲 :  '+articleData.author,
                   style: TextStyle(color: Colors.black54, fontSize: 10.0)),
               padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
             )
          ],
        ),
        trailing:
        Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: 30.0),
      ),
    );
  }
}

