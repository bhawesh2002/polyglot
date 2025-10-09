import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_new/media_information.dart';
import 'package:logging/logging.dart';

class FfmpegService {
  final Logger _logger = Logger('FfmpegService');

  Future<MediaInformation?> getAssetInfo(String assetPath) async {
    try {
      final info = await FFprobeKit.getMediaInformation(assetPath);
      return info.getMediaInformation();
    } catch (e, stack) {
      _logger.severe(
          "getVideoMetadata(): Error while getting video metadata", e, stack);
    }
    return null;
  }

  List<String?>? getStreamCodecs(MediaInformation info) {
    try {
      final streams = info.getStreams();
      final codecs = streams.map((stream) => stream.getCodec()).toList();
      return codecs;
    } catch (e, stack) {
      _logger.severe(
          "getVideoMetadata(): Error while getting audio codec", e, stack);
    }
    return null;
  }

  String getCompatibleFormatForCodec(String audioCodec) {
    late final String outputExtension;
    switch (audioCodec.toLowerCase()) {
      case 'aac':
        outputExtension = '.m4a';
        break;
      case 'mp3':
        outputExtension = '.mp3';
        break;
      case 'opus':
        outputExtension = '.opus';
        break;
      default:
        outputExtension = '.mka';
        break;
    }
    return outputExtension;
  }

  Future<bool> extractAudioFromVideoToWav(String pathToVideo, String outputPath,
      {int? streamIndex = 0}) async {
    try {
      final String command =
          'ffmpeg -i $pathToVideo -map 0:a:$streamIndex -vn -c:a pcm_s16le -ar 16000 -ac 1 $outputPath.wav';
      final session = await FFmpegKit.execute(command);
      final returnCode = await session.getReturnCode();
      return returnCode?.isValueSuccess() ?? false;
    } catch (e, stack) {
      _logger.severe(
          "extractAudioFromVideo(): Error while extracting audio", e, stack);
    }
    return false;
  }

  Future<bool> extractAudioFromVideo(String pathToVideo, String outputPath,
      {int? streamIndex = 0, String? outputFormat = "mka"}) async {
    try {
      final String command =
          'ffmpeg -i $pathToVideo -map 0:a:$streamIndex -vn -c:a copy $outputPath.$outputFormat';
      final session = await FFmpegKit.execute(command);
      final returnCode = await session.getReturnCode();
      return returnCode?.isValueSuccess() ?? false;
    } catch (e, stack) {
      _logger.severe(
          "extractAudioFromVideo(): Error while extracting audio", e, stack);
    }
    return false;
  }
}
