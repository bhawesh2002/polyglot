import 'package:hive_ce/hive.dart';
import 'package:polyglot/data/models/media_stream.dart';
import 'package:polyglot/data/models/transcription.dart';
import 'package:polyglot/data/models/transcription_source.dart';
import 'package:polyglot/data/models/translation.dart';
import 'package:polyglot/utils/enums.dart';

part 'hive_adaptors.g.dart';

@GenerateAdapters([
  AdapterSpec<Transcription>(),
  AdapterSpec<TranscriptionSource>(),
  AdapterSpec<TranscriptionSourceType>(),
  AdapterSpec<Translation>(),
  AdapterSpec<VideoStream>(),
  AdapterSpec<AudioStream>(),
])
class HiveAdaptors {}
