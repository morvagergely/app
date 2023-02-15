import 'dart:async';

import 'package:app/word_set/screens/input_screen/widgets/word_chip_widget/word_chip.controller.dart';
import 'package:flutter/material.dart';

/// A [Chip], that contains a [value], and subscribes to the
/// [controller]'s stream.
///
/// Whenever the stream of the [controller] emits, [WordChip] animates its
/// background color to highlight color, and back.
class WordChip extends StatefulWidget {
  /// Creates a [WordChip].
  const WordChip({required this.value, required this.controller, super.key});

  /// Contains a text.
  ///
  /// It is displayed in the middle of the [Chip].
  final String value;

  /// A controller used to trigger the animation of the widget's
  /// background color
  ///
  /// The widget subscribes to its stream, and animates whenever a new value
  /// is emitted.
  final WordChipController controller;

  @override
  State<WordChip> createState() => _WordChipState();
}

class _WordChipState extends State<WordChip>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorTween;

  late final StreamSubscription<void> _subscription;

  @override
  void initState() {
    _subscription = widget.controller.stream.listen((event) {
      _animate();
    });
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _colorTween = ColorTween(
      begin: Colors.black,
      end: Colors.amber[900],
    ).animate(
      _animationController,
    );

    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _animate() {
    if (!_animationController.isAnimating && mounted) {
      _animationController.animateTo(1).then((value) {
        _animationController.animateTo(0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorTween,
      builder: (context, child) {
        return Chip(
          label: Text(widget.value),
          backgroundColor: _colorTween.value,
        );
      },
    );
  }
}
