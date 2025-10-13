// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transcriptions_view_vm_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TranscriptionsViewVmState {

 bool get initialized; List<Transcription> get transcriptions; List<TranscriptionSource> get orphanSources; int? get activeTranscriptionSrcIndex; Exception? get exception;
/// Create a copy of TranscriptionsViewVmState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranscriptionsViewVmStateCopyWith<TranscriptionsViewVmState> get copyWith => _$TranscriptionsViewVmStateCopyWithImpl<TranscriptionsViewVmState>(this as TranscriptionsViewVmState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranscriptionsViewVmState&&(identical(other.initialized, initialized) || other.initialized == initialized)&&const DeepCollectionEquality().equals(other.transcriptions, transcriptions)&&const DeepCollectionEquality().equals(other.orphanSources, orphanSources)&&(identical(other.activeTranscriptionSrcIndex, activeTranscriptionSrcIndex) || other.activeTranscriptionSrcIndex == activeTranscriptionSrcIndex)&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,initialized,const DeepCollectionEquality().hash(transcriptions),const DeepCollectionEquality().hash(orphanSources),activeTranscriptionSrcIndex,exception);

@override
String toString() {
  return 'TranscriptionsViewVmState(initialized: $initialized, transcriptions: $transcriptions, orphanSources: $orphanSources, activeTranscriptionSrcIndex: $activeTranscriptionSrcIndex, exception: $exception)';
}


}

/// @nodoc
abstract mixin class $TranscriptionsViewVmStateCopyWith<$Res>  {
  factory $TranscriptionsViewVmStateCopyWith(TranscriptionsViewVmState value, $Res Function(TranscriptionsViewVmState) _then) = _$TranscriptionsViewVmStateCopyWithImpl;
@useResult
$Res call({
 bool initialized, List<Transcription> transcriptions, List<TranscriptionSource> orphanSources, int? activeTranscriptionSrcIndex, Exception? exception
});




}
/// @nodoc
class _$TranscriptionsViewVmStateCopyWithImpl<$Res>
    implements $TranscriptionsViewVmStateCopyWith<$Res> {
  _$TranscriptionsViewVmStateCopyWithImpl(this._self, this._then);

  final TranscriptionsViewVmState _self;
  final $Res Function(TranscriptionsViewVmState) _then;

/// Create a copy of TranscriptionsViewVmState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? initialized = null,Object? transcriptions = null,Object? orphanSources = null,Object? activeTranscriptionSrcIndex = freezed,Object? exception = freezed,}) {
  return _then(_self.copyWith(
initialized: null == initialized ? _self.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,transcriptions: null == transcriptions ? _self.transcriptions : transcriptions // ignore: cast_nullable_to_non_nullable
as List<Transcription>,orphanSources: null == orphanSources ? _self.orphanSources : orphanSources // ignore: cast_nullable_to_non_nullable
as List<TranscriptionSource>,activeTranscriptionSrcIndex: freezed == activeTranscriptionSrcIndex ? _self.activeTranscriptionSrcIndex : activeTranscriptionSrcIndex // ignore: cast_nullable_to_non_nullable
as int?,exception: freezed == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as Exception?,
  ));
}

}


/// Adds pattern-matching-related methods to [TranscriptionsViewVmState].
extension TranscriptionsViewVmStatePatterns on TranscriptionsViewVmState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TranscriptionsViewVmState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TranscriptionsViewVmState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TranscriptionsViewVmState value)  $default,){
final _that = this;
switch (_that) {
case _TranscriptionsViewVmState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TranscriptionsViewVmState value)?  $default,){
final _that = this;
switch (_that) {
case _TranscriptionsViewVmState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool initialized,  List<Transcription> transcriptions,  List<TranscriptionSource> orphanSources,  int? activeTranscriptionSrcIndex,  Exception? exception)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TranscriptionsViewVmState() when $default != null:
return $default(_that.initialized,_that.transcriptions,_that.orphanSources,_that.activeTranscriptionSrcIndex,_that.exception);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool initialized,  List<Transcription> transcriptions,  List<TranscriptionSource> orphanSources,  int? activeTranscriptionSrcIndex,  Exception? exception)  $default,) {final _that = this;
switch (_that) {
case _TranscriptionsViewVmState():
return $default(_that.initialized,_that.transcriptions,_that.orphanSources,_that.activeTranscriptionSrcIndex,_that.exception);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool initialized,  List<Transcription> transcriptions,  List<TranscriptionSource> orphanSources,  int? activeTranscriptionSrcIndex,  Exception? exception)?  $default,) {final _that = this;
switch (_that) {
case _TranscriptionsViewVmState() when $default != null:
return $default(_that.initialized,_that.transcriptions,_that.orphanSources,_that.activeTranscriptionSrcIndex,_that.exception);case _:
  return null;

}
}

}

/// @nodoc


class _TranscriptionsViewVmState implements TranscriptionsViewVmState {
  const _TranscriptionsViewVmState({this.initialized = false, final  List<Transcription> transcriptions = const [], final  List<TranscriptionSource> orphanSources = const [], this.activeTranscriptionSrcIndex, this.exception}): _transcriptions = transcriptions,_orphanSources = orphanSources;
  

@override@JsonKey() final  bool initialized;
 final  List<Transcription> _transcriptions;
@override@JsonKey() List<Transcription> get transcriptions {
  if (_transcriptions is EqualUnmodifiableListView) return _transcriptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transcriptions);
}

 final  List<TranscriptionSource> _orphanSources;
@override@JsonKey() List<TranscriptionSource> get orphanSources {
  if (_orphanSources is EqualUnmodifiableListView) return _orphanSources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orphanSources);
}

@override final  int? activeTranscriptionSrcIndex;
@override final  Exception? exception;

/// Create a copy of TranscriptionsViewVmState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranscriptionsViewVmStateCopyWith<_TranscriptionsViewVmState> get copyWith => __$TranscriptionsViewVmStateCopyWithImpl<_TranscriptionsViewVmState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TranscriptionsViewVmState&&(identical(other.initialized, initialized) || other.initialized == initialized)&&const DeepCollectionEquality().equals(other._transcriptions, _transcriptions)&&const DeepCollectionEquality().equals(other._orphanSources, _orphanSources)&&(identical(other.activeTranscriptionSrcIndex, activeTranscriptionSrcIndex) || other.activeTranscriptionSrcIndex == activeTranscriptionSrcIndex)&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,initialized,const DeepCollectionEquality().hash(_transcriptions),const DeepCollectionEquality().hash(_orphanSources),activeTranscriptionSrcIndex,exception);

@override
String toString() {
  return 'TranscriptionsViewVmState(initialized: $initialized, transcriptions: $transcriptions, orphanSources: $orphanSources, activeTranscriptionSrcIndex: $activeTranscriptionSrcIndex, exception: $exception)';
}


}

/// @nodoc
abstract mixin class _$TranscriptionsViewVmStateCopyWith<$Res> implements $TranscriptionsViewVmStateCopyWith<$Res> {
  factory _$TranscriptionsViewVmStateCopyWith(_TranscriptionsViewVmState value, $Res Function(_TranscriptionsViewVmState) _then) = __$TranscriptionsViewVmStateCopyWithImpl;
@override @useResult
$Res call({
 bool initialized, List<Transcription> transcriptions, List<TranscriptionSource> orphanSources, int? activeTranscriptionSrcIndex, Exception? exception
});




}
/// @nodoc
class __$TranscriptionsViewVmStateCopyWithImpl<$Res>
    implements _$TranscriptionsViewVmStateCopyWith<$Res> {
  __$TranscriptionsViewVmStateCopyWithImpl(this._self, this._then);

  final _TranscriptionsViewVmState _self;
  final $Res Function(_TranscriptionsViewVmState) _then;

/// Create a copy of TranscriptionsViewVmState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? initialized = null,Object? transcriptions = null,Object? orphanSources = null,Object? activeTranscriptionSrcIndex = freezed,Object? exception = freezed,}) {
  return _then(_TranscriptionsViewVmState(
initialized: null == initialized ? _self.initialized : initialized // ignore: cast_nullable_to_non_nullable
as bool,transcriptions: null == transcriptions ? _self._transcriptions : transcriptions // ignore: cast_nullable_to_non_nullable
as List<Transcription>,orphanSources: null == orphanSources ? _self._orphanSources : orphanSources // ignore: cast_nullable_to_non_nullable
as List<TranscriptionSource>,activeTranscriptionSrcIndex: freezed == activeTranscriptionSrcIndex ? _self.activeTranscriptionSrcIndex : activeTranscriptionSrcIndex // ignore: cast_nullable_to_non_nullable
as int?,exception: freezed == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as Exception?,
  ));
}


}

// dart format on
