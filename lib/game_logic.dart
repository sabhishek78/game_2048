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
void playGame(matrix){

  printMatrix(matrix);
  var moveCount=0;
  while(containsNumber(0,matrix)){
    moveCount++;
    print("This is the $moveCount th move");
    print("Enter l for left .Enter r for right. Enter u for up. Enter d for down");
    var move=stdin.readLineSync();
    switch(move){
      case 'l': print("Making left move");
      matrix=leftSlideMatrix(matrix);
      break;
      case 'r': print("Making right move");
      matrix=rightSlideMatrix(matrix);
      break;
      case 'u': print("Making Up move");
      matrix=upSlideMatrix(matrix);
      break;
      case 'd': print("Making Down move");
      matrix=downSlideMatrix(matrix);
      break;
    }
    matrix=add2ToEmptySpace(matrix);
    printMatrix(matrix);
    if(containsNumber(2048,matrix)){
      print("You Win!!"+"Number of Moves=$moveCount ");
    }
  }
  if(!containsNumber(2048,matrix)){
    print("Game Over!!"+"Number of Moves=$moveCount");
  }
}

bool containsNumber(int number,List<List<int>>matrix){
  for(var i=0;i<matrix.length;i++){
    for(var j=0;j<matrix.length;j++){
      if(matrix[i][j]==number){
        return true;
      }
    }}
  return false;
}
List<List<int>> initializeMatrix(){
  List<List<int>>matrix=[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]];
   matrix=add2ToEmptySpace(matrix);
   return matrix;
}

void printMatrix(matrix){
  for(var i=0;i<matrix.length;i++){
    var str='';
    for(var j=0;j<matrix[i].length;j++){
      str=str+'['+(matrix[i][j]).toString()+']';
    }
    print(str);
  }
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
List<List<int>>  leftSlideMatrix(List<List<int>> matrix) {
  for(var i=0;i<matrix.length;i++){
    matrix[i]=leftSlide(matrix[i]);
  }
  return matrix;
}
List<List<int>> rightSlideMatrix(List<List<int>> matrix) {
  for(var i=0;i<matrix.length;i++){
    matrix[i]=rightSlide(matrix[i]);
  }
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
List<List<int>> upSlideMatrix(List<List<int>> matrix){
  print("entering upslide");
  print(matrix);
  matrix=transpose(matrix);
  print("matrix after transpose");
  print(matrix);
  // console.log('transposed matrix='+matrix);
  for(var i=0;i<4;i++){
    matrix[i]=leftSlide(matrix[i]);
  }
  print('matrix after left slide');
  print(matrix);
  matrix=transpose(matrix);
  print('matrix after second transpose');
  print(matrix);
  return matrix;
}
List<List<int>>  downSlideMatrix(List<List<int>> matrix){
  matrix=transpose(matrix);
  // console.log('transposed matrix='+matrix);
  for(var i=0;i<matrix.length;i++){
    matrix[i]=rightSlide(matrix[i]);
  }
  //  console.log("matrix afterright slide="+matrix);
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
//void main(){
//  playGame();
//}

