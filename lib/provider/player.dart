/**
 * 播放相关的 Provider
 */
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerProvider with ChangeNotifier {
  AudioPlayer _player = AudioPlayer();
  AudioPlayerState _playerState;
  Duration _duration;


  void init() {
    _player.setReleaseMode(ReleaseMode.STOP);

    _player.onPlayerStateChanged.listen((state){
      _playerState = state;

    });

    _player.onDurationChanged.listen((d) {
      _duration = d;
    });

  }

  void play() {
  }

  @override
  void dispose() {
    super.dispose();
    _player.dispose();

  }
}