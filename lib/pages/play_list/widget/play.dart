import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/pages/play_list/widget/slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayWidget extends StatefulWidget {
  @override
  _PlayWidgetState createState() => _PlayWidgetState();
}

class _PlayWidgetState extends State<PlayWidget> {
  double value = 20.0;

  Widget _buildSlider() {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        inactiveTrackColor: Colors.transparent,
        activeTrackColor: Colors.red,
        valueIndicatorColor: Colors.black12,
        // t
        // overlayShape: SliderComponentShape(
        //   // pain
        // )
        // valueIndicatorShape:
        // valueIndicatorTextStyle:
      ),
      child: Material(
        color: Colors.deepOrange,
        child: Slider(
          value: value,
          label: '$value',
          min: 0.0,
          max: 100.0,
          onChanged: (val) {
            setState(() {
              value = val.floorToDouble();
            });
          }),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(500)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            color: Colors.blue,
            height: ScreenUtil().setWidth(650),
            width: ScreenUtil().setWidth(650),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/icon_logo.png',
                  width: ScreenUtil().setWidth(650),
                  height: ScreenUtil().setWidth(650),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 20,
                  child: _buildSlider(),
                )
              ],
            ),
          ),
          Column(
            children: <Widget>[
              Text(
                '知足',
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '五月天',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
