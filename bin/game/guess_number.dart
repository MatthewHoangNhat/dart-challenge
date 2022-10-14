import 'dart:io';
import 'dart:math';

import '../exercise.dart';

enum GuessNumberState {
  higher,
  lower,
  equal;

  @override
  String toString() => name;
}

class GuessNumber extends Exercise {
  late Random rnd;
  int botNumber = 0;
  late int count;
  late int totalUserScore;
  late int totalBotScore;

  GuessNumber() {
    count = 0;
    rnd = Random();
  }

  refreshBotEvent() {
    botNumber = Random().nextInt(100);
  }

  GuessNumberState getAnswer(int userNumber) {
    if (userNumber > botNumber) {
      return GuessNumberState.higher;
    }
    if (userNumber < botNumber) {
      return GuessNumberState.lower;
    }

    return GuessNumberState.equal;
  }

  void fetchDataAndHandle() {
    String writeText;
    refreshBotEvent();

    print("""Type exit to quit the game
Please choose a number between 0 and 100:""");
    do {
      writeText = stdin.readLineSync() ?? '';

      int? number = int.tryParse(writeText);

      if (number != null) {
        count++;

        final userAnswer = getAnswer(number);
        print(userAnswer);
        if (userAnswer == GuessNumberState.equal) {
          break;
        }
      }
      print('__________');
    } while (writeText != 'exit');
    print('Bingo! You tried $count times\n');
  }

  @override
  execute() {
    fetchDataAndHandle();
  }
}
