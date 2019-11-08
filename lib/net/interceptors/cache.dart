import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_netease_cloud_music/config/config.dart';

class CacheObj {
  Response response;
  int timeStamp;

  CacheObj(this.response) : timeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  @override
  int get hashCode => response.realUri.hashCode;
}

class CacheInterceptor extends Interceptor{
  var cache = LinkedHashMap<String, CacheObj>();

  @override
  onRequest(RequestOptions options) async {
    if (!gloablConfig.enableHttpCache) {
      return options;
    }
  }
}