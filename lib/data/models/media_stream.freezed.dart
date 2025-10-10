// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_stream.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
MediaStream _$MediaStreamFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'video':
          return VideoStream.fromJson(
            json
          );
                case 'audio':
          return AudioStream.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'MediaStream',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$MediaStream {

 int get index; String get codec; String get codecLong; String get codecType; Map<String, dynamic> get metadata; String? get bitrate; Map<String, dynamic>? get tags;
/// Create a copy of MediaStream
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaStreamCopyWith<MediaStream> get copyWith => _$MediaStreamCopyWithImpl<MediaStream>(this as MediaStream, _$identity);

  /// Serializes this MediaStream to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaStream&&(identical(other.index, index) || other.index == index)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.codecLong, codecLong) || other.codecLong == codecLong)&&(identical(other.codecType, codecType) || other.codecType == codecType)&&const DeepCollectionEquality().equals(other.metadata, metadata)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,codec,codecLong,codecType,const DeepCollectionEquality().hash(metadata),bitrate,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'MediaStream(index: $index, codec: $codec, codecLong: $codecLong, codecType: $codecType, metadata: $metadata, bitrate: $bitrate, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $MediaStreamCopyWith<$Res>  {
  factory $MediaStreamCopyWith(MediaStream value, $Res Function(MediaStream) _then) = _$MediaStreamCopyWithImpl;
@useResult
$Res call({
 int index, String codec, String codecLong, String codecType, Map<String, dynamic> metadata, String? bitrate, Map<String, dynamic>? tags
});




}
/// @nodoc
class _$MediaStreamCopyWithImpl<$Res>
    implements $MediaStreamCopyWith<$Res> {
  _$MediaStreamCopyWithImpl(this._self, this._then);

  final MediaStream _self;
  final $Res Function(MediaStream) _then;

/// Create a copy of MediaStream
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = null,Object? codec = null,Object? codecLong = null,Object? codecType = null,Object? metadata = null,Object? bitrate = freezed,Object? tags = freezed,}) {
  return _then(_self.copyWith(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,codec: null == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String,codecLong: null == codecLong ? _self.codecLong : codecLong // ignore: cast_nullable_to_non_nullable
as String,codecType: null == codecType ? _self.codecType : codecType // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,bitrate: freezed == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaStream].
extension MediaStreamPatterns on MediaStream {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( VideoStream value)?  video,TResult Function( AudioStream value)?  audio,required TResult orElse(),}){
final _that = this;
switch (_that) {
case VideoStream() when video != null:
return video(_that);case AudioStream() when audio != null:
return audio(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( VideoStream value)  video,required TResult Function( AudioStream value)  audio,}){
final _that = this;
switch (_that) {
case VideoStream():
return video(_that);case AudioStream():
return audio(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( VideoStream value)?  video,TResult? Function( AudioStream value)?  audio,}){
final _that = this;
switch (_that) {
case VideoStream() when video != null:
return video(_that);case AudioStream() when audio != null:
return audio(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int index,  String codec,  String codecLong,  String codecType,  Map<String, dynamic> metadata,  String? bitrate,  Map<String, dynamic>? tags,  String? width,  String? height,  String? sampleAspectRatio,  String? displayAspectRatio,  String? pixelFormat,  String? frameRate,  String? averageFrameRate)?  video,TResult Function( int index,  String codec,  String codecLong,  String codecType,  Map<String, dynamic> metadata,  String? bitrate,  Map<String, dynamic>? tags,  String? sampleFormat,  String? sampleRate,  String? channelLayout,  String? channels)?  audio,required TResult orElse(),}) {final _that = this;
switch (_that) {
case VideoStream() when video != null:
return video(_that.index,_that.codec,_that.codecLong,_that.codecType,_that.metadata,_that.bitrate,_that.tags,_that.width,_that.height,_that.sampleAspectRatio,_that.displayAspectRatio,_that.pixelFormat,_that.frameRate,_that.averageFrameRate);case AudioStream() when audio != null:
return audio(_that.index,_that.codec,_that.codecLong,_that.codecType,_that.metadata,_that.bitrate,_that.tags,_that.sampleFormat,_that.sampleRate,_that.channelLayout,_that.channels);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int index,  String codec,  String codecLong,  String codecType,  Map<String, dynamic> metadata,  String? bitrate,  Map<String, dynamic>? tags,  String? width,  String? height,  String? sampleAspectRatio,  String? displayAspectRatio,  String? pixelFormat,  String? frameRate,  String? averageFrameRate)  video,required TResult Function( int index,  String codec,  String codecLong,  String codecType,  Map<String, dynamic> metadata,  String? bitrate,  Map<String, dynamic>? tags,  String? sampleFormat,  String? sampleRate,  String? channelLayout,  String? channels)  audio,}) {final _that = this;
switch (_that) {
case VideoStream():
return video(_that.index,_that.codec,_that.codecLong,_that.codecType,_that.metadata,_that.bitrate,_that.tags,_that.width,_that.height,_that.sampleAspectRatio,_that.displayAspectRatio,_that.pixelFormat,_that.frameRate,_that.averageFrameRate);case AudioStream():
return audio(_that.index,_that.codec,_that.codecLong,_that.codecType,_that.metadata,_that.bitrate,_that.tags,_that.sampleFormat,_that.sampleRate,_that.channelLayout,_that.channels);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int index,  String codec,  String codecLong,  String codecType,  Map<String, dynamic> metadata,  String? bitrate,  Map<String, dynamic>? tags,  String? width,  String? height,  String? sampleAspectRatio,  String? displayAspectRatio,  String? pixelFormat,  String? frameRate,  String? averageFrameRate)?  video,TResult? Function( int index,  String codec,  String codecLong,  String codecType,  Map<String, dynamic> metadata,  String? bitrate,  Map<String, dynamic>? tags,  String? sampleFormat,  String? sampleRate,  String? channelLayout,  String? channels)?  audio,}) {final _that = this;
switch (_that) {
case VideoStream() when video != null:
return video(_that.index,_that.codec,_that.codecLong,_that.codecType,_that.metadata,_that.bitrate,_that.tags,_that.width,_that.height,_that.sampleAspectRatio,_that.displayAspectRatio,_that.pixelFormat,_that.frameRate,_that.averageFrameRate);case AudioStream() when audio != null:
return audio(_that.index,_that.codec,_that.codecLong,_that.codecType,_that.metadata,_that.bitrate,_that.tags,_that.sampleFormat,_that.sampleRate,_that.channelLayout,_that.channels);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class VideoStream implements MediaStream {
  const VideoStream({required this.index, required this.codec, required this.codecLong, required this.codecType, required final  Map<String, dynamic> metadata, this.bitrate, final  Map<String, dynamic>? tags, this.width, this.height, this.sampleAspectRatio, this.displayAspectRatio, this.pixelFormat, this.frameRate, this.averageFrameRate, final  String? $type}): _metadata = metadata,_tags = tags,$type = $type ?? 'video';
  factory VideoStream.fromJson(Map<String, dynamic> json) => _$VideoStreamFromJson(json);

@override final  int index;
@override final  String codec;
@override final  String codecLong;
@override final  String codecType;
 final  Map<String, dynamic> _metadata;
@override Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}

@override final  String? bitrate;
 final  Map<String, dynamic>? _tags;
@override Map<String, dynamic>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableMapView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  String? width;
 final  String? height;
 final  String? sampleAspectRatio;
 final  String? displayAspectRatio;
 final  String? pixelFormat;
 final  String? frameRate;
 final  String? averageFrameRate;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MediaStream
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoStreamCopyWith<VideoStream> get copyWith => _$VideoStreamCopyWithImpl<VideoStream>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoStreamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoStream&&(identical(other.index, index) || other.index == index)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.codecLong, codecLong) || other.codecLong == codecLong)&&(identical(other.codecType, codecType) || other.codecType == codecType)&&const DeepCollectionEquality().equals(other._metadata, _metadata)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.sampleAspectRatio, sampleAspectRatio) || other.sampleAspectRatio == sampleAspectRatio)&&(identical(other.displayAspectRatio, displayAspectRatio) || other.displayAspectRatio == displayAspectRatio)&&(identical(other.pixelFormat, pixelFormat) || other.pixelFormat == pixelFormat)&&(identical(other.frameRate, frameRate) || other.frameRate == frameRate)&&(identical(other.averageFrameRate, averageFrameRate) || other.averageFrameRate == averageFrameRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,codec,codecLong,codecType,const DeepCollectionEquality().hash(_metadata),bitrate,const DeepCollectionEquality().hash(_tags),width,height,sampleAspectRatio,displayAspectRatio,pixelFormat,frameRate,averageFrameRate);

@override
String toString() {
  return 'MediaStream.video(index: $index, codec: $codec, codecLong: $codecLong, codecType: $codecType, metadata: $metadata, bitrate: $bitrate, tags: $tags, width: $width, height: $height, sampleAspectRatio: $sampleAspectRatio, displayAspectRatio: $displayAspectRatio, pixelFormat: $pixelFormat, frameRate: $frameRate, averageFrameRate: $averageFrameRate)';
}


}

/// @nodoc
abstract mixin class $VideoStreamCopyWith<$Res> implements $MediaStreamCopyWith<$Res> {
  factory $VideoStreamCopyWith(VideoStream value, $Res Function(VideoStream) _then) = _$VideoStreamCopyWithImpl;
@override @useResult
$Res call({
 int index, String codec, String codecLong, String codecType, Map<String, dynamic> metadata, String? bitrate, Map<String, dynamic>? tags, String? width, String? height, String? sampleAspectRatio, String? displayAspectRatio, String? pixelFormat, String? frameRate, String? averageFrameRate
});




}
/// @nodoc
class _$VideoStreamCopyWithImpl<$Res>
    implements $VideoStreamCopyWith<$Res> {
  _$VideoStreamCopyWithImpl(this._self, this._then);

  final VideoStream _self;
  final $Res Function(VideoStream) _then;

/// Create a copy of MediaStream
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? codec = null,Object? codecLong = null,Object? codecType = null,Object? metadata = null,Object? bitrate = freezed,Object? tags = freezed,Object? width = freezed,Object? height = freezed,Object? sampleAspectRatio = freezed,Object? displayAspectRatio = freezed,Object? pixelFormat = freezed,Object? frameRate = freezed,Object? averageFrameRate = freezed,}) {
  return _then(VideoStream(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,codec: null == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String,codecLong: null == codecLong ? _self.codecLong : codecLong // ignore: cast_nullable_to_non_nullable
as String,codecType: null == codecType ? _self.codecType : codecType // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,bitrate: freezed == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as String?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String?,sampleAspectRatio: freezed == sampleAspectRatio ? _self.sampleAspectRatio : sampleAspectRatio // ignore: cast_nullable_to_non_nullable
as String?,displayAspectRatio: freezed == displayAspectRatio ? _self.displayAspectRatio : displayAspectRatio // ignore: cast_nullable_to_non_nullable
as String?,pixelFormat: freezed == pixelFormat ? _self.pixelFormat : pixelFormat // ignore: cast_nullable_to_non_nullable
as String?,frameRate: freezed == frameRate ? _self.frameRate : frameRate // ignore: cast_nullable_to_non_nullable
as String?,averageFrameRate: freezed == averageFrameRate ? _self.averageFrameRate : averageFrameRate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class AudioStream implements MediaStream {
  const AudioStream({required this.index, required this.codec, required this.codecLong, required this.codecType, required final  Map<String, dynamic> metadata, this.bitrate, final  Map<String, dynamic>? tags, this.sampleFormat, this.sampleRate, this.channelLayout, this.channels, final  String? $type}): _metadata = metadata,_tags = tags,$type = $type ?? 'audio';
  factory AudioStream.fromJson(Map<String, dynamic> json) => _$AudioStreamFromJson(json);

@override final  int index;
@override final  String codec;
@override final  String codecLong;
@override final  String codecType;
 final  Map<String, dynamic> _metadata;
@override Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}

@override final  String? bitrate;
 final  Map<String, dynamic>? _tags;
@override Map<String, dynamic>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableMapView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  String? sampleFormat;
 final  String? sampleRate;
 final  String? channelLayout;
 final  String? channels;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of MediaStream
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioStreamCopyWith<AudioStream> get copyWith => _$AudioStreamCopyWithImpl<AudioStream>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioStreamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioStream&&(identical(other.index, index) || other.index == index)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.codecLong, codecLong) || other.codecLong == codecLong)&&(identical(other.codecType, codecType) || other.codecType == codecType)&&const DeepCollectionEquality().equals(other._metadata, _metadata)&&(identical(other.bitrate, bitrate) || other.bitrate == bitrate)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.sampleFormat, sampleFormat) || other.sampleFormat == sampleFormat)&&(identical(other.sampleRate, sampleRate) || other.sampleRate == sampleRate)&&(identical(other.channelLayout, channelLayout) || other.channelLayout == channelLayout)&&(identical(other.channels, channels) || other.channels == channels));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,codec,codecLong,codecType,const DeepCollectionEquality().hash(_metadata),bitrate,const DeepCollectionEquality().hash(_tags),sampleFormat,sampleRate,channelLayout,channels);

@override
String toString() {
  return 'MediaStream.audio(index: $index, codec: $codec, codecLong: $codecLong, codecType: $codecType, metadata: $metadata, bitrate: $bitrate, tags: $tags, sampleFormat: $sampleFormat, sampleRate: $sampleRate, channelLayout: $channelLayout, channels: $channels)';
}


}

/// @nodoc
abstract mixin class $AudioStreamCopyWith<$Res> implements $MediaStreamCopyWith<$Res> {
  factory $AudioStreamCopyWith(AudioStream value, $Res Function(AudioStream) _then) = _$AudioStreamCopyWithImpl;
@override @useResult
$Res call({
 int index, String codec, String codecLong, String codecType, Map<String, dynamic> metadata, String? bitrate, Map<String, dynamic>? tags, String? sampleFormat, String? sampleRate, String? channelLayout, String? channels
});




}
/// @nodoc
class _$AudioStreamCopyWithImpl<$Res>
    implements $AudioStreamCopyWith<$Res> {
  _$AudioStreamCopyWithImpl(this._self, this._then);

  final AudioStream _self;
  final $Res Function(AudioStream) _then;

/// Create a copy of MediaStream
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = null,Object? codec = null,Object? codecLong = null,Object? codecType = null,Object? metadata = null,Object? bitrate = freezed,Object? tags = freezed,Object? sampleFormat = freezed,Object? sampleRate = freezed,Object? channelLayout = freezed,Object? channels = freezed,}) {
  return _then(AudioStream(
index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,codec: null == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String,codecLong: null == codecLong ? _self.codecLong : codecLong // ignore: cast_nullable_to_non_nullable
as String,codecType: null == codecType ? _self.codecType : codecType // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,bitrate: freezed == bitrate ? _self.bitrate : bitrate // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,sampleFormat: freezed == sampleFormat ? _self.sampleFormat : sampleFormat // ignore: cast_nullable_to_non_nullable
as String?,sampleRate: freezed == sampleRate ? _self.sampleRate : sampleRate // ignore: cast_nullable_to_non_nullable
as String?,channelLayout: freezed == channelLayout ? _self.channelLayout : channelLayout // ignore: cast_nullable_to_non_nullable
as String?,channels: freezed == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
