import 'dart:collection';

import 'package:app/word_set/bloc/event/word.event.dart';
import 'package:app/word_set/bloc/state/word.state.dart';
import 'package:app/word_set/bloc/word.bloc.dart';
import 'package:app/word_set/screens/input_screen/widgets/word_chip_widget/word_chip.controller.dart';
import 'package:app/word_set/screens/input_screen/widgets/word_chip_widget/word_chip.widget.dart';
import 'package:app/word_set/screens/score_screen/score.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _maxLength = 'pneumonoultramicroscopicsilicovolcanoconiosis'.length;

/// A screen where the user can input, add and view their words.
class InputScreen extends StatefulWidget {
  /// Creates an [InputScreen].
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _controller = TextEditingController();

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Input Screen'),
      actions: [
        IconButton(
          tooltip: 'Scoreboard',
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) {
                return const ScoreScreen();
              },
            ),
          ),
          icon: const Icon(Icons.scoreboard),
        ),
      ],
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        BlocProvider.of<WordBloc>(context).add(
          WordEventAdd(value: _controller.text),
        );
        _controller.clear();
      },
      icon: const Icon(Icons.add),
      label: const Text('Add word'),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: _controller,
      decoration: const InputDecoration(hintText: 'Type your word here'),
      inputFormatters: [
        LengthLimitingTextInputFormatter(_maxLength),
        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
      ],
    );
  }

  Widget _buildWordChips(
    BuildContext context, {
    required LinkedHashMap<String, WordChipController> values,
  }) {
    return Wrap(
      spacing: 16,
      children: values.entries
          .map(
            (entry) => WordChip(
              value: entry.key,
              controller: entry.value,
            ),
          )
          .toList(),
    );
  }

  Widget _buildFeedback(BuildContext context) {
    return BlocBuilder<WordBloc, WordState>(
      builder: (context, state) {
        return state.when(
          value: (values) {
            return Column(
              children: [
                const Text('Your valid words:'),
                const Divider(),
                _buildWordChips(context, values: values),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          _buildTextField(context),
          const SizedBox(height: 16),
          _buildFeedback(context),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }
}
