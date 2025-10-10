// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Translation _$TranslationFromJson(Map<String, dynamic> json) => _Translation(
  transcriptionId: (json['transcriptionId'] as num).toInt(),
  langCode: json['langCode'] as String,
  language: json['language'] as String,
  translatedData: json['translatedData'] as Map<String, dynamic>,
  size: (json['size'] as num).toDouble(),
);

Map<String, dynamic> _$TranslationToJson(_Translation instance) =>
    <String, dynamic>{
      'transcriptionId': instance.transcriptionId,
      'langCode': instance.langCode,
      'language': instance.language,
      'translatedData': instance.translatedData,
      'size': instance.size,
    };
