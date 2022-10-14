import 'dart:io';
import 'dart:math';

import '../exercise.dart';

class CowsAndBulls extends Exercise {
  CowsAndBulls() {
    botArr = '';
    attempts = 0;
    numberCows = 0;
    numberBulls = 0;
  }

  late int attempts;
  late String botArr;
  late String userArr;
  late int numberCows;
  late int numberBulls;

  checkCows() {
    for (int i = 0; i < botArr.length; i++) {
      if (botArr[i] == userArr[i]) {
        numberCows++;
      }
    }
  }

  checkBulls() {
    for (int indexUser = 0; indexUser < userArr.length; indexUser++) {
      final int indexBot = botArr.indexOf(userArr[indexUser]);
      if (indexBot != -1 && indexUser != indexBot) {
        numberBulls++;
      }
    }
  }

  String randomChar() {
    return (Random().nextInt(8) + 1).toString();
  }

  refreshBotEvent() {
    String botNumber;
    botArr = '';
    for (int index = 0; index < 4; index++) {
      if (index == 0) {
        botArr += randomChar();
      } else {
        do {
          botNumber = randomChar();
        } while (botArr.contains(botNumber));
        botArr += botNumber;
      }
    }
  }

  resetCowsAndBulls() {
    numberBulls = 0;
    numberCows = 0;
  }

  void fetchDataAndHandle() {
    String writeText;
    refreshBotEvent();

    print("""Type exit to quit the game
Please choose a number between 0 and 100:""");
    do {
      writeText = stdin.readLineSync() ?? '';
      int? number = int.tryParse(writeText);
      if (number != null && number > 999 && number < 10000) {
        userArr = number.toString();
        attempts++;
        resetCowsAndBulls();
        checkBulls();
        checkCows();

        print('Attempts: $attempts, Cows: $numberCows, Bulls: $numberBulls');
        if (number == int.parse(botArr)) {
          break;
        }
      } else {
        print('Incorrect number. Make sure to give 4 digit number');
      }
      print('__________');
    } while (writeText != 'exit');
  }

  @override
  execute() {
    fetchDataAndHandle();
  }
}
