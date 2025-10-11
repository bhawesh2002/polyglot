// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_vm_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeVmState {

 bool get initialized; PlatformFile? get selectedFile; TranscriptionSource? get transcriptionSource; bool get processingFile; bool get extractingAudio; Exception? get exception;
/// Create a copy of HomeVmState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeVmStateCopyWith<HomeVmState> get copyWith => _$HomeVmStateCopyWithImpl<HomeVmState>(this as HomeVmState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeVmState&&(identical(other.initialized, initialized) || other.initialized == initialized)&&(identical(other.selectedFile, selectedFile) || other.selectedFile == selectedFile)&&(identical(other.transcriptionSource, transcriptionSource) || other.transcriptionSource == transcriptionSource)&&(identical(other.processingFile, processingFile) || other.processingFile == processingFile)&&(identical(other.extractingAudio, extractingAudio) || other.extractingAudio == extractingAudio)&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,initialized,selectedFile,transcriptionSource,processingFile,extractingAudio,exception);

@override
String toString() {
  return 'HomeVmState(initialized: $initialized, selectedFile: $selectedFile, transcriptionSource: $transcriptionSource, processingFile: $processingFile, extractingAudio: $extractingAudio, exception: $exception)';
}


}

/// @nodoc
abstract mixin class $HomeVmStateCopyWith<$Res>  {
  factory $HomeVmStateCopyWith(HomeVmState value, $Res Function(HomeVmState) _then) = _$HomeVmStateCopyWithImpl;
@useResult
$Res call({
 bool initialized, PlatformFile? selectedFile, TranscriptionSource? transcriptionSource, bool processingFile, bool extractingAudio, Exception? exception
});


$TranscriptionSourceCopyWith<$Res>? get transcriptionSource;

}
/// @nodoc
class _$HomeVmStateCopyWithImpl<$Res>
    implements $HomeVmStateCopyWith<$Res> {
  _$HomeVmStateCopyWithImpl(this._self, this._then);

  final HomeVmState _self;
  final $Res Function(HomeVmState) _then;

/// Create a copy of HomeVmState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? initialized = null,Object? selectedFile = freezed,Object? transcriptionSource = freezed,Object? processingFile = null,Object? extractingAudio = null,Object? exception = freezed,}) {
  return _then(_self.copyWith(
initialized: null == initialized ? _self.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,selectedFile: freezed == selectedFile ? _self.selectedFile : selectedFile // ignore: cast_nullable_to_non_nullable
as PlatformFile?,transcriptionSource: freezed == transcriptionSource ? _self.transcriptionSource : transcriptionSource // ignore: cast_nullable_to_non_nullable
as TranscriptionSource?,processingFile: null == processingFile ? _self.processingFile : processingFile // ignore: cast_nullable_to_non_nullable
as bool,extractingAudio: null == extractingAudio ? _self.extractingAudio : extractingAudio // ignore: cast_nullable_to_non_nullable
as bool,exception: freezed == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as Exception?,
  ));
}
/// Create a copy of HomeVmState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranscriptionSourceCopyWith<$Res>? get transcriptionSource {
    if (_self.transcriptionSource == null) {
    return null;
  }

  return $TranscriptionSourceCopyWith<$Res>(_self.transcriptionSource!, (value) {
    return _then(_self.copyWith(transcriptionSource: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeVmState].
extension HomeVmStatePatterns on HomeVmState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeVmState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeVmState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeVmState value)  $default,){
final _that = this;
switch (_that) {
case _HomeVmState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeVmState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeVmState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool initialized,  PlatformFile? selectedFile,  TranscriptionSource? transcriptionSource,  bool processingFile,  bool extractingAudio,  Exception? exception)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeVmState() when $default != null:
return $default(_that.initialized,_that.selectedFile,_that.transcriptionSource,_that.processingFile,_that.extractingAudio,_that.exception);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool initialized,  PlatformFile? selectedFile,  TranscriptionSource? transcriptionSource,  bool processingFile,  bool extractingAudio,  Exception? exception)  $default,) {final _that = this;
switch (_that) {
case _HomeVmState():
return $default(_that.initialized,_that.selectedFile,_that.transcriptionSource,_that.processingFile,_that.extractingAudio,_that.exception);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool initialized,  PlatformFile? selectedFile,  TranscriptionSource? transcriptionSource,  bool processingFile,  bool extractingAudio,  Exception? exception)?  $default,) {final _that = this;
switch (_that) {
case _HomeVmState() when $default != null:
return $default(_that.initialized,_that.selectedFile,_that.transcriptionSource,_that.processingFile,_that.extractingAudio,_that.exception);case _:
  return null;

}
}

}

/// @nodoc


class _HomeVmState implements HomeVmState {
   _HomeVmState({this.initialized = false, this.selectedFile, this.transcriptionSource, this.processingFile = false, this.extractingAudio = false, this.exception});
  

@override@JsonKey() final  bool initialized;
@override final  PlatformFile? selectedFile;
@override final  TranscriptionSource? transcriptionSource;
@override@JsonKey() final  bool processingFile;
@override@JsonKey() final  bool extractingAudio;
@override final  Exception? exception;

/// Create a copy of HomeVmState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeVmStateCopyWith<_HomeVmState> get copyWith => __$HomeVmStateCopyWithImpl<_HomeVmState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeVmState&&(identical(other.initialized, initialized) || other.initialized == initialized)&&(identical(other.selectedFile, selectedFile) || other.selectedFile == selectedFile)&&(identical(other.transcriptionSource, transcriptionSource) || other.transcriptionSource == transcriptionSource)&&(identical(other.processingFile, processingFile) || other.processingFile == processingFile)&&(identical(other.extractingAudio, extractingAudio) || other.extractingAudio == extractingAudio)&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,initialized,selectedFile,transcriptionSource,processingFile,extractingAudio,exception);

@override
String toString() {
  return 'HomeVmState(initialized: $initialized, selectedFile: $selectedFile, transcriptionSource: $transcriptionSource, processingFile: $processingFile, extractingAudio: $extractingAudio, exception: $exception)';
}


}

/// @nodoc
abstract mixin class _$HomeVmStateCopyWith<$Res> implements $HomeVmStateCopyWith<$Res> {
  factory _$HomeVmStateCopyWith(_HomeVmState value, $Res Function(_HomeVmState) _then) = __$HomeVmStateCopyWithImpl;
@override @useResult
$Res call({
 bool initialized, PlatformFile? selectedFile, TranscriptionSource? transcriptionSource, bool processingFile, bool extractingAudio, Exception? exception
});


@override $TranscriptionSourceCopyWith<$Res>? get transcriptionSource;

}
/// @nodoc
class __$HomeVmStateCopyWithImpl<$Res>
    implements _$HomeVmStateCopyWith<$Res> {
  __$HomeVmStateCopyWithImpl(this._self, this._then);

  final _HomeVmState _self;
  final $Res Function(_HomeVmState) _then;

/// Create a copy of HomeVmState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? initialized = null,Object? selectedFile = freezed,Object? transcriptionSource = freezed,Object? processingFile = null,Object? extractingAudio = null,Object? exception = freezed,}) {
  return _then(_HomeVmState(
initialized: null == initialized ? _self.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,selectedFile: freezed == selectedFile ? _self.selectedFile : selectedFile // ignore: cast_nullable_to_non_nullable
as PlatformFile?,transcriptionSource: freezed == transcriptionSource ? _self.transcriptionSource : transcriptionSource // ignore: cast_nullable_to_non_nullable
as TranscriptionSource?,processingFile: null == processingFile ? _self.processingFile : processingFile // ignore: cast_nullable_to_non_nullable
as bool,extractingAudio: null == extractingAudio ? _self.extractingAudio : extractingAudio // ignore: cast_nullable_to_non_nullable
as bool,exception: freezed == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as Exception?,
  ));
}

/// Create a copy of HomeVmState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranscriptionSourceCopyWith<$Res>? get transcriptionSource {
    if (_self.transcriptionSource == null) {
    return null;
  }

  return $TranscriptionSourceCopyWith<$Res>(_self.transcriptionSource!, (value) {
    return _then(_self.copyWith(transcriptionSource: value));
  });
}
}

// dart format on
