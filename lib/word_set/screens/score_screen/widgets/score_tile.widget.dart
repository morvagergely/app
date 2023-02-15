import 'package:flutter/material.dart';

/// Displays a tile of the [word] and the related score.
class ScoreTile extends StatelessWidget {
  /// Creates a [ScoreTile].
  const ScoreTile({required this.word, super.key});

  /// The word that is displayed.
  ///
  /// It is used to calculate the score too.
  /// The score equals the number of characters in [word].
  final String word;

  Widget _buildWord(BuildContext context) {
    return Text(
      word,
      overflow: TextOverflow.fade,
    );
  }

  Widget _buildScore(BuildContext context) {
    return Text(word.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black,
      ),
      child: Row(
        children: [
          Expanded(child: _buildWord(context)),
          const Spacer(),
          _buildScore(context),
        ],
      ),
    );
  }
}
