import 'package:polyglot/data/models/transcription_source.dart';
import 'package:polyglot/data/models/translation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transcription.freezed.dart';
part 'transcription.g.dart';

@freezed
abstract class Transcription with _$Transcription {
  const factory Transcription({
    required int id,
    required String name,
    required TranscriptionSource source,
    Map<String, dynamic>? transcription,
    List<Translation>? translation,
  }) = _Transcription;

  factory Transcription.fromJson(Map<String, dynamic> json) =>
      _$TranscriptionFromJson(json);
}
