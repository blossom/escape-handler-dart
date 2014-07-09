# EscapeHandler

An easy-to-use library for managing widget behaviour when the ESC keyboard event
is fired.

# Example

	import 'package:escape_handler/escape_handler.dart';

    EscapeHandler escapeHandler;

	// when a widget becomes active
	var elementTimestamp = new DateTime.now().millisecondsSinceEpoch;
	var escapePressedForCurrentComponent = escapeHandler.addWidget(elementTimestamp);
    escapePressedForCurrentComponent.then((_) {
      // undo the changes or close the widget
    });

	// when a widget gets deactivated
    escapeHandler.removeWidget(elementTimestamp);

# Background

We care about providing a great user experience and having a proper behaviour on
pressing ESC is part of that. For example in an unsaved input field you should
be able to undo your changes. Popovers and Overlays should be closed.

Since you might have a popover inside an overlay each of the components need to
know if it should react on the keyboard event. To achieve this we use a
Singleton object where you are able to register a widget.

# Install

EscapeHandler is a pub package. To install it you can add it to pubspec.yaml. For example:

    name: my-app
    dependencies:
      escape_handler: any

# Support

You can file issues at https://github.com/blossom/escape-handler-dart/issues

Pull requests are very welcome :)

# Testsuite

TODO

# Trivia

This library is a by-product of our Dart efforts at [Blossom](https://www.blossom.io).
