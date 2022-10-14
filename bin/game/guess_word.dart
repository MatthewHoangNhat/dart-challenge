import 'dart:io';
import 'dart:math';

import '../exercise.dart';

enum GuessWordState {
  match,
  notMatch;

  @override
  String toString() => name;
}

class GuessWord extends Exercise {
  late Random rnd;
  late String botWord;
  late int count;

  late List<String> hintWord;

  GuessWord() {
    botWord = '';
    hintWord = [];
    count = 0;
  }

  printHintWord() {
    String str = '';
    for (int index = 0; index < hintWord.length; index++) {
      str += '${hintWord[index]} ';
    }

    print(str);
  }

  refreshBotEvent() {
    botWord = 'GoldenOwl'.toLowerCase();
    hintWord.addAll(List.generate(botWord.length, (value) => "_"));
  }

  GuessWordState getAnswer(String userLetter) {
    if (botWord.contains(userLetter.toLowerCase())) {
      for (int index = 0; index < botWord.length; index++) {
        if (botWord[index] == userLetter.toLowerCase()) {
          hintWord[index] = botWord[index];
        }
      }
      return GuessWordState.match;
    }

    return GuessWordState.notMatch;
  }

  void fetchDataAndHandle() {
    String letter;
    refreshBotEvent();

    print("""Please guess a letter:""");
    do {
      printHintWord();
      letter = stdin.readLineSync() ?? '';
      getAnswer(letter);
      count++;
      if (hintWord.contains('_') == false) {
        break;
      }
    } while (letter != 'exit');
    print('Bingo! You tried $count times\n');
  }

  @override
  execute() {
    fetchDataAndHandle();
  }
}
