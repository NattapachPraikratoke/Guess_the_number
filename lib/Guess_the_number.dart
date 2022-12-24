

import 'dart:io';

import 'game.dart';

void main() {
  bool stop = false;
  var Again ;

  var game = Game();

  late GuessResult guessResult;

  print('╔══════════════════════════════════════════════════');
  print('║                  GUESS THE NUMBER                ');
  print('║──────────────────────────────────────────────────');

  do {
    stdout.write('║  Guess the number between 1 and 100 : ');

    var input = stdin.readLineSync();

    if (input == null) {
      //print('Error, input is NULL');
      return;
    }

    var guess = int.tryParse(input);

    if (guess == null) {
      //print('Input error, please enter numbers only');
      continue;
    }

    guessResult = game.doGuess(guess);

    if (guessResult == GuessResult.correct) {
      print('║  ➜ $guess is CORRECT , total guesses: ${game.totalGuesses}');
      print('║──────────────────────────────────────────────────');
      print('║                    THE END                       ');
      print('╚══════════════════════════════════════════════════');
      stdout.write('Play again ? (Y/N) : ');
      var Again = stdin.readLineSync();
      if (Again == 'N'||Again == 'n') {
        stop = true;}
    } else if (guessResult == GuessResult.tooHigh) {
      print('║  ➜ $guess is TOO HIGH! ▲');
      print('║──────────────────────────────────────────────────');
    } else {
      print('║  ➜ $guess is TOO LOW! ▼');
      print('║──────────────────────────────────────────────────');
    }



   } while  (guessResult != GuessResult.correct || stop == false);

  }



