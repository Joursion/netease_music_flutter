import 'package:flutter/material.dart';

class CustomSliderWidget extends StatefulWidget {
  @override
  _CustomSliderWidgetState createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {
  double value = 20.0;
  
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        inactiveTrackColor: Colors.transparent,
        activeTrackColor: Colors.red,
        valueIndicatorColor: Colors.black12,
        // valueIndicatorShape:
        // valueIndicatorTextStyle:
      ),
      child: Material(
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
        ),
      );
  }
}