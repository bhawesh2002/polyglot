// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcription_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TranscriptionSource _$TranscriptionSourceFromJson(Map<String, dynamic> json) =>
    TranscriptionSource(
      json['id'] as String,
      $enumDecode(_$TranscriptionSourceTypeEnumMap, json['type']),
      json['name'] as String,
      json['path'] as String,
      json['extractedAudioPath'] as String?,
      DurationConverter.fromFFmpegString(json['duration'] as String),
      json['format'] as String,
      DurationConverter.fromFFmpegString(json['startTime'] as String),
      json['formatLong'] as String?,
      json['tags'] as Map<String, dynamic>?,
      (json['streams'] as List<dynamic>)
          .map((e) => MediaStream.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['bitrate'] as num?)?.toDouble(),
      (json['size'] as num?)?.toInt(),
      json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$TranscriptionSourceToJson(
  TranscriptionSource instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': _$TranscriptionSourceTypeEnumMap[instance.type]!,
  'name': instance.name,
  'path': instance.path,
  'extractedAudioPath': instance.extractedAudioPath,
  'duration': DurationConverter.toJSON(instance.duration),
  'format': instance.format,
  'startTime': DurationConverter.toJSON(instance.startTime),
  'formatLong': instance.formatLong,
  'tags': instance.tags,
  'streams': instance.streams,
  'bitrate': instance.bitrate,
  'size': instance.size,
  'metadata': instance.metadata,
};

const _$TranscriptionSourceTypeEnumMap = {
  TranscriptionSourceType.audio: 'audio',
  TranscriptionSourceType.video: 'video',
};
