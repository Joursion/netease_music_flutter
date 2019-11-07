import 'dart:io';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_netease_cloud_music/net/response/album.dart';
import 'package:flutter_netease_cloud_music/net/response/banner.dart';
import 'package:flutter_netease_cloud_music/net/response/daily.dart';
import 'package:flutter_netease_cloud_music/net/response/login.dart';
import 'package:flutter_netease_cloud_music/net/response/rank.dart';
import 'package:flutter_netease_cloud_music/net/response/recommend.dart';
import 'package:flutter_netease_cloud_music/utils/db.dart';
import 'package:flutter_netease_cloud_music/utils/navigator.dart';
import 'package:flutter_netease_cloud_music/utils/utils.dart';
import 'package:flutter_netease_cloud_music/widgets/loading.dart';
import 'package:path_provider/path_provider.dart';

class API {
  static Dio _dio;
  static final String baseUrl = 'http://111.231.83.108:3000/';

  static void init() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;

    CookieJar cj = PersistCookieJar(dir: tempPath);
    _dio = Dio(BaseOptions(baseUrl: baseUrl, followRedirects: false))
      ..interceptors.add(CookieManager(cj));
    // ..interceptors.add()
  }

  static Future<Response> _request(BuildContext context, String url,
      {Map<String, dynamic> params, bool isShowLoading = true, String method = 'get'}) async {
    // if (isShowLoading) Loading.showLoading(context);
    try {
      if (method == 'post') {
        var data = await _dio.post(url, queryParameters: params);
        return Future.value(data);
      }

      var data = await _dio.get(url, queryParameters: params);
      return Future.value(data);
    } on DioError catch (e) {
      if (e == null) {
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          reLogin();
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error(Response(data: -1));
      }
    } finally {
      Loading.hideLoading(context);
    }
  }

  static Future<Response> _get(BuildContext context, String url,
      {Map<String, dynamic> params, bool isShowLoading = true}) async {
    return _request(context, url, params: params, isShowLoading: isShowLoading, method: 'get');
  }

  static Future<Response> _post(BuildContext context, String url,
      {Map<String, dynamic> params, bool isShowLoading = true}) async {
        return _request(context, url, params: params, isShowLoading: isShowLoading, method: 'post');
  }

  static void reLogin() {
    Future.delayed(Duration(milliseconds: 200), () {
      // Application
      // Application.router.pop(Routes)
    });
  }

  // 获取 Bnnaer
  static Future<BannerResponse> getBanner(BuildContext context) async {
    var response = await _get(context, '/banner');
    return BannerResponse.fromJson(response.data);
  }

  // 获取推荐
  static Future<RecommendResponse> getRecommend(BuildContext context) async {
    var res = await  _get(context, '/recommend/resource');
    print('getRecommend ${res}');
    return RecommendResponse.fromJson(res.data);
  }

  // 新碟上架
  static Future<AlbumListResponse> getNewAlbum (BuildContext context,{ Map<String, dynamic> params = const {
    'offset': 1,
    'limit': 10,
  }}) async {
    var res = await _get(context, '/top/album', params: params);
    return AlbumListResponse.fromJson(res.data);
  }

  static Future<DailyResponse> getDaily (BuildContext context) async {
    var response = await _get(context, "/recommend/songs");
    return DailyResponse.fromJson(response.data);
  }

  static void loginByEmail(BuildContext context, String email, String password) async {
    var response = await _post(context, '/login', params: {'email': email, 'password': password});
    var data = LoginResponse.fromJson(response.data);
    if (data.code > 299) {
      return Utils.showToast(data.msg ?? '登陆失败，请检查账号密码');
    }
    Utils.showToast('登陆成功');
    DBUtil.saveUser(data.profile);
    NavigatorUtil.gotoHomePage(context);
  }

  static Future<LoginResponse> loginByMobile(BuildContext context, String phone, String password) async {
    var response = await _post(context, '/login/cellphone', params: {'phone': phone, 'password': password});
    return LoginResponse.fromJson(response.data);
  }

  static Future<RankResponse> getRank (BuildContext context) async {
    var response = await _get(context, '/toplist/detail');
    print('getRank....');
    return RankResponse.fromJson(response.data);
  }

  // static Future<T> request(String path, )
}
