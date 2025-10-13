import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:polyglot/data/models/transcription.dart';
import 'package:polyglot/data/models/transcription_source.dart';

abstract class HiveUtils {
  static const transcriptionBoxName = 'transcriptionBox';
  static const transcriptionSourceBoxName = 'transcriptionSourceBox';

  static bool _boxesOpened = false;
  static bool get boxesOpened => _boxesOpened;

  static final Map<Type, Box> _openedBoxMap = HashMap();
  static Map<Type, Box> get openedBoxMap => _openedBoxMap;

  static Box<Transcription> get transcriptionBox =>
      Hive.box<Transcription>(transcriptionBoxName);
  static Box<TranscriptionSource> get transcriptionSourceBox =>
      Hive.box<TranscriptionSource>(transcriptionSourceBoxName);

  static Future<void> openBoxes({bool force = false}) async {
    if (_boxesOpened && !force) return;
    final box1 = await Hive.openBox<Transcription>(transcriptionBoxName);
    _openedBoxMap[Transcription] = box1;
    final box2 = await Hive.openBox<TranscriptionSource>(
      transcriptionSourceBoxName,
    );
    _openedBoxMap[TranscriptionSource] = box2;

    _boxesOpened = true;
  }

  static Box<T>? getBox<T>() {
    if (!_openedBoxMap.containsKey(T)) return null;
    return _openedBoxMap[T] as Box<T>;
  }

  /// specify [keys] to listen to specific value(s)
  /// stored in the box
  static ValueListenable<Box<T>>? getBoxListener<T>({List<String>? keys}) =>
      HiveUtils.getBox<T>()?.listenable(keys: keys);

  Future<void> store<T>(obj, String key) async {
    final box = HiveUtils.getBox<T>();
    await box?.put(obj.id, obj);
  }

  Future<void> delete<T>({String? id}) async {
    final box = HiveUtils.getBox<T>();
    await box?.delete(id);
  }
}
