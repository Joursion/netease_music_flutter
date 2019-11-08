import 'package:json_annotation/json_annotation.dart';

part 'song.g.dart';

@JsonSerializable()
class SongResponse {
  final List<Song> songs;

  SongResponse({
    this.songs
  });

  factory SongResponse.fromJson(Map<String, dynamic> json) => _$SongResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SongResponseToJson(this);
}

@JsonSerializable()
class Song {
  Song();
  factory Song.fromJson(Map<String, dynamic> json) => _$SongFromJson(json);
  Map<String, dynamic> toJson() => _$SongToJson(this);
}