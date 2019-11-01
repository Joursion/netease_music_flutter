import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {

  Header({this.count, this.tail, this.onTap});

  final int count;
  final Widget tail;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.vertical(
        top: Radius.circular(30)
      ),
      child: Container(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: SizedBox.fromSize(
            size: preferredSize,
            child: Row(
              children: <Widget>[
                MPlaceholder(height: 20,),
                Icon(
                  Icons.play_circle_outline,
                  size: ScreenUtil().setWidth(50),
                ),
                MPlaceholder(height: 20,),
                Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: Text("播放全部",),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.0),
                  child: count == null ? Container() : Text("(共 $count 首)"),
                ),
                Spacer(),
                tail ?? Container(),
              ],
            ),
          ),
        ),
      ),
    );
    
  }

  @override
  Size get preferredSize => Size.fromHeight(ScreenUtil().setWidth(100));

}