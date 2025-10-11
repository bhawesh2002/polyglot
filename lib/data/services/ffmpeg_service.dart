import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_new/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter_new/media_information.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

class FfmpegService {
  final Logger _logger = Logger('FfmpegService');

  Future<MediaInformation?> getAssetInfo(String assetPath) async {
    try {
      final info = await FFprobeKit.getMediaInformation(assetPath);
      return info.getMediaInformation();
    } catch (e, stack) {
      _logger.severe(
        "getVideoMetadata(): Error while getting video metadata",
        e,
        stack,
      );
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
        "getVideoMetadata(): Error while getting audio codec",
        e,
        stack,
      );
    }
    return null;
  }

  Map<String, dynamic> getMediaStreams(MediaInformation info) {
    final Map<String, dynamic> streamsMap = {};
    try {
      final streams = info.getStreams();
      final videoStream = streams.where((s) => s.getType() == 'video').toList();
      final audioStream = streams.where((s) => s.getType() == 'audio').toList();
      streamsMap.addAll({'video': videoStream, 'audio': audioStream});
    } catch (e, stack) {
      _logger.severe("getMediaStreams(): Error while getting audio", e, stack);
    }
    return streamsMap;
  }

  List<String?>? getStreamCodecTypes(MediaInformation info) {
    try {
      final streams = info.getStreams();
      final codecs = streams.map((stream) => stream.getType()).toList();
      return codecs;
    } catch (e, stack) {
      _logger.severe(
        "getVideoMetadata(): Error while getting audio codec",
        e,
        stack,
      );
    }
    return null;
  }

  String? classifyMediaFile(String filePath, MediaInformation mediaInfo) {
    final String extension = p.extension(filePath).toLowerCase();
    const audioExtensions = {'.mp3', '.wav', '.m4a', '.aac', '.flac', '.ogg'};

    if (audioExtensions.contains(extension)) return "audio";

    try {
      final videoStream = mediaInfo
          .getStreams()
          .where((s) => s.getType()?.toLowerCase() == 'video')
          .firstOrNull;

      if (videoStream == null) return "audio";

      final props = videoStream.getAllProperties();
      final codecName = videoStream.getCodec()?.toLowerCase() ?? '';
      const imageCodecs = {'png', 'mjpeg', 'jpg', 'jpeg'};

      if (imageCodecs.contains(codecName)) return "audio";

      final frameCountStr = props?['nb_frames']?.toString();
      final frameCount = int.tryParse(frameCountStr ?? '0') ?? 0;

      final avgFrameRate = props?['avg_frame_rate']?.toString();

      if (frameCount > 1 && avgFrameRate != '0/0') {
        return "video";
      } else {
        return "audio";
      }
    } catch (e) {
      return null;
    }
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

  Future<bool> extractAudioAsWav(
    String assetPath,
    String outputPath, {
    int? streamIndex =
        0, //index of the audio stream. Passed as '-map 0:a:$streamIndex'
  }) async {
    try {
      streamIndex ??= 0;
      _logger.info("Extracing audio from asset: $assetPath");
      final session = await FFmpegKit.executeWithArguments([
        '-i',
        assetPath,
        '-map',
        '0:a:$streamIndex',
        '-vn',
        '-c:a',
        'pcm_s16le',
        '-ar',
        '16000',
        '-ac',
        '1',
        '-f',
        'wav',
        outputPath,
      ]);

      final returnCode = await session.getReturnCode();

      if (returnCode?.isValueSuccess() == false) {
        final logs = (await session.getAllLogs())
            .map((log) => log.getMessage())
            .toList();
        _logger.fine("Error in session. Got session Logs: $logs");
      } else {
        _logger.info("Audio extraction successful${await session.getOutput()}");
      }

      return returnCode?.isValueSuccess() ?? false;
    } catch (e, stack) {
      _logger.severe(
        "extractAudioAsWav(): Error while extracting audio",
        e,
        stack,
      );
    }
    return false;
  }

  Future<bool> extractAudio(
    String assetPath,
    String outputPath, {
    int? streamIndex =
        0, //index of the audio stream. Passed as '-map 0:a:$streamIndex'
    String? outputFormat = "mka",
  }) async {
    try {
      streamIndex ??= 0;
      outputFormat ??= "mka";
      final session = await FFmpegKit.executeWithArguments([
        '-i',
        assetPath,
        '-map',
        '0:a:$streamIndex',
        '-vn',
        '-c:a',
        'pcm_s16le',
        '-ar',
        '16000',
        '-ac',
        '1',
        '-f',
        outputFormat,
        outputPath,
      ]);
      final returnCode = await session.getReturnCode();

      if (returnCode?.isValueSuccess() == false) {
        final logs = (await session.getAllLogs())
            .map((log) => log.getMessage())
            .toList();
        _logger.fine("Error in session. Got session Logs: $logs");
      } else {
        _logger.info("Audio extraction successful${await session.getOutput()}");
      }

      return returnCode?.isValueSuccess() ?? false;
    } catch (e, stack) {
      _logger.severe("extractAudio(): Error while extracting audio", e, stack);
    }
    return false;
  }
}
