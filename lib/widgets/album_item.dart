import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 歌单，新专辑 封面组件
class AlbumItemWidget extends StatelessWidget {
  final String picUrl;
  final String text;
  final String subText;
  final String playCount;
  final int maxLines;
  final VoidCallback onTap;
  final int index;

  AlbumItemWidget({
    this.index,
    this.maxLines,
    this.onTap,
    this.picUrl,
    this.playCount,
    this.subText,
    this.text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        width: ScreenUtil().setWidth(200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            
          ],
        ),
      ),
    );
  }
}