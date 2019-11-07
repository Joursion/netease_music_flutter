/**
 * 排行榜页面
 */
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/net/api.dart';
import 'package:flutter_netease_cloud_music/net/response/rank.dart';
import 'package:flutter_netease_cloud_music/utils/navigator.dart';
import 'package:flutter_netease_cloud_music/widgets/common_text.dart';
import 'package:flutter_netease_cloud_music/widgets/future_build.dart';
import 'package:flutter_netease_cloud_music/widgets/rounded_net_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RankPage extends StatefulWidget {
  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('排行榜'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.red,
        textTheme: TextTheme(
            title: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
      body: CustomFutureBuilder<RankResponse>(
        futureFunc: API.getRank,
        builder: (context, data) {
          var list = data.list.where((l) => l.tracks.isNotEmpty).toList();
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(40),
                        top: ScreenUtil().setWidth(40)),
                    child: Text(
                      '官方榜',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setWidth(40),
                      left: ScreenUtil().setWidth(40)),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    var item = list[index];
                    var i = 1;
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        NavigatorUtil.gotoPlayListPage(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          // 左侧封面
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: <Widget>[
                              RoundedNetImage(
                                item.coverImgUrl,
                                height: 250,
                                width: 250,
                              ),
                              Positioned(
                                bottom: 5,
                                left: 10,
                                child: Text(
                                  item.updateFrequency,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              )
                            ],
                          ),
                          Container(
                            width: 10,
                          ),
                          // 右侧前三名
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: item.tracks.map((t) {
                                return Container(
                                  alignment: Alignment.centerLeft,
                                  height: ScreenUtil().setWidth(65),
                                  child: Text(
                                    '${i++}. ${t.first} - ${t.second}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: common13TextStyle,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Container(height: 20);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
