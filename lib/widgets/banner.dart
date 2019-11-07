import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerWidget extends StatefulWidget {
  final List<String> images;
  final double height;
  final ValueChanged<int> onTap;
  final Curve curve;

  BannerWidget(
    this.images, {
      this.height = 200,
      this.onTap,
      this.curve = Curves.linear
    }
  ): assert(images != null);

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  PageController _pageController;
  int _currentIndex;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _pageController = PageController(initialPage: _currentIndex);
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _buildPageView(),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() {
    var length = widget.images.length;
    return Positioned(
      bottom: 10,
      child: Row(
        children: widget.images.map((s) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: ClipOval(
              child: Container(
                width: ScreenUtil().setWidth(12),
                height: ScreenUtil().setWidth(12),
                color: s == widget.images[_currentIndex % length] ? Colors.red : Colors.grey,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPageView() {
    var length = widget.images.length;
    var width15 = ScreenUtil().setWidth(15);
    return AspectRatio(
      aspectRatio: (1080 + (width15 * 2)) / (400 - (width15)),
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          if (index == 0) {
            _currentIndex = length;
            _changePage();
          }
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onPanDown: (details) {
              _cancelTimer();
            },
            onTap: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("当前的page 为"),
                duration: Duration(milliseconds: 500)
              ));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width15),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(width15)),
                child: Utils.showNetImage(
                  widget.images[index % length],
                  fit: BoxFit.fitWidth
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

  _initTimer() {
    if (_timer == null) {
      if (mounted) {
        _timer = Timer.periodic(Duration(seconds: 3), (t) {
          _currentIndex ++;
          _pageController.animateToPage(
            _currentIndex,
            duration: Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        });
      }
    }
  }

  _cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
      _initTimer();
    }
  }

  _changePage() {
    Timer(Duration(milliseconds: 350), () {
      _pageController.jumpToPage(_currentIndex);
    });
  }
}