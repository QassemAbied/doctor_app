// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpState<$T>()';
}


}

/// @nodoc
class $SignUpStateCopyWith<T,$Res>  {
$SignUpStateCopyWith(SignUpState<T> _, $Res Function(SignUpState<T>) __);
}


/// Adds pattern-matching-related methods to [SignUpState].
extension SignUpStatePatterns<T> on SignUpState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial<T> value)?  initial,TResult Function( Loading<T> value)?  loading,TResult Function( Success<T> value)?  success,TResult Function( Error<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial<T> value)  initial,required TResult Function( Loading<T> value)  loading,required TResult Function( Success<T> value)  success,required TResult Function( Error<T> value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Loading():
return loading(_that);case Success():
return success(_that);case Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial<T> value)?  initial,TResult? Function( Loading<T> value)?  loading,TResult? Function( Success<T> value)?  success,TResult? Function( Error<T> value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Success() when success != null:
return success(_that);case Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( T data)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.data);case Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( T data)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Loading():
return loading();case Success():
return success(_that.data);case Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( T data)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Success() when success != null:
return success(_that.data);case Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Initial<T> implements SignUpState<T> {
   _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpState<$T>.initial()';
}


}




/// @nodoc


class Loading<T> implements SignUpState<T> {
   Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SignUpState<$T>.loading()';
}


}




/// @nodoc


class Success<T> implements SignUpState<T> {
   Success(this.data);
  

 final  T data;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<T, Success<T>> get copyWith => _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SignUpState<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<T,$Res> implements $SignUpStateCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$SuccessCopyWithImpl<T,$Res>
    implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<T> _self;
  final $Res Function(Success<T>) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(Success<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class Error<T> implements SignUpState<T> {
   Error({required this.message});
  

 final  String message;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<T, Error<T>> get copyWith => _$ErrorCopyWithImpl<T, Error<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SignUpState<$T>.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<T,$Res> implements $SignUpStateCopyWith<T, $Res> {
  factory $ErrorCopyWith(Error<T> value, $Res Function(Error<T>) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<T,$Res>
    implements $ErrorCopyWith<T, $Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error<T> _self;
  final $Res Function(Error<T>) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error<T>(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ToggleSignUpState {

 bool get obscure1; bool get obscure2;
/// Create a copy of ToggleSignUpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleSignUpStateCopyWith<ToggleSignUpState> get copyWith => _$ToggleSignUpStateCopyWithImpl<ToggleSignUpState>(this as ToggleSignUpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleSignUpState&&(identical(other.obscure1, obscure1) || other.obscure1 == obscure1)&&(identical(other.obscure2, obscure2) || other.obscure2 == obscure2));
}


@override
int get hashCode => Object.hash(runtimeType,obscure1,obscure2);

@override
String toString() {
  return 'ToggleSignUpState(obscure1: $obscure1, obscure2: $obscure2)';
}


}

/// @nodoc
abstract mixin class $ToggleSignUpStateCopyWith<$Res>  {
  factory $ToggleSignUpStateCopyWith(ToggleSignUpState value, $Res Function(ToggleSignUpState) _then) = _$ToggleSignUpStateCopyWithImpl;
@useResult
$Res call({
 bool obscure1, bool obscure2
});




}
/// @nodoc
class _$ToggleSignUpStateCopyWithImpl<$Res>
    implements $ToggleSignUpStateCopyWith<$Res> {
  _$ToggleSignUpStateCopyWithImpl(this._self, this._then);

  final ToggleSignUpState _self;
  final $Res Function(ToggleSignUpState) _then;

/// Create a copy of ToggleSignUpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? obscure1 = null,Object? obscure2 = null,}) {
  return _then(_self.copyWith(
obscure1: null == obscure1 ? _self.obscure1 : obscure1 // ignore: cast_nullable_to_non_nullable
as bool,obscure2: null == obscure2 ? _self.obscure2 : obscure2 // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ToggleSignUpState].
extension ToggleSignUpStatePatterns on ToggleSignUpState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ToggleSignUpState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToggleSignUpState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ToggleSignUpState value)  $default,){
final _that = this;
switch (_that) {
case _ToggleSignUpState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ToggleSignUpState value)?  $default,){
final _that = this;
switch (_that) {
case _ToggleSignUpState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool obscure1,  bool obscure2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToggleSignUpState() when $default != null:
return $default(_that.obscure1,_that.obscure2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool obscure1,  bool obscure2)  $default,) {final _that = this;
switch (_that) {
case _ToggleSignUpState():
return $default(_that.obscure1,_that.obscure2);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool obscure1,  bool obscure2)?  $default,) {final _that = this;
switch (_that) {
case _ToggleSignUpState() when $default != null:
return $default(_that.obscure1,_that.obscure2);case _:
  return null;

}
}

}

/// @nodoc


class _ToggleSignUpState implements ToggleSignUpState {
  const _ToggleSignUpState({required this.obscure1, required this.obscure2});
  

@override final  bool obscure1;
@override final  bool obscure2;

/// Create a copy of ToggleSignUpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleSignUpStateCopyWith<_ToggleSignUpState> get copyWith => __$ToggleSignUpStateCopyWithImpl<_ToggleSignUpState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleSignUpState&&(identical(other.obscure1, obscure1) || other.obscure1 == obscure1)&&(identical(other.obscure2, obscure2) || other.obscure2 == obscure2));
}


@override
int get hashCode => Object.hash(runtimeType,obscure1,obscure2);

@override
String toString() {
  return 'ToggleSignUpState(obscure1: $obscure1, obscure2: $obscure2)';
}


}

/// @nodoc
abstract mixin class _$ToggleSignUpStateCopyWith<$Res> implements $ToggleSignUpStateCopyWith<$Res> {
  factory _$ToggleSignUpStateCopyWith(_ToggleSignUpState value, $Res Function(_ToggleSignUpState) _then) = __$ToggleSignUpStateCopyWithImpl;
@override @useResult
$Res call({
 bool obscure1, bool obscure2
});




}
/// @nodoc
class __$ToggleSignUpStateCopyWithImpl<$Res>
    implements _$ToggleSignUpStateCopyWith<$Res> {
  __$ToggleSignUpStateCopyWithImpl(this._self, this._then);

  final _ToggleSignUpState _self;
  final $Res Function(_ToggleSignUpState) _then;

/// Create a copy of ToggleSignUpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? obscure1 = null,Object? obscure2 = null,}) {
  return _then(_ToggleSignUpState(
obscure1: null == obscure1 ? _self.obscure1 : obscure1 // ignore: cast_nullable_to_non_nullable
as bool,obscure2: null == obscure2 ? _self.obscure2 : obscure2 // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
