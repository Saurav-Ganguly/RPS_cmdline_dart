//define rock, paper, scissor
import 'dart:convert';
import 'dart:io';
import 'dart:math';

enum PlayTypes {
  rock,
  paper,
  scissors,
}

void game() {
  var listPlayTypes = [
    PlayTypes.rock,
    PlayTypes.paper,
    PlayTypes.scissors,
  ];

  String? userInput;
  PlayTypes? compInput;

  PlayTypes getRandomValue() {
    Random rnd = new Random();
    return listPlayTypes[rnd.nextInt(listPlayTypes.length)];
  }

  String? getUserInput() {
    print(
        "Choose Rock -> 'r' / Paper -> 'p' / Scissor -> 's' or to quit press 'q'");
    var value = stdin.readLineSync(encoding: utf8);
    return value;
  }

  void output(String userInput, String compInput, String result) {
    print('> You played: $userInput');
    print('> AI played: $compInput');
    if (result != 'draw') {
      print('> You $result');
    } else {
      print('The game has resulted into a draw.');
    }
  }

  print(getRandomValue());
  while (userInput != 'q') {
    userInput = getUserInput();
    compInput = getRandomValue();

    //game logic
    switch (userInput) {
      case 'r':
        if (compInput == PlayTypes.rock) {
          output('rock', 'rock', 'draw');
        } else if (compInput == PlayTypes.paper) {
          output('rock', 'paper', 'lose :(');
        } else if (compInput == PlayTypes.scissors) {
          output('rock', 'scissors', 'win!');
        }
      case 'p':
        if (compInput == PlayTypes.rock) {
          output('paper', 'rock', 'win!');
        } else if (compInput == PlayTypes.paper) {
          output('paper', 'paper', 'draw');
        } else if (compInput == PlayTypes.scissors) {
          output('paper', 'scissors', 'lose :(');
        }
      case 's':
        if (compInput == PlayTypes.rock) {
          output('scissors', 'rock', 'lose :(');
        } else if (compInput == PlayTypes.paper) {
          output('scissors', 'paper', 'win!');
        } else if (compInput == PlayTypes.scissors) {
          output('scissors', 'scissors', 'draw');
        }
      case 'q':
        break;
      default:
        print('Please enter a valid input r / p / s or to quit enter q');
    }
  }
}
