// This is a command line app

import 'dart:io';
import 'dart:math';

enum Move{ rock, paper, scissors}

void main(){
  final rnd = Random();
  while(true){
  stdout.write('Rock, paper or scissors? (r/p/s) ');
  final input = stdin.readLineSync();
  if(input == 'r' || input == 'p' || input == 's' ){
    var playerMove;
    if(input == 'r'){
      playerMove = Move.rock;
    } else if (input == 'p'){
      playerMove = Move.paper;
    } else{
      playerMove = Move.scissors;
    }
    final random = rnd.nextInt(3);
    final aiMove = Move.values[random];

    print('You played: $playerMove');
    print('AI played: $aiMove');
    if (playerMove == aiMove){
      print('Its is a Draw');
    } else if(playerMove == Move.rock && aiMove == Move.scissors ||
    playerMove == Move.paper && aiMove == Move.paper ||
    playerMove == Move.scissors && aiMove == Move.paper){
      print('You Win');
    }else {
      print('You Lose');
    }
  } else if (input == 'q'){
    break;
  } else{
    print('Invalid input');
  }
}
  // show prompt
  // read user input from console
  // if iput is a valid move(r.p or q)
  //  choose the ai move at random
  //  compare player move with ai move
  //  show result
  // if input is q
  //  quit program
  // if anything else
  //  show invalid input

}