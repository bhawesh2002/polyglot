// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adaptors.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class TranscriptionAdapter extends TypeAdapter<Transcription> {
  @override
  final typeId = 0;

  @override
  Transcription read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transcription(
      id: (fields[0] as num).toInt(),
      name: fields[1] as String,
      source: fields[2] as TranscriptionSource,
      transcription: (fields[3] as Map?)?.cast<String, dynamic>(),
      translation: (fields[4] as List?)?.cast<Translation>(),
    );
  }

  @override
  void write(BinaryWriter writer, Transcription obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.source)
      ..writeByte(3)
      ..write(obj.transcription)
      ..writeByte(4)
      ..write(obj.translation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranscriptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TranscriptionSourceAdapter extends TypeAdapter<TranscriptionSource> {
  @override
  final typeId = 1;

  @override
  TranscriptionSource read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TranscriptionSource(
      type: fields[0] as TranscriptionSourceType,
      name: fields[1] as String,
      path: fields[2] as String,
      extractedAudioPath: fields[3] as String?,
      duration: fields[4] as Duration,
      format: fields[5] as String,
      startTime: fields[6] == null ? Duration.zero : fields[6] as Duration,
      formatLong: fields[7] as String?,
      tags: (fields[8] as Map?)?.cast<String, dynamic>(),
      streams: fields[9] == null ? [] : (fields[9] as List).cast<MediaStream>(),
      bitrate: (fields[10] as num?)?.toDouble(),
      size: (fields[11] as num?)?.toInt(),
      metadata: (fields[12] as Map).cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, TranscriptionSource obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.path)
      ..writeByte(3)
      ..write(obj.extractedAudioPath)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.format)
      ..writeByte(6)
      ..write(obj.startTime)
      ..writeByte(7)
      ..write(obj.formatLong)
      ..writeByte(8)
      ..write(obj.tags)
      ..writeByte(9)
      ..write(obj.streams)
      ..writeByte(10)
      ..write(obj.bitrate)
      ..writeByte(11)
      ..write(obj.size)
      ..writeByte(12)
      ..write(obj.metadata);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranscriptionSourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TranslationAdapter extends TypeAdapter<Translation> {
  @override
  final typeId = 2;

  @override
  Translation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Translation(
      transcriptionId: (fields[0] as num).toInt(),
      langCode: fields[1] as String,
      language: fields[2] as String,
      translatedData: (fields[3] as Map).cast<String, dynamic>(),
      size: (fields[4] as num).toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, Translation obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.transcriptionId)
      ..writeByte(1)
      ..write(obj.langCode)
      ..writeByte(2)
      ..write(obj.language)
      ..writeByte(3)
      ..write(obj.translatedData)
      ..writeByte(4)
      ..write(obj.size);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VideoStreamAdapter extends TypeAdapter<VideoStream> {
  @override
  final typeId = 3;

  @override
  VideoStream read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VideoStream(
      index: (fields[0] as num).toInt(),
      codec: fields[1] as String,
      codecLong: fields[2] as String,
      codecType: fields[3] as String,
      metadata: (fields[13] as Map).cast<String, dynamic>(),
      bitrate: (fields[4] as num?)?.toDouble(),
      tags: (fields[14] as Map?)?.cast<String, dynamic>(),
      width: (fields[5] as num?)?.toInt(),
      height: (fields[6] as num?)?.toInt(),
      sampleAspectRatio: fields[7] as String?,
      displayAspectRatio: fields[8] as String?,
      pixelFormat: fields[9] as String?,
      frameRate: fields[10] as String?,
      averageFrameRate: fields[11] as String?,
      $type: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VideoStream obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.codec)
      ..writeByte(2)
      ..write(obj.codecLong)
      ..writeByte(3)
      ..write(obj.codecType)
      ..writeByte(4)
      ..write(obj.bitrate)
      ..writeByte(5)
      ..write(obj.width)
      ..writeByte(6)
      ..write(obj.height)
      ..writeByte(7)
      ..write(obj.sampleAspectRatio)
      ..writeByte(8)
      ..write(obj.displayAspectRatio)
      ..writeByte(9)
      ..write(obj.pixelFormat)
      ..writeByte(10)
      ..write(obj.frameRate)
      ..writeByte(11)
      ..write(obj.averageFrameRate)
      ..writeByte(12)
      ..write(obj.$type)
      ..writeByte(13)
      ..write(obj.metadata)
      ..writeByte(14)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoStreamAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AudioStreamAdapter extends TypeAdapter<AudioStream> {
  @override
  final typeId = 4;

  @override
  AudioStream read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AudioStream(
      index: (fields[0] as num).toInt(),
      codec: fields[1] as String,
      codecLong: fields[2] as String,
      codecType: fields[3] as String,
      metadata: (fields[10] as Map).cast<String, dynamic>(),
      bitrate: (fields[4] as num?)?.toDouble(),
      tags: (fields[11] as Map?)?.cast<String, dynamic>(),
      sampleFormat: fields[5] as String?,
      sampleRate: fields[6] as String?,
      channelLayout: fields[7] as String?,
      channels: (fields[8] as num?)?.toInt(),
      $type: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AudioStream obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.codec)
      ..writeByte(2)
      ..write(obj.codecLong)
      ..writeByte(3)
      ..write(obj.codecType)
      ..writeByte(4)
      ..write(obj.bitrate)
      ..writeByte(5)
      ..write(obj.sampleFormat)
      ..writeByte(6)
      ..write(obj.sampleRate)
      ..writeByte(7)
      ..write(obj.channelLayout)
      ..writeByte(8)
      ..write(obj.channels)
      ..writeByte(9)
      ..write(obj.$type)
      ..writeByte(10)
      ..write(obj.metadata)
      ..writeByte(11)
      ..write(obj.tags);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudioStreamAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TranscriptionSourceTypeAdapter
    extends TypeAdapter<TranscriptionSourceType> {
  @override
  final typeId = 5;

  @override
  TranscriptionSourceType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TranscriptionSourceType.audio;
      case 1:
        return TranscriptionSourceType.video;
      default:
        return TranscriptionSourceType.audio;
    }
  }

  @override
  void write(BinaryWriter writer, TranscriptionSourceType obj) {
    switch (obj) {
      case TranscriptionSourceType.audio:
        writer.writeByte(0);
      case TranscriptionSourceType.video:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranscriptionSourceTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
