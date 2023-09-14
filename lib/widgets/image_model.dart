// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

class Word {
  bool selected;
  String word;
  Word({
    required this.selected,
    required this.word,
  });
}

List<Word> wordList = [];

void addBool() {
  for (String stringList in letters) {
    Word wordObj = Word(selected: true, word: stringList);
    wordList.add(wordObj);
  }
}

List<String> letters = [];

void wordGenerator(String soz) {
  letters = soz.split('');

  while (letters.length < 10) {
    int randomCode = Random().nextInt(26) + 97;
    String randomHarf = String.fromCharCode(randomCode);
    letters.add(randomHarf);
  }
  letters.shuffle();
}
