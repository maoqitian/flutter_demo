import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

// StatelessWidget 无状态的widget
class MyApp extends StatelessWidget { //Stateless widgets是不可变的, 这意味着它们的属性不能改变 - 所有的值都是最终的.
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Welcome to Flutter',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
      ),
     home: new RandomWords(),
    );
  }
}

//StatefulWidget 有状态的widget
class RandomWords extends StatefulWidget{
  @override
  createState() => new RandomWordsState();
}

// 返回 显示单词对的ListView Widget
class RandomWordsState extends State<RandomWords> {
  //保存建议的单词对列表(变量以下划线（_）开头，在Dart语言中使用下划线前缀标识符，会强制其变成私有的)  final _suggestions = <WordPair>[];
  final List _suggestions = new List<WordPair>();
  //设置字体大小的变量
  final _biggerFont = const TextStyle(fontSize: 18.0);
  // 保存喜欢单词组的集合 set 集合不允许值重复
  final Set _saved = new Set<WordPair>();

  /// State 生命周期方法
  @override
  void initState() {
    // state 初始化
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // 在 initState 之后调用，此时可以获取其他 State
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // state 销毁
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //return new Text(new WordPair.random().asPascalCase);
    //返回单词对的ListView。
    return new Scaffold(
      appBar: new AppBar(
        title:new Center( //居中显示
          child: new Text('Flutter ListView'),
        ),
         // AppBar添加一个列表图标。当用户点击列表图标时，包含收藏夹的新路由页面入栈显示
        //actions: <Widget>[
          //new IconButton(icon: new Icon(Icons.format_list_bulleted), onPressed: _pushSaved),// onPressed 点击事件
        //],
      ),
      body: _buildSuggestions(),
    );
  }
  // 点击路由到 收藏单词列表页面
  void _pushSaved(){
    //建立一个路由并将其推入到导航管理器栈中。此操作会切换页面以显示新路由。
    Navigator.of(context).push(
      //新页面的内容在在MaterialPageRoute的builder属性中构建
      new MaterialPageRoute(builder: (context){
        final titles = _saved.map((pair){
          return new ListTile(
            title: new Text(
              pair.asPascalCase,
              style: _biggerFont,
            ),
          );
         },
        );
        final divided = ListTile.divideTiles(
            context: context,
            tiles: titles,
        ).toList();
        return new Scaffold(
          appBar: new AppBar(
            title: new Center(
              child: new Text("Saved Suggestions List"),
            ),
          ),
          body: new ListView(
            children: divided,
          ),
        );
       }
      ),
    );
  }


  //构建显示建议单词对的ListView。
  Widget _buildSuggestions(){
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。

        //itemBuilder 值是一个匿名回调函数， 接受两个参数- BuildContext和行迭代器i。迭代器从0开始，
        // 每调用一次该函数，i就会自增1，对于每个建议的单词对都会执行一次。该模型允许建议的单词对列表在用户滚动时无限增长。
          itemBuilder: (context,i){
          // 在每一列之前，添加一个1像素高的分隔线widget
          if(i.isOdd) return new Divider();
          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i~/2;
          
          if(index >= _suggestions.length){
            //如果是建议单词列表中最后一个单词对 接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index]);
        }
    );
  }
  //创建 ListTile中显示每个新词对
  Widget _buildRow(WordPair suggestion) {
    //获取是否保存了该单词状态
    final isSaved = _saved.contains(suggestion);

    return new ListTile(
      title: new Text(
        suggestion.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        //星型图标状态
        isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.deepOrange : null ,
      ),
      onTap: (){  // 当用户点击 ListTile 击时， ListTile 会调用它的onTap回调
        setState(() { //调用setState() 会为State对象触发build()方法，从而导致对UI的更新
          if(isSaved){
             _saved.remove(suggestion);
          }else{
            _saved.add(suggestion);
          }
        });
      },
    );
  }
}
