// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';

import 'package:imageword/widgets/image_model.dart';

// ignore: must_be_immutable
class CheckButton extends StatefulWidget {
  String correctWord;
  List<Word> selectedWord;
  CheckButton(
      {Key? key,
      required this.correctWord,
      required this.selectedWord,
      required this.onTaped})
      : super(key: key);

  VoidCallback onTaped;
  @override
  State<CheckButton> createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          String wordsss = '';
          for (var i = 0; i < widget.selectedWord.length; i++) {
            wordsss = wordsss + widget.selectedWord[i].word;
          }

          if (wordsss == widget.correctWord) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Correct'),
                  content: const Text('the word you wrote is correct'),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: widget.onTaped,
                      child: const Text('Next'),
                    ),
                  ],
                );
              },
            );
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Incorrect'),
                  content: const Text('the word you typed is incorrect'),
                  actions: <Widget>[
                    ElevatedButton(
                      onPressed: widget.onTaped,
                      child: const Text('Next'),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: const Text('check'));
  }
}
