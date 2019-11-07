import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/widgets/common_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyMusicPage extends StatefulWidget {
  @override
  _MyMusicPageState createState() => _MyMusicPageState();
}

class _MyMusicPageState extends State<MyMusicPage> {
  List<Map> menuList = [
    {'label': '本地音乐', 'image': 'assets/images/icon_music.png'},
    {'label': '最近播放', 'image': 'assets/images/icon_late_play.png'},
    {'label': '下载管理', 'image': 'assets/images/icon_download_black.png'},
    {'label': '我的电台', 'image': 'assets/images/icon_broadcast.png'},
    {'label': '我的收藏', 'image': 'assets/images/icon_collect.png'},
  ];

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[_buildMenuList()],
        ),
      );
  }

  Widget _buildMenuList() {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemCount: menuList.length,
      itemBuilder: (context, index) {
        var menu = menuList[index];
        return Container(
          height: ScreenUtil().setWidth(110),
          alignment: Alignment.center,
          child: Row(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(140),
                child: Align(
                  child: Image.asset(
                    menu['image'],
                    width: ScreenUtil().setWidth(100),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  menu['label'],
                  style: commonTextStyle,
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.grey,
          margin: EdgeInsets.only(left: ScreenUtil().setWidth(140)),
          height: ScreenUtil().setWidth(0.3),
        );
      },
    );
  }
}
