import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: '',
    home: MainPage(),
    theme: ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.indigo[500],
    ),
  ));
}

class MainPage extends StatelessWidget { // 意义不明的class
  @override
  Widget build(BuildContext context) {
    return MainPageStateful();
  }
}

class MainPageStateful extends StatefulWidget {
  @override
  _MainPageStatefulState createState() => new _MainPageStatefulState();
}

class _MainPageStatefulState extends State<MainPageStateful> {

  final List<String> _itemsBreakfast = ["Item1", "Item2", "Item3", "Item4"]; // 早餐菜谱占位符
  final List<double> _priceBreakfast = [0.5, 1.0, 1.5, 2.0]; // 早餐价格占位符，或许该把早餐新建一个class来存名字和价格
  double _totalForPage = 0.0; // 当前页面总计，好吧其实就只有一页

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('2020/07/01'), actions: <Widget>[ // 日期还是占位符
        IconButton(
          icon: Icon(
            Icons.date_range,
            color: Colors.black,
          ),
          tooltip: 'Date Selection',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CalenderPage()),
            );
          },
        ),
      ]),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
              child: Text(
                '食验',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.restaurant_menu),
              title: Text('订餐'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('收藏菜单'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),

      body: ListView(
        children: <Widget>[
          ListView.builder(
            padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: _itemsBreakfast.length + 1,
            itemBuilder: (context, i) {
              if (i == 0) return ListTile(title: Text("早餐", style: TextStyle(fontSize: 18.0)));

              return ListTile(
                title: Text(_itemsBreakfast[i - 1]),
                trailing: Icon(Icons.star_border, color: Colors.grey,),
                onTap: () {
                  setState(() {
                    _totalForPage += _priceBreakfast[i - 1]; // 将当前点击的项目价格添加到总计
                  });
                },
              );
            },
          ),
//          ListView.builder(
//
//          ),
//          ListView.builder(
//
//          )
        ],
      ),

      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton.extended(
            onPressed: () { // 脱机提交
              final snackBar = SnackBar(
                content: Text('提交成功'),
              );
              Scaffold.of(context).showSnackBar(snackBar);
            },
            label: Text('提交：总计¥$_totalForPage'),
            icon: Icon(Icons.save),
            backgroundColor: Theme.of(context).accentColor,
          );
        },
      ),
    );
  }
}

class CalenderPage extends StatelessWidget { // 占位符
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("日期选择"),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: RaisedButton(
              child: Text('SHOW A SNACKBAR'),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Have a snack!'),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}

class FavPage extends StatelessWidget { // 占位符
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏菜单"),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: RaisedButton(
              child: Text('SHOW A SNACKBAR'),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Have a snack!'),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}

class SettingsPage extends StatelessWidget { // 占位符
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: RaisedButton(
              child: Text('SHOW A SNACKBAR'),
              onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Have a snack!'),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}
