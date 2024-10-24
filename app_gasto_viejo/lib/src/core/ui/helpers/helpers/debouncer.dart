import 'dart:async';
import 'dart:ui';

class Debouncer {
  Duration? delay;
  Timer? _timer;
  VoidCallback? _callback;

  Debouncer({this.delay = const Duration(seconds: 3)});

  void debounce(VoidCallback callback) {
    _callback = callback;

    cancel();
    _timer = Timer(delay!, flush);
  }

  void cancel() {
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  void flush() {
    _callback!();
    cancel();
  }
}
