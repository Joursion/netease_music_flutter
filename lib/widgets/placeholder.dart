import 'package:flutter/widgets.dart';

class MPlaceholder extends StatelessWidget{
  MPlaceholder({this.width, this.height});

  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(""),
    );
  }
}