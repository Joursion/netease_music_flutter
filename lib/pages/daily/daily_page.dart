import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/widgets/play_list_header.dart';

class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        PlayListHeader(),
        // Container(
        //   height: 1000,
        //   color: Colors.white,
        //   child: Column(
        //     children: <Widget>[
        //       Text.rich(TextSpan(
        //         children: [
        //           TextSpan(
        //             text: 'home：'
        //           ),
        //           TextSpan(
        //             text: 'test'
        //           )
        //         ]
        //       ))
        //     ],
        //   ),
        // )
      ],
    );
  }
}