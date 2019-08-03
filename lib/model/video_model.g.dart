// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) {
  return VideoModel()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..likes = json['likes'] as int
    ..dislikes = json['dislikes'] as int;
}

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
    };
