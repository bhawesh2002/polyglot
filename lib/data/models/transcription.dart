import 'package:polyglot/data/models/hive/hive_utils.dart';
import 'package:polyglot/data/models/transcription_source.dart';
import 'package:polyglot/data/models/translation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'transcription.freezed.dart';
part 'transcription.g.dart';

@freezed
@JsonSerializable()
class Transcription extends HiveUtils with _$Transcription {
  Transcription(
    this.id,
    this.name,
    this.source,
    this.transcription,
    this.translation,
  );

  factory Transcription.create({
    required String name,
    required TranscriptionSource source,
    Map<String, dynamic>? transcription,
    List<Translation>? translation,
  }) => Transcription(Uuid().v4(), name, source, transcription, translation);

  @override
  final String id;
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

  Future<void> deleteMe() async {
    return await super.delete(id: id);
  }

  Future<void> storeMe() async {
    return await super.store(this, id);
  }
}
