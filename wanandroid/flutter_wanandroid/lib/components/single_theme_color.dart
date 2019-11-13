/// Created with Android Studio.
/// User: maoqitian
/// Date: 2019/11/13 0013
/// email: maoqitian068@163.com
/// des:  主题颜色 圆形 + 文字 widget
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/utils/tool_utils.dart';


class SingleThemeColor extends StatelessWidget {

  final int themeColor;
  final String colorName;

  const SingleThemeColor({Key key,this.themeColor, this.colorName}):
        super(key:key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         ToolUtils.ShowToast(msg: "点击了颜色 "+colorName);
      },
      child: new Column( // 竖直布局
        children: <Widget>[
           Container(
             width: 50,
             height: 50,
             margin: const EdgeInsets.all(5.0),
             decoration: BoxDecoration( //圆形背景装饰
               borderRadius:BorderRadius.all(
                  Radius.circular(50)
               ),
               color: Color(this.themeColor)
             ),
           ),
           Text(
             colorName,
             style: TextStyle(
               color: Color(this.themeColor),
               fontSize: 14.0),
           ),
        ],
      ),
    );
  }
}

