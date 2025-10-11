import 'package:ffmpeg_kit_flutter_new/media_information.dart';
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
      fromJson: DurationConverter.fromFFmpegString,
      toJson: DurationConverter.toJSON,
    )
    required Duration duration,
    required String format,
    @JsonKey(
      fromJson: DurationConverter.fromFFmpegString,
      toJson: DurationConverter.toJSON,
    )
    @Default(Duration.zero)
    Duration startTime,
    String? formatLong,
    Map<String, dynamic>? tags,
    @Default([]) List<MediaStream> streams,
    double? bitrate,
    int? size,
    required Map<String, dynamic> metadata,
  }) = _TranscriptionSource;
  factory TranscriptionSource.fromJson(Map<String, dynamic> json) =>
      _$TranscriptionSourceFromJson(json);

  static TranscriptionSource fromMediaInformation(MediaInformation info) {
    Map<String, dynamic> mapToStringDynamic(Map<dynamic, dynamic>? m) =>
        (m ?? {}).map((k, v) => MapEntry(k.toString(), v));

    List<MediaStream> convertStreams() {
      return info
          .getStreams()
          .map<MediaStream>((s) {
            final props = s.getAllProperties();

            final index = (s.getIndex.call() ?? props?['index']) as dynamic;
            final indexInt = index is int
                ? index
                : (int.tryParse(index?.toString() ?? '') ?? 0);

            final codec =
                (s.getCodec.call() ?? props?['codec_name'])?.toString() ?? '';
            final codecLong =
                (s.getFullCodec.call() ?? props?['codec_long_name'])
                    ?.toString() ??
                '';
            final codecType =
                (s.getType.call() ?? props?['codec_type'])?.toString() ?? '';
            final metadata = mapToStringDynamic(props);

            final bitrate = double.tryParse(
              (s.getBitrate.call() ?? props?['bit_rate'] ?? props?['bitrate'])
                      ?.toString() ??
                  '',
            );

            final dynamic tagsValue = s.getTags.call() ?? props?['tags'];
            final Map<String, dynamic>? tags = tagsValue != null
                ? mapToStringDynamic(tagsValue as Map<dynamic, dynamic>)
                : null;

            if (codecType.toLowerCase() == 'video') {
              return MediaStream.video(
                index: indexInt,
                codec: codec,
                codecLong: codecLong,
                codecType: codecType,
                metadata: metadata,
                bitrate: bitrate,
                tags: tags,
                width: (s.getWidth.call() ?? props?['width']),
                height: (s.getHeight.call() ?? props?['height']),
                sampleAspectRatio:
                    (s.getSampleAspectRatio.call() ??
                            props?['sample_aspect_ratio'])
                        ?.toString(),
                displayAspectRatio:
                    (s.getDisplayAspectRatio.call() ??
                            props?['display_aspect_ratio'])
                        ?.toString(),
                frameRate: (s.getRealFrameRate.call() ?? props?['r_frame_rate'])
                    ?.toString(),
                averageFrameRate:
                    (s.getAverageFrameRate.call() ?? props?['avg_frame_rate'])
                        ?.toString(),
              );
            } else {
              return MediaStream.audio(
                index: indexInt,
                codec: codec,
                codecLong: codecLong,
                codecType: codecType,
                metadata: metadata,
                bitrate: bitrate,
                tags: tags,
                sampleFormat: (s.getSampleFormat.call() ?? props?['sample_fmt'])
                    ?.toString(),
                sampleRate: (s.getSampleRate.call() ?? props?['sample_rate']),
                channelLayout:
                    (s.getChannelLayout.call() ?? props?['channel_layout'])
                        ?.toString(),
              );
            }
          })
          .toList(growable: false);
    }

    final duration = DurationConverter.fromFFmpegString(
      info.getDuration() ?? '0',
    );
    final startTime = info.getStartTime() != null
        ? DurationConverter.fromFFmpegString(info.getStartTime()!)
        : Duration.zero;

    final tags = mapToStringDynamic(info.getTags());
    final metadata = mapToStringDynamic(info.getAllProperties());

    final streams = convertStreams();
    final hasVideo = streams.any((s) {
      return s is VideoStream &&
          s.codecType.toString().toLowerCase() == 'video';
    });

    return TranscriptionSource(
      type: hasVideo
          ? TranscriptionSourceType.video
          : TranscriptionSourceType.audio,
      name: info.getFilename()?.toString().split("/").last ?? '',
      path: info.getFilename()?.toString() ?? '',
      duration: duration,
      format: info.getFormat() ?? '',
      startTime: startTime,
      formatLong: info.getLongFormat(),
      tags: tags.isEmpty ? null : tags,
      streams: streams,
      bitrate: double.tryParse(info.getBitrate() ?? ''),
      size: int.tryParse(info.getSize() ?? ''),
      metadata: metadata,
    );
  }
}

extension TranscriptionSourceExtensions on TranscriptionSource {
  List<AudioStream> get audioStreams =>
      streams.whereType<AudioStream>().toList();
  List<VideoStream> get videoStreams =>
      streams.whereType<VideoStream>().toList();
}
