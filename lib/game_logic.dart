// Write a function called play game which starts with empty (all 0s) 4 by 4 matrix and just one 2 at random place
// User should be able to play using the console
// l - left slide
// r - right slide
// d - up slide
// u - down slide
// With every move a 2 is added randomly into matrix

// Win - When any of the cell becomes 2048 user wins the game
// Game over - When all tiles (cells) are filled and no 2048 then game over
import 'dart:io';
import 'dart:math' show Random;
import 'main.dart';

bool containsNumber(int number,List<List<int>>matrix){
  for(var i=0;i<matrix.length;i++){
    for(var j=0;j<matrix.length;j++){
      if(matrix[i][j]==number){
        return true;
      }
    }}
  return false;
}
List<List<int>> initializeMatrix(int moves){
  List<List<int>>matrix=[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]];
   matrix=add2ToEmptySpace(matrix);
   moves=0;
   print('moves initialized to zero');
   return matrix;
}
List<List<int>> transpose(List<List<int>>matrix) {

  List<List<int>> temp=[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]];

  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      temp[j][i] = matrix[i][j];
    }
  }
  return temp;
}
List<int> rightSlide(List<int>tiles) {
  tiles=tiles.reversed.toList();
  tiles=leftSlide(tiles);
  return tiles.reversed.toList();
}
List<int> leftSlide(List<int>tiles) {
  tiles = slideZeros(tiles);
  for (var j = 0; j < tiles.length - 1; j++) {
    tiles = slideZeros(tiles);
    if (tiles[j + 1] == tiles[j]) {
      //adjacent tiles matching so perform merge
      tiles[j] = tiles[j] + tiles[j + 1]; //add
      tiles[j + 1] = 0; //create empty space
    }
  }
  return tiles;
}

List<List<int>> leftRightSlideMatrix(List<List<int>> matrix, callback,int moves) {
  for(var i=0;i<matrix.length;i++){
       matrix[i]=callback(matrix[i]);
    }
  moves++;
  print('moves'+moves.toString());
    return matrix;
  }

List<int>  slideZeros(List<int>tiles) {
  List<int> result = [];
  for (var i = 0; i < tiles.length; i++) {
    if (tiles[i] != 0) {
      result.add(tiles[i]);
    }
  }
  var zeroCount = tiles.length - result.length;
  // add zeros
  for (var i = 0; i < zeroCount; i++) {
    result.add(0);
  }
  return result;
}
List<List<int>>  upDownSlideMatrix(List<List<int>> matrix,callback,int moves){
  matrix=transpose(matrix);
  for(var i=0;i<matrix.length;i++){
   matrix[i]=callback(matrix[i]);
  }
  moves++;
  matrix=transpose(matrix);
  return matrix;
}

List<List<int>>  add2ToEmptySpace(List<List<int>> matrix){
  var row;
  var col;
  do{
    var random = new Random(); // can get a seed as a parameter

    // Integer between 0 and 100 (0 can be 100 not)
    row = random.nextInt(matrix.length);
    col = random.nextInt(matrix.length);

  }
  while(matrix[row][col]!=0);
  matrix[row][col]=2;
  return matrix;
}

