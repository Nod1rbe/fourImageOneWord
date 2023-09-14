// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:imageword/widgets/image_model.dart';

// ignore: must_be_immutable
class WordsFuncsion extends StatefulWidget {
  List<Word> selectedWord;
  WordsFuncsion({
    Key? key,
    required this.selectedWord,
  }) : super(key: key);

  @override
  State<WordsFuncsion> createState() => _WordsFuncsionState();
}

class _WordsFuncsionState extends State<WordsFuncsion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
            spacing: 3.0,
            runSpacing: 10.0,
            children: List.generate(widget.selectedWord.length, (index) {
              return InkWell(
                  onTap: () {
                    setState(() {
                      widget.selectedWord[index].selected = true;
                      widget.selectedWord.remove(widget.selectedWord[index]);
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        border: Border.all(
                            color: const Color(0xFFFFFFFF), width: 2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        widget.selectedWord[index].word,
                        style: const TextStyle(
                            color: Color(0xFF212121),
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ));
            })),
        const SizedBox(height: 50),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 5,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                setState(() {
                  if (wordList[index].selected == true) {
                    wordList[index].selected = false;
                    widget.selectedWord.add(wordList[index]);
                  }
                });
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: wordList[index].selected == true
                          ? Colors.white
                          : Colors.transparent,
                      border: Border.all(color: const Color(0xFFFFFFFF)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      wordList[index].word,
                      style: TextStyle(
                          color: wordList[index].selected == true
                              ? Colors.black
                              : Colors.transparent,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            );
          },
          itemCount: letters.length,
        )
      ],
    );
  }
}
