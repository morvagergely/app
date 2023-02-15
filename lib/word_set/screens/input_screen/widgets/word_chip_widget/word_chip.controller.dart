import 'dart:async';

import 'package:app/word_set/screens/input_screen/widgets/word_chip_widget/word_chip.widget.dart';

/// A controller for the animation of a [WordChip].
class WordChipController {
  final _controller = StreamController<void>();

  /// A stream which emits `null` every time [animate] is called.
  Stream<void> get stream => _controller.stream;

  /// Makes [stream] emit null, notifying of animation start.
  void animate() {
    _controller.add(null);
  }
}
