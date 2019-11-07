/**
 * 歌单详情页
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayListPage extends StatefulWidget {
  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  ScrollController _controller = new ScrollController();

  void startAnimation(ScrollMetrics metrics) {
    // 只监听水平滚动
    if (metrics.axis == Axis.vertical) {
      return;
    }
    var viewportDimension = metrics.viewportDimension;
    var pixels = metrics.pixels;
    var offsetNum = (pixels ~/ viewportDimension);
    var offset = pixels % viewportDimension;
    // 滚动超过一半
    if (offset > (pixels / 2)) {

    }
  }

  @override
  Widget build(BuildContext context) {
    var width = ScreenUtil().setWidth(750);
    List<Widget> ta = [
      Container(
        width: width,
        height: double.infinity,
        color: Colors.green,
      ),
      Container(
        width: width,
        height: double.infinity,
        color: Colors.blue,
      ),
      Container(
        width: width,
        height: double.infinity,
        color: Colors.red,
      )
    ];
    return Container(
        child: NotificationListener<ScrollNotification> (
          onNotification: (ScrollNotification notification) {
            ScrollMetrics metrics = notification.metrics;
            print('当前位置: ${metrics.pixels}');// 当前位置
            print(metrics.atEdge);//是否在顶部或底部
            print(metrics.axis);//垂直或水平滚动
            print(metrics.axisDirection);// 滚动方向是down还是up
            print(metrics.extentAfter);//视口底部距离列表底部有多大
            print(metrics.extentBefore);//视口顶部距离列表顶部有多大
            print(metrics.extentInside);//视口范围内的列表长度
            print('max:  ${metrics.maxScrollExtent}');//最大滚动距离，列表长度-视口长度
            print(metrics.minScrollExtent);//最小滚动距离
            print(metrics.viewportDimension);//视口长度
            print(metrics.outOfRange);//是否越过边界
          },
          child: Stack(
          children: <Widget>[
            ListView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemCount: ta.length,
              itemBuilder: (context, index) {
                return ta[index];
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 300,
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Text('上一首'),
                    Text('暂停'),
                    Text('下一首'),
                  ],
                ),
              ),
            )
          ],
        ))
     );
  }
}
