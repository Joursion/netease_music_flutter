import 'package:flutter/material.dart';
import 'package:flutter_netease_cloud_music/net/api.dart';
import 'package:flutter_netease_cloud_music/utils/utils.dart';
import 'package:flutter_netease_cloud_music/widgets/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    Future.delayed(Duration(milliseconds: 500), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(80),
              right: ScreenUtil().setWidth(80),
              top: ScreenUtil().setWidth(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/images/icon_logo.png',
                  width: ScreenUtil().setWidth(90),
                  height: ScreenUtil().setWidth(90),
                ),
              ),
              LoginAnimatedWidget(
                animation: _animation,
              ),
            ],
          ),
        ),
      ),
    );
  }



}

class LoginAnimatedWidget extends AnimatedWidget {
  final Tween<double> _opacity = Tween(begin: 0, end: 1);
  final Tween<double> _offset = Tween(begin: 40, end: 0);
  final Animation animation;

  LoginAnimatedWidget({@required this.animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity.evaluate(animation),
      child: Container(
        margin: EdgeInsets.only(top: _offset.evaluate(animation)),
        child: LoginWidget(),
      ),
    );
  }
}


class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      return Utils.showToast('请输入账号或密码');
    }
    API.loginByEmail(context, email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.red),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: Icon(
                Icons.email,
                color: Colors.grey,
              )
            ),
          ),
          TextField(
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.grey,
              )
            ),
          ),
          CustomButton(
            onPress: login,
            text: '登陆',
          )
        ],
      ),
    );
  }
}