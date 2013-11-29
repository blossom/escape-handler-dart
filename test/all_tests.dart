library all_tests;

import 'dart:async';
import 'dart:html';

import 'package:unittest/unittest.dart';
import 'package:escape_handler/escape_handler.dart';

part 'future_matcher.dart';

main() {
  group('TaskQueue', () {
    EscapeHandler escapeHandler;
    KeyEvent escapeKeyUpEvent = new KeyEvent('keyup', keyCode: KeyCode.ESC);

    setUp(() {
      escapeHandler = new EscapeHandler();
    });

    test('should be able to add a widget and return a future', () {
      var escapePressed = escapeHandler.addWidget(1);
      expect(escapePressed, isFuture);
    });

    test('should be able to remove a widget', () {
      escapeHandler.addWidget(1);
      var removed = escapeHandler.removeWidget(1);
      expect(removed, isTrue);
    });

    test('should not throw an exceptation when removing a non added widget', () {
      var removed = escapeHandler.removeWidget(1);
      expect(removed, isFalse);
    });

//    test('should complete the future of an added widget when pressing escape', () {
//      var escapePressed = escapeHandler.addWidget(1);
//      window.dispatchEvent(escapeKeyUpEvent);
//      escapePressed.then(expectAsync1(() {}));
//    });
//
//    test('should complete the future of the youngest feature when pressing escape', () {
//      var escapePressed2 = escapeHandler.addWidget(2);
//      var escapePressed1 = escapeHandler.addWidget(1);
//      window.dispatchEvent(escapeKeyUpEvent);
//      escapePressed2.then(expectAsync1((_) {}));
//      escapePressed1.then(protectAsync1((_) =>
//          expect(true, isFalse, reason: 'Should not be reached')));
//    });
  });
}