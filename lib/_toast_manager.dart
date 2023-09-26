import 'package:flutter/foundation.dart';
import 'package:flutter_toastify/_countdown_timer.dart';

typedef ToastControllersNotifier = ValueNotifier<List<ToastController>>;
typedef ToastControllers = List<ToastController>;

class ToastManager {
  ToastManager._privateConstructor();

  static final ToastManager _instance = ToastManager._privateConstructor();

  static ToastManager get instance => _instance;

  final controllers = ToastControllersNotifier([]);

  void add(ToastController toast) {
    controllers.add(toast);
  }

  void remove(ToastController toast) {
    controllers.remove(toast);
  }

  void update(ToastController toast) {
    controllers.update(toast);
  }
}

enum ToastType {
  info,
  success,
  warning,
  error,
}

class ToastController {
  ToastController({
    this.duration = const Duration(seconds: 5),
    this.onDismiss,
    required this.title,
    this.type = ToastType.info,
  }) : _key = UniqueKey() {
    _timer = CountdownTimer(duration, const Duration(milliseconds: 10));
    _timer.listen((remaining) {
      _remainingTime.value = remaining;
      if (remaining.inMicroseconds > 1) return;

      dismiss();
    });
  }

  final String title;
  final ToastType type;

  final Duration duration;
  final VoidCallback? onDismiss;
  final UniqueKey _key;
  late final CountdownTimer _timer;
  final ValueNotifier<Duration> _remainingTime = ValueNotifier(Duration.zero);

  UniqueKey get key => _key;
  ValueNotifier<Duration> get remainingTime => _remainingTime;

  void dismiss() {
    ToastManager.instance.remove(this);
    onDismiss?.call();
  }

  void dispose() {
    _timer.cancel();
  }

  ToastController copyWith({
    Duration? duration,
    VoidCallback? onDismiss,
    String? title,
    ToastType? type,
  }) {
    return ToastController(
      duration: duration ?? this.duration,
      onDismiss: onDismiss ?? this.onDismiss,
      title: title ?? this.title,
      type: type ?? this.type,
    );
  }
}

/// Extension on [ValueNotifier] to add and remove items from a list.
/// Usage:
/// - `valueNotifierList.add(valueToAdd)`
/// - `valueNotifierList.remove(valueToRemove)`
extension ValueNotifierListExtension<T> on ValueNotifier<List<T>> {
  void add(T valueToAdd) {
    value = [...value, valueToAdd];
  }

  void remove(T valueToRemove) {
    value = value.where((value) => value != valueToRemove).toList();
  }

  void update(T valueToUpdate) {
    value = value.map((value) {
      if (value == valueToUpdate) {
        return valueToUpdate;
      }

      return value;
    }).toList();
  }
}
