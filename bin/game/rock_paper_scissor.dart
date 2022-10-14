import 'dart:io';
import 'dart:math';

import '../exercise.dart';

enum RockPaperScissorEvent {
  paper,
  scissor,
  rock;

  @override
  String toString() => name;
}

enum RockPaperScissorState {
  win,
  lose,
  draw;

  @override
  String toString() => name;
}

class RockPaperScissor extends Exercise {
  late Random rnd;
  late List<RockPaperScissorEvent> gameEvents;
  late RockPaperScissorEvent botEvent;
  late int totalUserScore;
  late int totalBotScore;

  RockPaperScissor() {
    totalUserScore = 0;
    totalBotScore = 0;
    botEvent = RockPaperScissorEvent.rock;
    gameEvents = List.from(RockPaperScissorEvent.values);
    rnd = Random();
  }

  refreshBotEvent() {
    int index = Random().nextInt(RockPaperScissorEvent.values.length);
    botEvent = gameEvents.elementAt(index);
  }

  RockPaperScissorState getAnswer(
      RockPaperScissorEvent userEvent, RockPaperScissorEvent botEvent) {
    if (userEvent == botEvent) {
      totalBotScore++;
      totalUserScore++;
      return RockPaperScissorState.draw;
    }
    switch (userEvent) {
      case RockPaperScissorEvent.paper:
        if (botEvent == RockPaperScissorEvent.rock) {
          totalUserScore++;

          return RockPaperScissorState.win;
        }

        totalBotScore++;

        return RockPaperScissorState.lose;

      case RockPaperScissorEvent.rock:
        if (botEvent == RockPaperScissorEvent.scissor) {
          totalUserScore++;
          return RockPaperScissorState.win;
        }
        totalBotScore++;

        return RockPaperScissorState.lose;

      case RockPaperScissorEvent.scissor:
        if (botEvent == RockPaperScissorEvent.paper) {
          totalUserScore++;
          return RockPaperScissorState.win;
        }
        totalBotScore++;

        return RockPaperScissorState.lose;
    }
  }

  RockPaperScissorEvent? strToUserEvent(String? selection) {
    if (selection == null) return null;
    switch (selection) {
      case 'Rock':
      case 'rock':
      case 'r':
      case 'R':
        return RockPaperScissorEvent.rock;

      case 'Paper':
      case 'paper':
      case 'pp':
      case 'p':
        return RockPaperScissorEvent.paper;

      case 'Scissor':
      case 'scissor':
      case 'sc':
      case 's':
        return RockPaperScissorEvent.scissor;

      default:
        return null;
    }
  }

  void fetchDataAndHandle() {
    String? selection;
    print("""Welcome to Rock, Paper, Scissors. \nType 'exit' to stop the game
Please choose Rock, Paper or Scissors:""");
    do {
      selection = stdin.readLineSync();
      final userEvent = strToUserEvent(selection);
      refreshBotEvent();
      if (userEvent != null) {
        print('user: $userEvent');
        print('bot: $botEvent');
        print('RESULT: ${getAnswer(userEvent, botEvent)}');
      }
      print('__________');
    } while (selection != 'exit');
    print('TOTAL USER SCORE: $totalUserScore');
    print('TOTAL BOT SCORE: $totalBotScore');
  }

  @override
  execute() {
    fetchDataAndHandle();
  }
}
