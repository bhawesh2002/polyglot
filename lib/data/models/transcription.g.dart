// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transcription _$TranscriptionFromJson(Map<String, dynamic> json) =>
    Transcription(
      json['id'] as String,
      json['name'] as String,
      TranscriptionSource.fromJson(json['source'] as Map<String, dynamic>),
      json['transcription'] as Map<String, dynamic>?,
      (json['translation'] as List<dynamic>?)
          ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TranscriptionToJson(Transcription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'source': instance.source,
      'transcription': instance.transcription,
      'translation': instance.translation,
    };
