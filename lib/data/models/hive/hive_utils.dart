import 'package:hive_ce_flutter/adapters.dart';

class HiveUtils {
  static const transcriptionBox = 'transcriptionBox';
  static const translationBox = 'translationBox';
  static const transcriptionSourceBox = 'transcriptionSourceBox';
  static const audioStreamBox = 'audioStreamBox';
  static const videoStreamBox = 'videoStreamBox';

  static bool _boxesOpened = false;
  static bool get boxesOpened => _boxesOpened;

  static Future<void> openBoxes({force = false}) async {
    if (_boxesOpened && !force) return;
    await Hive.openBox(transcriptionBox);
    await Hive.openBox(translationBox);
    await Hive.openBox(transcriptionSourceBox);
    await Hive.openBox(audioStreamBox);
    await Hive.openBox(videoStreamBox);
    _boxesOpened = true;
  }
}
