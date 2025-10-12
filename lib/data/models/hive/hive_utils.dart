import 'package:hive_ce_flutter/adapters.dart';
import 'package:polyglot/data/models/transcription.dart';
import 'package:polyglot/data/models/transcription_source.dart';

class HiveUtils {
  static const transcriptionBoxName = 'transcriptionBox';
  static const transcriptionSourceBoxName = 'transcriptionSourceBox';

  static bool _boxesOpened = false;
  static bool get boxesOpened => _boxesOpened;

  static Box<Transcription> get transcriptionBox =>
      Hive.box<Transcription>(transcriptionBoxName);
  static Box<TranscriptionSource> get transcriptionSourceBox =>
      Hive.box<TranscriptionSource>(transcriptionSourceBoxName);

  static Future<void> openBoxes({force = false}) async {
    if (_boxesOpened && !force) return;
    await Hive.openBox<Transcription>(transcriptionBoxName);
    await Hive.openBox<TranscriptionSource>(transcriptionSourceBoxName);
    _boxesOpened = true;
  }
}
