import 'package:flutter/material.dart';

class Song {
  int id;
  String name;
  String artists;
  String picUrl;

  Song({
    @required this.id,
    this.name = '',
    this.artists = '',
    this.picUrl = ''
  });
}