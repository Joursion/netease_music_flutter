import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            leading: Container(),
            expandedHeight: 230,
            elevation: 0,
            forceElevated: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('我的'),
              
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
            ),
            // bottom: CustomTabBar(tabs: <Widget>[
            //   Tab(text: '音乐',),
            //   Tab(text: '动态',)
            // ],),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: '音乐',),
                Tab(text: '动态',),
              ],
              controller: TabController(length: 2, vsync: this),
            ),
          )
        ],
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;

  CustomTabBar({Key key, @required this.tabs}) : super(key: key);

  // TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        child: Material(
          child: TabBar(
            // controller: _tabController,
            tabs: tabs,
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}
