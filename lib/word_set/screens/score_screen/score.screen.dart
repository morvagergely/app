import 'dart:collection';

import 'package:app/word_set/bloc/state/word.state.dart';
import 'package:app/word_set/bloc/word.bloc.dart';
import 'package:app/word_set/screens/input_screen/widgets/word_chip_widget/word_chip.controller.dart';
import 'package:app/word_set/screens/score_screen/widgets/score_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A screen where the user can view their words, the related scores and the
/// summarized score.
class ScoreScreen extends StatelessWidget {
  /// Creates a [ScoreScreen].
  const ScoreScreen({super.key});

  int _calculateScore(
    BuildContext context, {
    required LinkedHashMap<String, WordChipController> values,
  }) {
    if (values.isEmpty) {
      return 0;
    }
    return values.entries.map((e) => e.key.length).reduce((a, b) {
      return a + b;
    });
  }

  Iterable<Widget> _buildTiles(
    BuildContext context, {
    required LinkedHashMap<String, WordChipController> values,
  }) {
    return values.entries.map((e) {
      return ScoreTile(word: e.key);
    });
  }

  Widget _buildBody(
    BuildContext context, {
    required LinkedHashMap<String, WordChipController> values,
    required int score,
  }) {
    return ListView(
      children: [
        Text('Your score: $score', textAlign: TextAlign.center),
        const Divider(),
        ..._buildTiles(context, values: values),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Score Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<WordBloc, WordState>(
          builder: (context, state) {
            final score = _calculateScore(context, values: state.values);
            return _buildBody(context, values: state.values, score: score);
          },
        ),
      ),
    );
  }
}
