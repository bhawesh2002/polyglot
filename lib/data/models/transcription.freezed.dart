// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transcription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Transcription {

 int get id; String get name; TranscriptionSource get source; Map<String, dynamic>? get transcription; List<Translation>? get translation;
/// Create a copy of Transcription
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranscriptionCopyWith<Transcription> get copyWith => _$TranscriptionCopyWithImpl<Transcription>(this as Transcription, _$identity);

  /// Serializes this Transcription to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transcription&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other.transcription, transcription)&&const DeepCollectionEquality().equals(other.translation, translation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,source,const DeepCollectionEquality().hash(transcription),const DeepCollectionEquality().hash(translation));

@override
String toString() {
  return 'Transcription(id: $id, name: $name, source: $source, transcription: $transcription, translation: $translation)';
}


}

/// @nodoc
abstract mixin class $TranscriptionCopyWith<$Res>  {
  factory $TranscriptionCopyWith(Transcription value, $Res Function(Transcription) _then) = _$TranscriptionCopyWithImpl;
@useResult
$Res call({
 int id, String name, TranscriptionSource source, Map<String, dynamic>? transcription, List<Translation>? translation
});


$TranscriptionSourceCopyWith<$Res> get source;

}
/// @nodoc
class _$TranscriptionCopyWithImpl<$Res>
    implements $TranscriptionCopyWith<$Res> {
  _$TranscriptionCopyWithImpl(this._self, this._then);

  final Transcription _self;
  final $Res Function(Transcription) _then;

/// Create a copy of Transcription
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? source = null,Object? transcription = freezed,Object? translation = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as TranscriptionSource,transcription: freezed == transcription ? _self.transcription : transcription // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,translation: freezed == translation ? _self.translation : translation // ignore: cast_nullable_to_non_nullable
as List<Translation>?,
  ));
}
/// Create a copy of Transcription
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranscriptionSourceCopyWith<$Res> get source {
  
  return $TranscriptionSourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}


/// Adds pattern-matching-related methods to [Transcription].
extension TranscriptionPatterns on Transcription {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transcription value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transcription() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transcription value)  $default,){
final _that = this;
switch (_that) {
case _Transcription():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transcription value)?  $default,){
final _that = this;
switch (_that) {
case _Transcription() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  TranscriptionSource source,  Map<String, dynamic>? transcription,  List<Translation>? translation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transcription() when $default != null:
return $default(_that.id,_that.name,_that.source,_that.transcription,_that.translation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  TranscriptionSource source,  Map<String, dynamic>? transcription,  List<Translation>? translation)  $default,) {final _that = this;
switch (_that) {
case _Transcription():
return $default(_that.id,_that.name,_that.source,_that.transcription,_that.translation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  TranscriptionSource source,  Map<String, dynamic>? transcription,  List<Translation>? translation)?  $default,) {final _that = this;
switch (_that) {
case _Transcription() when $default != null:
return $default(_that.id,_that.name,_that.source,_that.transcription,_that.translation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Transcription implements Transcription {
  const _Transcription({required this.id, required this.name, required this.source, final  Map<String, dynamic>? transcription, final  List<Translation>? translation}): _transcription = transcription,_translation = translation;
  factory _Transcription.fromJson(Map<String, dynamic> json) => _$TranscriptionFromJson(json);

@override final  int id;
@override final  String name;
@override final  TranscriptionSource source;
 final  Map<String, dynamic>? _transcription;
@override Map<String, dynamic>? get transcription {
  final value = _transcription;
  if (value == null) return null;
  if (_transcription is EqualUnmodifiableMapView) return _transcription;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<Translation>? _translation;
@override List<Translation>? get translation {
  final value = _translation;
  if (value == null) return null;
  if (_translation is EqualUnmodifiableListView) return _translation;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Transcription
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranscriptionCopyWith<_Transcription> get copyWith => __$TranscriptionCopyWithImpl<_Transcription>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TranscriptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transcription&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.source, source) || other.source == source)&&const DeepCollectionEquality().equals(other._transcription, _transcription)&&const DeepCollectionEquality().equals(other._translation, _translation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,source,const DeepCollectionEquality().hash(_transcription),const DeepCollectionEquality().hash(_translation));

@override
String toString() {
  return 'Transcription(id: $id, name: $name, source: $source, transcription: $transcription, translation: $translation)';
}


}

/// @nodoc
abstract mixin class _$TranscriptionCopyWith<$Res> implements $TranscriptionCopyWith<$Res> {
  factory _$TranscriptionCopyWith(_Transcription value, $Res Function(_Transcription) _then) = __$TranscriptionCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, TranscriptionSource source, Map<String, dynamic>? transcription, List<Translation>? translation
});


@override $TranscriptionSourceCopyWith<$Res> get source;

}
/// @nodoc
class __$TranscriptionCopyWithImpl<$Res>
    implements _$TranscriptionCopyWith<$Res> {
  __$TranscriptionCopyWithImpl(this._self, this._then);

  final _Transcription _self;
  final $Res Function(_Transcription) _then;

/// Create a copy of Transcription
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? source = null,Object? transcription = freezed,Object? translation = freezed,}) {
  return _then(_Transcription(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as TranscriptionSource,transcription: freezed == transcription ? _self._transcription : transcription // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,translation: freezed == translation ? _self._translation : translation // ignore: cast_nullable_to_non_nullable
as List<Translation>?,
  ));
}

/// Create a copy of Transcription
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TranscriptionSourceCopyWith<$Res> get source {
  
  return $TranscriptionSourceCopyWith<$Res>(_self.source, (value) {
    return _then(_self.copyWith(source: value));
  });
}
}

// dart format on
