import 'dart:async';

class CountdownTimer extends Stream<Duration> {
  CountdownTimer(
    Duration duration,
    this.increment, {
    Stopwatch? stopwatch,
  })  : _duration = duration,
        _stopwatch = stopwatch ?? Stopwatch(),
        _controller = StreamController<Duration>.broadcast(sync: true) {
    _timer = Timer.periodic(increment, _tick);
    _stopwatch.start();
  }

  static const _thresholdMS = 1;

  final Duration _duration;
  final Stopwatch _stopwatch;

  final Duration increment;
  final StreamController<Duration> _controller;
  late final Timer _timer;

  @override
  StreamSubscription<Duration> listen(
    void Function(Duration event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return _controller.stream.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }

  Duration get remaining => _duration - _stopwatch.elapsed;

  void cancel() {
    _stopwatch.stop();
    _timer.cancel();
    _controller.close();
  }

  void _tick(Timer timer) {
    var t = remaining;
    _controller.add(t);

    if (t.inMilliseconds < _thresholdMS) {
      cancel();
    }
  }
}
