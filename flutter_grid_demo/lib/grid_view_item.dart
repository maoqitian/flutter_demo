/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/11/5 0005
/// email: maoqitian068@163.com
/// des:  文章 list view item
import 'package:flutter/material.dart';

import 'bean/article_data.dart';

class GridViewItem extends StatefulWidget {


  final ArticleData articleData;

  const GridViewItem({Key key, this.articleData,})
      :super(key:key);

  @override
  _GridViewItemState createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: Colors.white,
      elevation: 4.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
      child: ListTile(
        onTap: (){ //link 跳转  webview
        },
        title: Padding( //文章标题
          padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
          child: Text(
            widget.articleData.title,
            style: TextStyle(color: Colors.black, fontSize: 15.0),
            maxLines: 1, // title 只显示一行
            overflow: TextOverflow.ellipsis //超出一行 显示 ...
          ),
        ),
        subtitle: Padding( //文章标题
          padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
          child: Text(
              widget.articleData.des,
              style: TextStyle(color: Colors.black, fontSize: 10.0),
              maxLines: 1, // title 只显示一行
              overflow: TextOverflow.ellipsis //超出一行 显示 ...
          )
        ),
      ),
    );
  }



}


