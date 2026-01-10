// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_doctors_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailsDoctorsState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailsDoctorsState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetailsDoctorsState<$T>()';
}


}

/// @nodoc
class $DetailsDoctorsStateCopyWith<T,$Res>  {
$DetailsDoctorsStateCopyWith(DetailsDoctorsState<T> _, $Res Function(DetailsDoctorsState<T>) __);
}


/// Adds pattern-matching-related methods to [DetailsDoctorsState].
extension DetailsDoctorsStatePatterns<T> on DetailsDoctorsState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _initials<T> value)?  initials,TResult Function( Success<T> value)?  success,TResult Function( Loading<T> value)?  loading,TResult Function( Error<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _initials() when initials != null:
return initials(_that);case Success() when success != null:
return success(_that);case Loading() when loading != null:
return loading(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _initials<T> value)  initials,required TResult Function( Success<T> value)  success,required TResult Function( Loading<T> value)  loading,required TResult Function( Error<T> value)  error,}){
final _that = this;
switch (_that) {
case _initials():
return initials(_that);case Success():
return success(_that);case Loading():
return loading(_that);case Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _initials<T> value)?  initials,TResult? Function( Success<T> value)?  success,TResult? Function( Loading<T> value)?  loading,TResult? Function( Error<T> value)?  error,}){
final _that = this;
switch (_that) {
case _initials() when initials != null:
return initials(_that);case Success() when success != null:
return success(_that);case Loading() when loading != null:
return loading(_that);case Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initials,TResult Function( DataForDoctors? dataForDoctors)?  success,TResult Function()?  loading,TResult Function( String messages)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _initials() when initials != null:
return initials();case Success() when success != null:
return success(_that.dataForDoctors);case Loading() when loading != null:
return loading();case Error() when error != null:
return error(_that.messages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initials,required TResult Function( DataForDoctors? dataForDoctors)  success,required TResult Function()  loading,required TResult Function( String messages)  error,}) {final _that = this;
switch (_that) {
case _initials():
return initials();case Success():
return success(_that.dataForDoctors);case Loading():
return loading();case Error():
return error(_that.messages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initials,TResult? Function( DataForDoctors? dataForDoctors)?  success,TResult? Function()?  loading,TResult? Function( String messages)?  error,}) {final _that = this;
switch (_that) {
case _initials() when initials != null:
return initials();case Success() when success != null:
return success(_that.dataForDoctors);case Loading() when loading != null:
return loading();case Error() when error != null:
return error(_that.messages);case _:
  return null;

}
}

}

/// @nodoc


class _initials<T> implements DetailsDoctorsState<T> {
  const _initials();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _initials<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetailsDoctorsState<$T>.initials()';
}


}




/// @nodoc


class Success<T> implements DetailsDoctorsState<T> {
  const Success(this.dataForDoctors);
  

 final  DataForDoctors? dataForDoctors;

/// Create a copy of DetailsDoctorsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<T, Success<T>> get copyWith => _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<T>&&(identical(other.dataForDoctors, dataForDoctors) || other.dataForDoctors == dataForDoctors));
}


@override
int get hashCode => Object.hash(runtimeType,dataForDoctors);

@override
String toString() {
  return 'DetailsDoctorsState<$T>.success(dataForDoctors: $dataForDoctors)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<T,$Res> implements $DetailsDoctorsStateCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 DataForDoctors? dataForDoctors
});




}
/// @nodoc
class _$SuccessCopyWithImpl<T,$Res>
    implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<T> _self;
  final $Res Function(Success<T>) _then;

/// Create a copy of DetailsDoctorsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? dataForDoctors = freezed,}) {
  return _then(Success<T>(
freezed == dataForDoctors ? _self.dataForDoctors : dataForDoctors // ignore: cast_nullable_to_non_nullable
as DataForDoctors?,
  ));
}


}

/// @nodoc


class Loading<T> implements DetailsDoctorsState<T> {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DetailsDoctorsState<$T>.loading()';
}


}




/// @nodoc


class Error<T> implements DetailsDoctorsState<T> {
  const Error({required this.messages});
  

 final  String messages;

/// Create a copy of DetailsDoctorsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<T, Error<T>> get copyWith => _$ErrorCopyWithImpl<T, Error<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error<T>&&(identical(other.messages, messages) || other.messages == messages));
}


@override
int get hashCode => Object.hash(runtimeType,messages);

@override
String toString() {
  return 'DetailsDoctorsState<$T>.error(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<T,$Res> implements $DetailsDoctorsStateCopyWith<T, $Res> {
  factory $ErrorCopyWith(Error<T> value, $Res Function(Error<T>) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String messages
});




}
/// @nodoc
class _$ErrorCopyWithImpl<T,$Res>
    implements $ErrorCopyWith<T, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<T> _self;
  final $Res Function(Error<T>) _then;

/// Create a copy of DetailsDoctorsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(Error<T>(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
