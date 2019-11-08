import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/provider/player.dart';

class LyricWidget extends StatefulWidget {
  final PlayerProvider state;

  LyricWidget(this.state);

  @override
  _LyricWidgetState createState() => _LyricWidgetState();
}

class _LyricWidgetState extends State<LyricWidget> with TickerProviderStateMixin {
  int currentSongId;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((call) {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
