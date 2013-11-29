import 'dart:async';
import 'dart:html';

class EscapeHandler {
  static final EscapeHandler _escapeHandler = new EscapeHandler._internal();
  Map<int, Completer> _widgets = new Map<int, Completer>();
  var _keyUpSubscription = KeyEvent.keyUpEvent.forTarget(document.body).listen(null);

  factory EscapeHandler() {
    return _escapeHandler;
  }

  void _keyHandler(KeyEvent event) {
    if (event.keyCode == KeyCode.ESC) {
      int youngestTimestamp = _widgets.keys.fold(0, (prev, timestamp) {
        return (prev > timestamp) ? prev : timestamp;
      });
      var closeWidgetCompleter = _widgets.remove(youngestTimestamp);
      closeWidgetCompleter.complete();
    }
  }

  Future addWidget(int timestamp) {
    var closeWidgetCompleter = new Completer();
    _widgets[timestamp] = closeWidgetCompleter;
    return closeWidgetCompleter.future;
  }

  bool removeWidget(int timestamp) {
    var closeWidgetCompleter = _widgets.remove(timestamp);
    return closeWidgetCompleter != null ? true : false;
  }

  EscapeHandler._internal() {
    _keyUpSubscription.onData(_keyHandler);
  }
}