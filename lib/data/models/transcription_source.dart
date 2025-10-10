import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:polyglot/data/models/converters/duration_converter.dart';
import 'package:polyglot/data/models/media_stream.dart';
import 'package:polyglot/utils/enums.dart';

part 'transcription_source.freezed.dart';
part 'transcription_source.g.dart';

@freezed
abstract class TranscriptionSource with _$TranscriptionSource {
  const factory TranscriptionSource({
    required TranscriptionSourceType type,
    required String name,
    required String path,
    @JsonKey(
      fromJson: DurationConverter.fromJSON,
      toJson: DurationConverter.toJSON,
    )
    required Duration duration,
    required String format,
    @JsonKey(
      fromJson: DurationConverter.fromJSON,
      toJson: DurationConverter.toJSON,
    )
    @Default(Duration.zero)
    Duration startTime,
    String? formatLong,
    Map<String, dynamic>? tags,
    @Default([]) List<MediaStream> streams,
    String? bitrate,
    String? size,
    required Map<String, dynamic> metadata,
  }) = _TranscriptionSource;
  factory TranscriptionSource.fromJson(Map<String, dynamic> json) =>
      _$TranscriptionSourceFromJson(json);
}
