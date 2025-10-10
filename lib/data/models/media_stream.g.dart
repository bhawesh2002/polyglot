// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoStream _$VideoStreamFromJson(Map<String, dynamic> json) => VideoStream(
  index: (json['index'] as num).toInt(),
  codec: json['codec'] as String,
  codecLong: json['codecLong'] as String,
  codecType: json['codecType'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
  bitrate: (json['bitrate'] as num?)?.toDouble(),
  tags: json['tags'] as Map<String, dynamic>?,
  width: (json['width'] as num?)?.toInt(),
  height: (json['height'] as num?)?.toInt(),
  sampleAspectRatio: json['sampleAspectRatio'] as String?,
  displayAspectRatio: json['displayAspectRatio'] as String?,
  pixelFormat: json['pixelFormat'] as String?,
  frameRate: json['frameRate'] as String?,
  averageFrameRate: json['averageFrameRate'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$VideoStreamToJson(VideoStream instance) =>
    <String, dynamic>{
      'index': instance.index,
      'codec': instance.codec,
      'codecLong': instance.codecLong,
      'codecType': instance.codecType,
      'metadata': instance.metadata,
      'bitrate': instance.bitrate,
      'tags': instance.tags,
      'width': instance.width,
      'height': instance.height,
      'sampleAspectRatio': instance.sampleAspectRatio,
      'displayAspectRatio': instance.displayAspectRatio,
      'pixelFormat': instance.pixelFormat,
      'frameRate': instance.frameRate,
      'averageFrameRate': instance.averageFrameRate,
      'runtimeType': instance.$type,
    };

AudioStream _$AudioStreamFromJson(Map<String, dynamic> json) => AudioStream(
  index: (json['index'] as num).toInt(),
  codec: json['codec'] as String,
  codecLong: json['codecLong'] as String,
  codecType: json['codecType'] as String,
  metadata: json['metadata'] as Map<String, dynamic>,
  bitrate: (json['bitrate'] as num?)?.toDouble(),
  tags: json['tags'] as Map<String, dynamic>?,
  sampleFormat: json['sampleFormat'] as String?,
  sampleRate: json['sampleRate'] as String?,
  channelLayout: json['channelLayout'] as String?,
  channels: (json['channels'] as num?)?.toInt(),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$AudioStreamToJson(AudioStream instance) =>
    <String, dynamic>{
      'index': instance.index,
      'codec': instance.codec,
      'codecLong': instance.codecLong,
      'codecType': instance.codecType,
      'metadata': instance.metadata,
      'bitrate': instance.bitrate,
      'tags': instance.tags,
      'sampleFormat': instance.sampleFormat,
      'sampleRate': instance.sampleRate,
      'channelLayout': instance.channelLayout,
      'channels': instance.channels,
      'runtimeType': instance.$type,
    };
