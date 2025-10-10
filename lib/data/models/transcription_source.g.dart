// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcription_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TranscriptionSource _$TranscriptionSourceFromJson(Map<String, dynamic> json) =>
    _TranscriptionSource(
      type: $enumDecode(_$TranscriptionSourceTypeEnumMap, json['type']),
      name: json['name'] as String,
      path: json['path'] as String,
      duration: DurationConverter.fromFFmpegString(json['duration'] as String),
      format: json['format'] as String,
      startTime: json['startTime'] == null
          ? Duration.zero
          : DurationConverter.fromFFmpegString(json['startTime'] as String),
      formatLong: json['formatLong'] as String?,
      tags: json['tags'] as Map<String, dynamic>?,
      streams:
          (json['streams'] as List<dynamic>?)
              ?.map((e) => MediaStream.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      bitrate: (json['bitrate'] as num?)?.toDouble(),
      size: (json['size'] as num?)?.toInt(),
      metadata: json['metadata'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$TranscriptionSourceToJson(
  _TranscriptionSource instance,
) => <String, dynamic>{
  'type': _$TranscriptionSourceTypeEnumMap[instance.type]!,
  'name': instance.name,
  'path': instance.path,
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
