import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/pages/daily/daily_page.dart';
import 'package:flutter_netease_cloud_music/pages/home/home_page.dart';
import 'package:flutter_netease_cloud_music/pages/my_music/my_music_page.dart';
import 'package:flutter_netease_cloud_music/provider/app.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int currentIndex = 0;
  var currentPage;

  final List tabBodies = [
    HomePage(),
    MyMusicPage(),
    DailyPage(),
  ];

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('发现')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.add),
      title: Text('我的音乐')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.time),
      title: Text('动态')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.settings),
      title: Text('个人中心')
    )
  ];

  @override
  void initState() {
    currentPage = tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(builder: (context, model, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          brightness: Brightness.light,
          // title: ,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          items: bottomTabs,
          type: BottomNavigationBarType.fixed,
          currentIndex: model.currentTabIndex,
          onTap: (index) {
            model.changeTabIndex(index);
          },
        ),
        body: tabBodies[model.currentTabIndex],
      );
    });
  }
}