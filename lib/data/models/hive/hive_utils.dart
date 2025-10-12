import 'package:hive_ce_flutter/adapters.dart';
import 'package:polyglot/data/models/media_stream.dart';
import 'package:polyglot/data/models/transcription.dart';
import 'package:polyglot/data/models/transcription_source.dart';
import 'package:polyglot/data/models/translation.dart';

class HiveUtils {
  static const transcriptionBoxName = 'transcriptionBox';
  static const translationBoxName = 'translationBox';
  static const transcriptionSourceBoxName = 'transcriptionSourceBox';
  static const audioStreamBoxName = 'audioStreamBox';
  static const videoStreamBoxName = 'videoStreamBox';

  static bool _boxesOpened = false;
  static bool get boxesOpened => _boxesOpened;

  static Box<Transcription> get transcriptionBox =>
      Hive.box<Transcription>(transcriptionBoxName);
  static Box<Translation> get translationBox =>
      Hive.box<Translation>(translationBoxName);
  static Box<TranscriptionSource> get transcriptionSourceBox =>
      Hive.box<TranscriptionSource>(transcriptionSourceBoxName);
  static Box<AudioStream> get audioStreamBox =>
      Hive.box<AudioStream>(audioStreamBoxName);
  static Box<VideoStream> get videoStreamBox =>
      Hive.box<VideoStream>(videoStreamBoxName);

  static Future<void> openBoxes({force = false}) async {
    if (_boxesOpened && !force) return;
    await Hive.openBox(transcriptionBoxName);
    await Hive.openBox(translationBoxName);
    await Hive.openBox(transcriptionSourceBoxName);
    await Hive.openBox(audioStreamBoxName);
    await Hive.openBox(videoStreamBoxName);
    _boxesOpened = true;
  }
}
