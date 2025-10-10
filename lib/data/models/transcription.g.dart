// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Transcription _$TranscriptionFromJson(Map<String, dynamic> json) =>
    _Transcription(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      source: TranscriptionSource.fromJson(
        json['source'] as Map<String, dynamic>,
      ),
      transcription: json['transcription'] as Map<String, dynamic>?,
      translation: (json['translation'] as List<dynamic>?)
          ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TranscriptionToJson(_Transcription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'source': instance.source,
      'transcription': instance.transcription,
      'translation': instance.translation,
    };
