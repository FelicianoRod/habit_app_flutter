// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Habit {

 String get id; String get name; Measure get measure; Reminder? get reminder; CustomIcon get icon;
/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitCopyWith<Habit> get copyWith => _$HabitCopyWithImpl<Habit>(this as Habit, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Habit&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.measure, measure) || other.measure == measure)&&(identical(other.reminder, reminder) || other.reminder == reminder)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,measure,reminder,icon);

@override
String toString() {
  return 'Habit(id: $id, name: $name, measure: $measure, reminder: $reminder, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $HabitCopyWith<$Res>  {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) _then) = _$HabitCopyWithImpl;
@useResult
$Res call({
 String id, String name, Measure measure, Reminder? reminder, CustomIcon icon
});


$MeasureCopyWith<$Res> get measure;$ReminderCopyWith<$Res>? get reminder;$CustomIconCopyWith<$Res> get icon;

}
/// @nodoc
class _$HabitCopyWithImpl<$Res>
    implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._self, this._then);

  final Habit _self;
  final $Res Function(Habit) _then;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? measure = null,Object? reminder = freezed,Object? icon = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,measure: null == measure ? _self.measure : measure // ignore: cast_nullable_to_non_nullable
as Measure,reminder: freezed == reminder ? _self.reminder : reminder // ignore: cast_nullable_to_non_nullable
as Reminder?,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as CustomIcon,
  ));
}
/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeasureCopyWith<$Res> get measure {
  
  return $MeasureCopyWith<$Res>(_self.measure, (value) {
    return _then(_self.copyWith(measure: value));
  });
}/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReminderCopyWith<$Res>? get reminder {
    if (_self.reminder == null) {
    return null;
  }

  return $ReminderCopyWith<$Res>(_self.reminder!, (value) {
    return _then(_self.copyWith(reminder: value));
  });
}/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomIconCopyWith<$Res> get icon {
  
  return $CustomIconCopyWith<$Res>(_self.icon, (value) {
    return _then(_self.copyWith(icon: value));
  });
}
}


/// Adds pattern-matching-related methods to [Habit].
extension HabitPatterns on Habit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Habit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Habit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Habit value)  $default,){
final _that = this;
switch (_that) {
case _Habit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Habit value)?  $default,){
final _that = this;
switch (_that) {
case _Habit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  Measure measure,  Reminder? reminder,  CustomIcon icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Habit() when $default != null:
return $default(_that.id,_that.name,_that.measure,_that.reminder,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  Measure measure,  Reminder? reminder,  CustomIcon icon)  $default,) {final _that = this;
switch (_that) {
case _Habit():
return $default(_that.id,_that.name,_that.measure,_that.reminder,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  Measure measure,  Reminder? reminder,  CustomIcon icon)?  $default,) {final _that = this;
switch (_that) {
case _Habit() when $default != null:
return $default(_that.id,_that.name,_that.measure,_that.reminder,_that.icon);case _:
  return null;

}
}

}

/// @nodoc


class _Habit implements Habit {
  const _Habit({required this.id, required this.name, required this.measure, this.reminder, required this.icon});
  

@override final  String id;
@override final  String name;
@override final  Measure measure;
@override final  Reminder? reminder;
@override final  CustomIcon icon;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitCopyWith<_Habit> get copyWith => __$HabitCopyWithImpl<_Habit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Habit&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.measure, measure) || other.measure == measure)&&(identical(other.reminder, reminder) || other.reminder == reminder)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,measure,reminder,icon);

@override
String toString() {
  return 'Habit(id: $id, name: $name, measure: $measure, reminder: $reminder, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$HabitCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$HabitCopyWith(_Habit value, $Res Function(_Habit) _then) = __$HabitCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, Measure measure, Reminder? reminder, CustomIcon icon
});


@override $MeasureCopyWith<$Res> get measure;@override $ReminderCopyWith<$Res>? get reminder;@override $CustomIconCopyWith<$Res> get icon;

}
/// @nodoc
class __$HabitCopyWithImpl<$Res>
    implements _$HabitCopyWith<$Res> {
  __$HabitCopyWithImpl(this._self, this._then);

  final _Habit _self;
  final $Res Function(_Habit) _then;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? measure = null,Object? reminder = freezed,Object? icon = null,}) {
  return _then(_Habit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,measure: null == measure ? _self.measure : measure // ignore: cast_nullable_to_non_nullable
as Measure,reminder: freezed == reminder ? _self.reminder : reminder // ignore: cast_nullable_to_non_nullable
as Reminder?,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as CustomIcon,
  ));
}

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeasureCopyWith<$Res> get measure {
  
  return $MeasureCopyWith<$Res>(_self.measure, (value) {
    return _then(_self.copyWith(measure: value));
  });
}/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReminderCopyWith<$Res>? get reminder {
    if (_self.reminder == null) {
    return null;
  }

  return $ReminderCopyWith<$Res>(_self.reminder!, (value) {
    return _then(_self.copyWith(reminder: value));
  });
}/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomIconCopyWith<$Res> get icon {
  
  return $CustomIconCopyWith<$Res>(_self.icon, (value) {
    return _then(_self.copyWith(icon: value));
  });
}
}

/// @nodoc
mixin _$CustomIcon {

 String get icon; String get iconColor; String get backgroundColor;
/// Create a copy of CustomIcon
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomIconCopyWith<CustomIcon> get copyWith => _$CustomIconCopyWithImpl<CustomIcon>(this as CustomIcon, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomIcon&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor));
}


@override
int get hashCode => Object.hash(runtimeType,icon,iconColor,backgroundColor);

@override
String toString() {
  return 'CustomIcon(icon: $icon, iconColor: $iconColor, backgroundColor: $backgroundColor)';
}


}

/// @nodoc
abstract mixin class $CustomIconCopyWith<$Res>  {
  factory $CustomIconCopyWith(CustomIcon value, $Res Function(CustomIcon) _then) = _$CustomIconCopyWithImpl;
@useResult
$Res call({
 String icon, String iconColor, String backgroundColor
});




}
/// @nodoc
class _$CustomIconCopyWithImpl<$Res>
    implements $CustomIconCopyWith<$Res> {
  _$CustomIconCopyWithImpl(this._self, this._then);

  final CustomIcon _self;
  final $Res Function(CustomIcon) _then;

/// Create a copy of CustomIcon
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? icon = null,Object? iconColor = null,Object? backgroundColor = null,}) {
  return _then(_self.copyWith(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomIcon].
extension CustomIconPatterns on CustomIcon {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomIcon value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomIcon() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomIcon value)  $default,){
final _that = this;
switch (_that) {
case _CustomIcon():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomIcon value)?  $default,){
final _that = this;
switch (_that) {
case _CustomIcon() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String icon,  String iconColor,  String backgroundColor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomIcon() when $default != null:
return $default(_that.icon,_that.iconColor,_that.backgroundColor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String icon,  String iconColor,  String backgroundColor)  $default,) {final _that = this;
switch (_that) {
case _CustomIcon():
return $default(_that.icon,_that.iconColor,_that.backgroundColor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String icon,  String iconColor,  String backgroundColor)?  $default,) {final _that = this;
switch (_that) {
case _CustomIcon() when $default != null:
return $default(_that.icon,_that.iconColor,_that.backgroundColor);case _:
  return null;

}
}

}

/// @nodoc


class _CustomIcon implements CustomIcon {
  const _CustomIcon({required this.icon, required this.iconColor, required this.backgroundColor});
  

@override final  String icon;
@override final  String iconColor;
@override final  String backgroundColor;

/// Create a copy of CustomIcon
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomIconCopyWith<_CustomIcon> get copyWith => __$CustomIconCopyWithImpl<_CustomIcon>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomIcon&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor));
}


@override
int get hashCode => Object.hash(runtimeType,icon,iconColor,backgroundColor);

@override
String toString() {
  return 'CustomIcon(icon: $icon, iconColor: $iconColor, backgroundColor: $backgroundColor)';
}


}

/// @nodoc
abstract mixin class _$CustomIconCopyWith<$Res> implements $CustomIconCopyWith<$Res> {
  factory _$CustomIconCopyWith(_CustomIcon value, $Res Function(_CustomIcon) _then) = __$CustomIconCopyWithImpl;
@override @useResult
$Res call({
 String icon, String iconColor, String backgroundColor
});




}
/// @nodoc
class __$CustomIconCopyWithImpl<$Res>
    implements _$CustomIconCopyWith<$Res> {
  __$CustomIconCopyWithImpl(this._self, this._then);

  final _CustomIcon _self;
  final $Res Function(_CustomIcon) _then;

/// Create a copy of CustomIcon
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? icon = null,Object? iconColor = null,Object? backgroundColor = null,}) {
  return _then(_CustomIcon(
icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String,iconColor: null == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Task {

 String get id; String get name; bool get isCompleted;
/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskCopyWith<Task> get copyWith => _$TaskCopyWithImpl<Task>(this as Task, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Task&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,isCompleted);

@override
String toString() {
  return 'Task(id: $id, name: $name, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $TaskCopyWith<$Res>  {
  factory $TaskCopyWith(Task value, $Res Function(Task) _then) = _$TaskCopyWithImpl;
@useResult
$Res call({
 String id, String name, bool isCompleted
});




}
/// @nodoc
class _$TaskCopyWithImpl<$Res>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._self, this._then);

  final Task _self;
  final $Res Function(Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Task].
extension TaskPatterns on Task {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Task value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Task() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Task value)  $default,){
final _that = this;
switch (_that) {
case _Task():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Task value)?  $default,){
final _that = this;
switch (_that) {
case _Task() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.name,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _Task():
return $default(_that.id,_that.name,_that.isCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.name,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc


class _Task implements Task {
  const _Task({required this.id, required this.name, this.isCompleted = false});
  

@override final  String id;
@override final  String name;
@override@JsonKey() final  bool isCompleted;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskCopyWith<_Task> get copyWith => __$TaskCopyWithImpl<_Task>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Task&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,isCompleted);

@override
String toString() {
  return 'Task(id: $id, name: $name, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) _then) = __$TaskCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, bool isCompleted
});




}
/// @nodoc
class __$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(this._self, this._then);

  final _Task _self;
  final $Res Function(_Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? isCompleted = null,}) {
  return _then(_Task(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$Reminder {

 DateTime get time;// required DateTime time,
 bool get vibrate; bool get sound;
/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderCopyWith<Reminder> get copyWith => _$ReminderCopyWithImpl<Reminder>(this as Reminder, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reminder&&(identical(other.time, time) || other.time == time)&&(identical(other.vibrate, vibrate) || other.vibrate == vibrate)&&(identical(other.sound, sound) || other.sound == sound));
}


@override
int get hashCode => Object.hash(runtimeType,time,vibrate,sound);

@override
String toString() {
  return 'Reminder(time: $time, vibrate: $vibrate, sound: $sound)';
}


}

/// @nodoc
abstract mixin class $ReminderCopyWith<$Res>  {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) _then) = _$ReminderCopyWithImpl;
@useResult
$Res call({
 DateTime time, bool vibrate, bool sound
});




}
/// @nodoc
class _$ReminderCopyWithImpl<$Res>
    implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._self, this._then);

  final Reminder _self;
  final $Res Function(Reminder) _then;

/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? vibrate = null,Object? sound = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,vibrate: null == vibrate ? _self.vibrate : vibrate // ignore: cast_nullable_to_non_nullable
as bool,sound: null == sound ? _self.sound : sound // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Reminder].
extension ReminderPatterns on Reminder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reminder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reminder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reminder value)  $default,){
final _that = this;
switch (_that) {
case _Reminder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reminder value)?  $default,){
final _that = this;
switch (_that) {
case _Reminder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime time,  bool vibrate,  bool sound)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reminder() when $default != null:
return $default(_that.time,_that.vibrate,_that.sound);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime time,  bool vibrate,  bool sound)  $default,) {final _that = this;
switch (_that) {
case _Reminder():
return $default(_that.time,_that.vibrate,_that.sound);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime time,  bool vibrate,  bool sound)?  $default,) {final _that = this;
switch (_that) {
case _Reminder() when $default != null:
return $default(_that.time,_that.vibrate,_that.sound);case _:
  return null;

}
}

}

/// @nodoc


class _Reminder implements Reminder {
  const _Reminder({required this.time, this.vibrate = true, this.sound = true});
  

@override final  DateTime time;
// required DateTime time,
@override@JsonKey() final  bool vibrate;
@override@JsonKey() final  bool sound;

/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderCopyWith<_Reminder> get copyWith => __$ReminderCopyWithImpl<_Reminder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reminder&&(identical(other.time, time) || other.time == time)&&(identical(other.vibrate, vibrate) || other.vibrate == vibrate)&&(identical(other.sound, sound) || other.sound == sound));
}


@override
int get hashCode => Object.hash(runtimeType,time,vibrate,sound);

@override
String toString() {
  return 'Reminder(time: $time, vibrate: $vibrate, sound: $sound)';
}


}

/// @nodoc
abstract mixin class _$ReminderCopyWith<$Res> implements $ReminderCopyWith<$Res> {
  factory _$ReminderCopyWith(_Reminder value, $Res Function(_Reminder) _then) = __$ReminderCopyWithImpl;
@override @useResult
$Res call({
 DateTime time, bool vibrate, bool sound
});




}
/// @nodoc
class __$ReminderCopyWithImpl<$Res>
    implements _$ReminderCopyWith<$Res> {
  __$ReminderCopyWithImpl(this._self, this._then);

  final _Reminder _self;
  final $Res Function(_Reminder) _then;

/// Create a copy of Reminder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? vibrate = null,Object? sound = null,}) {
  return _then(_Reminder(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,vibrate: null == vibrate ? _self.vibrate : vibrate // ignore: cast_nullable_to_non_nullable
as bool,sound: null == sound ? _self.sound : sound // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$Measure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Measure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Measure()';
}


}

/// @nodoc
class $MeasureCopyWith<$Res>  {
$MeasureCopyWith(Measure _, $Res Function(Measure) __);
}


/// Adds pattern-matching-related methods to [Measure].
extension MeasurePatterns on Measure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Quantity value)?  quantity,TResult Function( TimeMeasure value)?  time,TResult Function( Repetitions value)?  repetitions,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Quantity() when quantity != null:
return quantity(_that);case TimeMeasure() when time != null:
return time(_that);case Repetitions() when repetitions != null:
return repetitions(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Quantity value)  quantity,required TResult Function( TimeMeasure value)  time,required TResult Function( Repetitions value)  repetitions,}){
final _that = this;
switch (_that) {
case Quantity():
return quantity(_that);case TimeMeasure():
return time(_that);case Repetitions():
return repetitions(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Quantity value)?  quantity,TResult? Function( TimeMeasure value)?  time,TResult? Function( Repetitions value)?  repetitions,}){
final _that = this;
switch (_that) {
case Quantity() when quantity != null:
return quantity(_that);case TimeMeasure() when time != null:
return time(_that);case Repetitions() when repetitions != null:
return repetitions(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int amount,  String? description)?  quantity,TResult Function( int timeInMinutes)?  time,TResult Function( int count,  String? description)?  repetitions,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Quantity() when quantity != null:
return quantity(_that.amount,_that.description);case TimeMeasure() when time != null:
return time(_that.timeInMinutes);case Repetitions() when repetitions != null:
return repetitions(_that.count,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int amount,  String? description)  quantity,required TResult Function( int timeInMinutes)  time,required TResult Function( int count,  String? description)  repetitions,}) {final _that = this;
switch (_that) {
case Quantity():
return quantity(_that.amount,_that.description);case TimeMeasure():
return time(_that.timeInMinutes);case Repetitions():
return repetitions(_that.count,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int amount,  String? description)?  quantity,TResult? Function( int timeInMinutes)?  time,TResult? Function( int count,  String? description)?  repetitions,}) {final _that = this;
switch (_that) {
case Quantity() when quantity != null:
return quantity(_that.amount,_that.description);case TimeMeasure() when time != null:
return time(_that.timeInMinutes);case Repetitions() when repetitions != null:
return repetitions(_that.count,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class Quantity implements Measure {
  const Quantity({required this.amount, this.description});
  

 final  int amount;
 final  String? description;

/// Create a copy of Measure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuantityCopyWith<Quantity> get copyWith => _$QuantityCopyWithImpl<Quantity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Quantity&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,amount,description);

@override
String toString() {
  return 'Measure.quantity(amount: $amount, description: $description)';
}


}

/// @nodoc
abstract mixin class $QuantityCopyWith<$Res> implements $MeasureCopyWith<$Res> {
  factory $QuantityCopyWith(Quantity value, $Res Function(Quantity) _then) = _$QuantityCopyWithImpl;
@useResult
$Res call({
 int amount, String? description
});




}
/// @nodoc
class _$QuantityCopyWithImpl<$Res>
    implements $QuantityCopyWith<$Res> {
  _$QuantityCopyWithImpl(this._self, this._then);

  final Quantity _self;
  final $Res Function(Quantity) _then;

/// Create a copy of Measure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? description = freezed,}) {
  return _then(Quantity(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class TimeMeasure implements Measure {
  const TimeMeasure({required this.timeInMinutes});
  

 final  int timeInMinutes;

/// Create a copy of Measure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeMeasureCopyWith<TimeMeasure> get copyWith => _$TimeMeasureCopyWithImpl<TimeMeasure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeMeasure&&(identical(other.timeInMinutes, timeInMinutes) || other.timeInMinutes == timeInMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,timeInMinutes);

@override
String toString() {
  return 'Measure.time(timeInMinutes: $timeInMinutes)';
}


}

/// @nodoc
abstract mixin class $TimeMeasureCopyWith<$Res> implements $MeasureCopyWith<$Res> {
  factory $TimeMeasureCopyWith(TimeMeasure value, $Res Function(TimeMeasure) _then) = _$TimeMeasureCopyWithImpl;
@useResult
$Res call({
 int timeInMinutes
});




}
/// @nodoc
class _$TimeMeasureCopyWithImpl<$Res>
    implements $TimeMeasureCopyWith<$Res> {
  _$TimeMeasureCopyWithImpl(this._self, this._then);

  final TimeMeasure _self;
  final $Res Function(TimeMeasure) _then;

/// Create a copy of Measure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? timeInMinutes = null,}) {
  return _then(TimeMeasure(
timeInMinutes: null == timeInMinutes ? _self.timeInMinutes : timeInMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Repetitions implements Measure {
  const Repetitions({required this.count, this.description});
  

 final  int count;
 final  String? description;

/// Create a copy of Measure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RepetitionsCopyWith<Repetitions> get copyWith => _$RepetitionsCopyWithImpl<Repetitions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Repetitions&&(identical(other.count, count) || other.count == count)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,count,description);

@override
String toString() {
  return 'Measure.repetitions(count: $count, description: $description)';
}


}

/// @nodoc
abstract mixin class $RepetitionsCopyWith<$Res> implements $MeasureCopyWith<$Res> {
  factory $RepetitionsCopyWith(Repetitions value, $Res Function(Repetitions) _then) = _$RepetitionsCopyWithImpl;
@useResult
$Res call({
 int count, String? description
});




}
/// @nodoc
class _$RepetitionsCopyWithImpl<$Res>
    implements $RepetitionsCopyWith<$Res> {
  _$RepetitionsCopyWithImpl(this._self, this._then);

  final Repetitions _self;
  final $Res Function(Repetitions) _then;

/// Create a copy of Measure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? count = null,Object? description = freezed,}) {
  return _then(Repetitions(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
