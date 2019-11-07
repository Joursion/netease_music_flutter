import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _controller;
  Tween _tween;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _tween = Tween(begin: 0, end: 1);
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..drive(_tween);

    Future.delayed(Duration(milliseconds: 500), () {
      _controller.forward();
    });

    _curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(Duration(microseconds: 500), () {
          goPage();
        });
      }
    });
  }

  void goPage() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ScaleTransition(
          scale: _curvedAnimation,
          child: Hero(
            tag: 'logo',
            child: Image.asset(
              'assets/images/icon_logo.png'
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}