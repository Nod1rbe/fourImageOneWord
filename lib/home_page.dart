// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:imageword/json.dart';

import 'package:imageword/widgets/backround_image.dart';
import 'package:imageword/widgets/check_button.dart';
import 'package:imageword/widgets/four_image.dart';
import 'package:imageword/widgets/image_model.dart';
import 'package:imageword/widgets/words.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Word> selectedWord = [];
  int activIndex = 0;
  @override
  void initState() {
    super.initState();
    wordGenerator(imagesKey[activIndex]);
    addBool();
    activIndex;
  }

  void nextButtonTaped() {
    Navigator.of(context).pop();
    setState(() {
      activIndex = activIndex + 1;
      selectedWord = [];
      wordList = [];
      letters = [];
      wordGenerator(imagesKey[activIndex]);
      addBool();
      for (var i = 0; i < wordList.length; i++) {
        wordList[i].selected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackroundImage(
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 24, right: 24, bottom: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FourImage(imageList: imagesValue[activIndex]),
                  const SizedBox(height: 20),
                  WordsFuncsion(selectedWord: selectedWord),
                  const SizedBox(height: 20),
                  CheckButton(
                    selectedWord: selectedWord,
                    correctWord: imagesKey[activIndex],
                    onTaped: nextButtonTaped,
                  )
                ],
              ))),
    );
  }
}
