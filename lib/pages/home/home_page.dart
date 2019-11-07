import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/net/api.dart';
import 'package:flutter_netease_cloud_music/net/response/album.dart';
import 'package:flutter_netease_cloud_music/net/response/banner.dart';
import 'package:flutter_netease_cloud_music/net/response/recommend.dart';
import 'package:flutter_netease_cloud_music/utils/navigator.dart';
import 'package:flutter_netease_cloud_music/widgets/banner.dart';
import 'package:flutter_netease_cloud_music/widgets/future_build.dart';
import 'package:flutter_netease_cloud_music/widgets/rounded_net_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(20),
            top: ScreenUtil().setWidth(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildBanner(),
            _buildCategoryList(),
            Text('为您推荐'),
            _buildRecommend(),
            Text('新碟推荐'),
            _buildNewAlbumList(),
          ],
        ),
      ),
    );
  }

  // 轮播图
  Widget _buildBanner() {
    return CustomFutureBuilder<BannerResponse>(
      futureFunc: API.getBanner,
      builder: (context, data) {
        var list = data.banners?.map((e) => e.imageUrl)?.toList();
        return BannerWidget(list);
      },
    );
  }

  // 分类
  Widget _buildCategoryList() {
    List<Map> categories = [
      {'name': '每日推荐', 'image': 'assets/images/icon_daily.png'},
      {'name': '歌单', 'image': 'assets/images/icon_playlist.png'},
      {'name': '排行榜', 'image': 'assets/images/icon_rank.png'},
      {'name': '电台', 'image': 'assets/images/icon_radio.png'},
    ];

    var width120 = ScreenUtil().setWidth(120);

    return SizedBox(
        width: ScreenUtil().setWidth(750),
        height: ScreenUtil().setWidth(200),
        child: ListView.builder(
          itemCount: categories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  //@TODO: 首页菜单跳转
                  switch (index) {
                    case 0:
                      NavigatorUtil.gotoDailyPage(context);
                      break;
                    case 2:
                      NavigatorUtil.gotoRankListPage(context);
                      break;
                  }
                },
                child: Column(
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: width120,
                          height: width120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width120/2),
                            border: Border.all(color: Colors.black12, width: 0.5),
                            gradient: RadialGradient(
                              colors: [
                                Color(0xFFFF8174),
                                Colors.red
                              ],
                              center: Alignment(-1.7, 0),
                              radius: 1
                            )
                          ),
                        ),
                        Image.asset(
                          categories[index]['image'],
                          width: width120,
                          height: width120,
                          color: Colors.white,
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              categories[index]['name'] == '每日推荐'
                                  ? '${DateUtil.formatDate(DateTime.now(), format: 'dd')}'
                                  : '',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Text(categories[index]['name'])
                  ],
                ));
          },
        ));
  }

  // 推荐歌单
  Widget _buildRecommend() {
    return CustomFutureBuilder<RecommendResponse>(
      futureFunc: API.getRecommend,
      builder: (context, data) {
        var list = data.recommend;
        return Container(
          height: ScreenUtil().setHeight(600),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 0.8),
            itemCount: list.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return RoundedNetImage(
                list[index].picUrl,
                width: 100,
                height: 100,
              );
            },
          ),
        );
      },
    );
    // return Container(
    //   height: ScreenUtil().setWidth(300),
    //   width: ScreenUtil().setHeight(300),
    //   // color: Colors.green,
    //   child: Image.network('http://timepenguin.17zhangda.tv/app/img/study/bg_login2_check.jpg?x-oss-process=image/quality,q_75', width: 100.0, height: 100.0,)
    // );
  }

  // 新专辑
  Widget _buildNewAlbumList() {
    return CustomFutureBuilder<AlbumListResponse>(
        futureFunc: API.getNewAlbum,
        builder: (context, data) {
          var list = data.albums;
          return Container(
              height: ScreenUtil().setHeight(200),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return RoundedNetImage(
                    list[index].picUrl,
                    radius: 10,
                    width: 200,
                    height: 200,
                  );
                },
              ));
        });
  }

  @override
  bool get wantKeepAlive => true;
}
