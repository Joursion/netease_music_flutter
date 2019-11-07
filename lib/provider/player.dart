import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerProvider with ChangeNotifier {
  AudioPlayer _player = AudioPlayer();
  AudioPlayerState _playerState;

  void init() {

  }
}