/**
 * 歌单详情页
 */
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_netease_cloud_music/pages/play_list/widget/play.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayListPage extends StatefulWidget {
  @override
  _PlayListPageState createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  final _controller = new PageController();

  static const _kCurve = Curves.ease;

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
      print('超过一半');
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = ScreenUtil().setWidth(750);
    List<Widget> ta = [
      Container(
        width: width,
        height: double.infinity,
        color: Colors.blue,
      ),
      PlayWidget(),
      Container(
        width: width,
        height: double.infinity,
        color: Colors.red,
      )
    ];

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        color: Colors.white,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Stack(children: <Widget>[
            PageView.builder(
              reverse: false,
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
              child: PlayController(controller: _controller),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: new Dots(
                  controller: _controller,
                  itemCount: ta.length,
                  maxZoom: 1.5,
                  onPageSelected: (int page) {
                    _controller.animateToPage(page,
                        duration: Duration(milliseconds: 100), curve: _kCurve);
                  },
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class Dots extends AnimatedWidget {
  final PageController controller;
  final int itemCount;
  final Color color;
  final ValueChanged<int> onPageSelected;
  final double dotSize;
  final double maxZoom;
  final double dotSpacing;

  Dots(
      {this.controller,
      this.itemCount,
      this.color: Colors.grey,
      this.onPageSelected,
      this.dotSize = 8.0,
      this.dotSpacing = 25.0,
      this.maxZoom = 2.0})
      : super(listenable: controller);

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(0.0,
          1.0 - ((controller.page ?? controller.initialPage) - index).abs()),
    );

    double zoom = 1.0 + (maxZoom - 1.0) * selectedness;
    // print(
    //     'buildDot, selectedness:  ${selectedness}, zoom: ${zoom}, index: ${index}');

    return Container(
      width: dotSpacing,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: Container(
            width: dotSize * zoom,
            height: dotSize * zoom,
            child: InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class PlayController extends AnimatedWidget {
  final PageController controller;
  // 两层的控制高度
  static double defaultControllerHeight = 140.0;
  static double defaultOtherControllerHeight = 100.0;

  PlayController({this.controller}) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    var currentPage = controller.page;
    if (currentPage > 1) {
      currentPage = 2 - currentPage;
    }

    double zoom = Curves.easeOut.transform(currentPage);

    // 播放菜单的高度
    var height = defaultControllerHeight * zoom;
    // 其他按钮的高度
    var otherControllerHeight = defaultOtherControllerHeight * zoom;

    if (controller.page < 1) {
      if (height < defaultControllerHeight) {
        height = defaultControllerHeight;
      }
    }

    if (currentPage == null) {
      height = 0;
    }

    print('PlayController... zoom: ${zoom}, currentPage: ${currentPage}');
    print('height ${height}, otherControllerHeight: ${otherControllerHeight}');

    return Container(
      height: height + otherControllerHeight,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    Icons.favorite_border,
                    size: 30,
                  ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.skip_previous,
                    size: 80,
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                  child: Icon(
                    Icons.play_arrow,
                    size: 100,
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                  child: Icon(
                    Icons.skip_next,
                    size: 80,
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                  child: Icon(
                    Icons.share,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: otherControllerHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    Icons.file_download,
                    size: 40,
                  ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.insert_comment,
                    size: 40,
                  ),
                  onTap: () {},
                ),
                GestureDetector(
                  child: Icon(
                    Icons.menu,
                    size: 40,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PlayOtherController extends AnimatedWidget {
  final PageController controller;

  PlayOtherController({this.controller}) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {}
}
