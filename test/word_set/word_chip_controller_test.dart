import 'package:app/word_set/screens/input_screen/widgets/word_chip_widget/word_chip.controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Word chip controller stream should emit when animate is called', () {
    final controller = WordChipController();

    expectLater(controller.stream, emits(null));
    controller.animate();
  });
}
