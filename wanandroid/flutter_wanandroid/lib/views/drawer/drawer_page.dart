/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/11/8 0008
/// email: maoqitian068@163.com
/// des:  侧边栏 抽屉
import 'package:flutter/material.dart';


class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {

  final TextStyle textStyle =
  TextStyle(fontSize: 16, fontWeight: FontWeight.w300);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
           accountName: Text("maoqitian"),
           accountEmail: Container(
             padding: const EdgeInsets.only(bottom: 20.0),
             child: Text(
               //hasLogin ? widget.userInfo.username : ' ',
               "maoqitian@gmail.com",
               style: TextStyle(fontSize: 15.0),
             ),
           ),
           decoration: BoxDecoration(
             image: new DecorationImage(
               fit: BoxFit.cover,
               image: new NetworkImage(
                   //hasLogin ? widget.userInfo.avatarPic :
                   'https://hbimg.huabanimg.com/9bfa0fad3b1284d652d370fa0a8155e1222c62c0bf9d-YjG0Vt_fw658'),
             ),
           ),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            size: 27.0,
          ),
          title: Text(
            '首页',
            style: textStyle,
          ),
          onTap: () {
            //pushPage(context, SearchPage(), pageName: "SearchPage");
            ///关闭侧边栏
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.surround_sound,
            size: 27.0,
          ),
          title: Text(
            '广场',
            style: textStyle,
          ),
          onTap: () {
            //pushPage(context, SearchPage(), pageName: "SearchPage");
            ///关闭侧边栏
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.format_list_bulleted,
            size: 27.0,
          ),
          title: Text(
            '常用网站',
            style: textStyle,
          ),
          onTap: () {
            //pushPage(context, SearchPage(), pageName: "SearchPage");
            ///关闭侧边栏
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.collections,
            size: 27.0,
          ),
          title: Text(
            '我的收藏',
            style: textStyle,
          ),
          onTap: () {
            //pushPage(context, SearchPage(), pageName: "SearchPage");
            ///关闭侧边栏
            Navigator.pop(context);
          },
        ),
        new Divider(),
        ListTile(
          leading: Icon(
            Icons.bookmark,
            size: 27.0,
          ),
          title: Text(
            '积分排行榜',
            style: textStyle,
          ),
          onTap: () {
            //pushPage(context, SearchPage(), pageName: "SearchPage");
            ///关闭侧边栏
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.date_range,
            size: 27.0,
          ),
          title: Text(
            '我的积分',
            style: textStyle,
          ),
          onTap: () {
            //pushPage(context, SearchPage(), pageName: "SearchPage");
            ///关闭侧边栏
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 27.0,
          ),
          title: Text(
            '设置',
            style: textStyle,
          ),
          onTap: () {
            //pushPage(context, SearchPage(), pageName: "SearchPage");
            ///关闭侧边栏
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.book,
            size: 27.0,
          ),
          title: Text(
            'TODO',
            style: textStyle,
          ),
          onTap: () {
            //pushPage(context, SearchPage(), pageName: "SearchPage");
            ///关闭侧边栏
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
