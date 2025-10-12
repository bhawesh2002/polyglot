import 'package:hive_ce_flutter/adapters.dart';
import 'package:polyglot/data/models/transcription_source.dart';
import 'package:polyglot/data/models/translation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transcription.freezed.dart';
part 'transcription.g.dart';

@freezed
@JsonSerializable()
class Transcription extends HiveObject with _$Transcription {
  Transcription({
    required this.id,
    required this.name,
    required this.source,
    this.transcription,
    this.translation,
  });

  @override
  final int id;
  @override
  final String name;
  @override
  final TranscriptionSource source;
  @override
  final Map<String, dynamic>? transcription;
  @override
  final List<Translation>? translation;

  factory Transcription.fromJson(Map<String, dynamic> json) =>
      _$TranscriptionFromJson(json);
  Map<String, Object?> toJson() => _$TranscriptionToJson(this);
}
