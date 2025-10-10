import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_stream.freezed.dart';
part 'media_stream.g.dart';

@freezed
abstract class MediaStream with _$MediaStream {
  const factory MediaStream.video({
    required int index,
    required String codec,
    required String codecLong,
    required String codecType,
    required Map<String, dynamic> metadata,
    String? bitrate,
    Map<String, dynamic>? tags,
    String? width,
    String? height,
    String? sampleAspectRatio,
    String? displayAspectRatio,
    String? pixelFormat,
    String? frameRate,
    String? averageFrameRate,
  }) = VideoStream;

  const factory MediaStream.audio({
    required int index,
    required String codec,
    required String codecLong,
    required String codecType,
    required Map<String, dynamic> metadata,
    String? bitrate,
    Map<String, dynamic>? tags,
    String? sampleFormat,
    String? sampleRate,
    String? channelLayout,
    String? channels,
  }) = AudioStream;

  factory MediaStream.fromJson(Map<String, dynamic> json) =>
      _$MediaStreamFromJson(json);
}
