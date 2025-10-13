// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transcription_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TranscriptionSource {

 String get id; TranscriptionSourceType get type; String get name; String get path; String? get extractedAudioPath; Duration get duration; String get format; Duration get startTime; String? get formatLong; Map<String, dynamic>? get tags; List<MediaStream> get streams; double? get bitrate; int? get size; Map<String, dynamic> get metadata;
/// Create a copy of TranscriptionSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranscriptionSourceCopyWith<TranscriptionSource> get copyWith => _$TranscriptionSourceCopyWithImpl<TranscriptionSource>(this as TranscriptionSource, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranscriptionSource&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.path, path) || other.path == path)&&(identical(other.extractedAudioPath, extractedAudioPath) || other.extractedAudioPath == extractedAudioPath)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.format, format) || other.format == format)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.formatLong, formatLong) || other.formatLong == formatLong)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.streams, streams)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,name,path,extractedAudioPath,duration,format,startTime,formatLong,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(streams),bitrate,size,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'TranscriptionSource(id: $id, type: $type, name: $name, path: $path, extractedAudioPath: $extractedAudioPath, duration: $duration, format: $format, startTime: $startTime, formatLong: $formatLong, tags: $tags, streams: $streams, bitrate: $bitrate, size: $size, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $TranscriptionSourceCopyWith<$Res>  {
  factory $TranscriptionSourceCopyWith(TranscriptionSource value, $Res Function(TranscriptionSource) _then) = _$TranscriptionSourceCopyWithImpl;
@useResult
$Res call({
 String id, TranscriptionSourceType type, String name, String path, String? extractedAudioPath, Duration duration, String format, Duration startTime, String? formatLong, Map<String, dynamic>? tags, List<MediaStream> streams, double? bitrate, int? size, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$TranscriptionSourceCopyWithImpl<$Res>
    implements $TranscriptionSourceCopyWith<$Res> {
  _$TranscriptionSourceCopyWithImpl(this._self, this._then);

  final TranscriptionSource _self;
  final $Res Function(TranscriptionSource) _then;

/// Create a copy of TranscriptionSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? name = null,Object? path = null,Object? extractedAudioPath = freezed,Object? duration = null,Object? format = null,Object? startTime = null,Object? formatLong = freezed,Object? tags = freezed,Object? streams = null,Object? bitrate = freezed,Object? size = freezed,Object? metadata = null,}) {
  return _then(TranscriptionSource(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TranscriptionSourceType,null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,freezed == extractedAudioPath ? _self.extractedAudioPath : extractedAudioPath // ignore: cast_nullable_to_non_nullable
as String?,null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as Duration,freezed == formatLong ? _self.formatLong : formatLong // ignore: cast_nullable_to_non_nullable
as String?,freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,null == streams ? _self.streams : streams // ignore: cast_nullable_to_non_nullable
as List<MediaStream>,freezed == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as double?,freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [TranscriptionSource].
extension TranscriptionSourcePatterns on TranscriptionSource {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
