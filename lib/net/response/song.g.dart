// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongResponse _$SongResponseFromJson(Map<String, dynamic> json) {
  return SongResponse(
    songs: (json['songs'] as List)
        ?.map(
            (e) => e == null ? null : Song.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SongResponseToJson(SongResponse instance) =>
    <String, dynamic>{
      'songs': instance.songs,
    };

Song _$SongFromJson(Map<String, dynamic> json) {
  return Song();
}

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{};
