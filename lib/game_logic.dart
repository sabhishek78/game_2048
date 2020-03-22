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


class GameController{
  List<List<int>> matrix;
  List<List<int>>previousMatrix;

  List<List<int>> initializeMatrix(){
    List<List<int>> matrix=[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]];
    matrix=add2ToEmptySpace(matrix);
    return matrix;
  }

  List<List<int>> add2ToEmptySpace(List<List<int>> matrix){
    var row;
    var col;
    do{
      var rng = new Random();
      row =rng.nextInt(matrix.length);
      col= rng.nextInt(matrix.length);
    }
    while(matrix[row][col]!=0);
    matrix[row][col]=2;
    return matrix;
  }
  bool containsNumber(number,matrix){
    for(var i=0;i<matrix.length;i++){
      for(var j=0;j<matrix.length;j++){
        if(matrix[i][j]==number){
          return true;
        }
      }}
    return false;
  }
  List<List<int>> transpose(List<List<int>> matrix) {
    List<List<int>> temp=initializeMatrix();
    for(var i=0;i<matrix.length;i++){
      for(var j=0;j<matrix.length;j++){
        temp[i][j]=matrix[j][i];
      }
    }
    return temp;
  }
  void printMatrix(List<List<int>> matrix){
    for(var i=0;i<matrix.length;i++){
      var str='';
      for(var j=0;j<matrix.length;j++){
        str=str+'['+matrix[i][j].toString()+']';
      }
      print(str);
    }
  }
  List<List<int>> leftSlideMatrix(List<List<int>> matrix) {
    for(var i=0;i<matrix.length;i++){
      matrix[i]=leftSlide(matrix[i]);
    }
    return matrix;
  }
  List<List<int>> rightSlideMatrix(List<List<int>>matrix) {
    for(var i=0;i<matrix.length;i++){
      matrix[i]=rightSlide(matrix[i]);
    }
    return matrix;
  }
  List<List<int>> upSlideMatrix(List<List<int>>matrix){
    matrix=transpose(matrix);
    for(var i=0;i<matrix.length;i++){
      matrix[i]=leftSlide(matrix[i]);
    }
    matrix=transpose(matrix);
    return matrix;
  }
  List<List<int>> downSlideMatrix(List<List<int>>matrix){
    matrix=transpose(matrix);
    for(var i=0;i<matrix.length;i++){
      matrix[i]=rightSlide(matrix[i]);
    }
    matrix=transpose(matrix);
    return matrix;
  }


  List<int> rightSlide(tiles) {
    tiles=tiles.reversed.toList();
    tiles=leftSlide(tiles);
    return tiles.reversed.toList();
  }
  List<int> leftSlide(tiles) {
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

  List<int> slideZeros(tiles) {
    List<int> result = [];
    for (var i = 0; i < tiles.length; i++) {
      if (tiles[i] != 0) {
        result.add(tiles[i]);
      }
    }
    var zeroCount = tiles.length - result.length;
    for (var i = 0; i < zeroCount; i++) {
      result.add(0);
    }
    return result;
  }
}
void main(){
  GameController newGame= GameController();
 newGame.matrix=newGame.initializeMatrix();
  newGame.printMatrix(newGame.matrix);
  var moveCount=0;
  while(newGame.containsNumber(0,newGame.matrix)){
    moveCount++;
    print('This is the $moveCount th move');
    print("Enter l for left .Enter r for right. Enter u for up. Enter d for down");
    var move=stdin.readLineSync();
    switch(move){
      case 'l': print("Making left move");
      newGame.matrix=newGame.leftSlideMatrix(newGame.matrix);
      break;
      case 'r': print("Making right move");
      newGame.matrix=newGame.rightSlideMatrix(newGame.matrix);
      break;
      case 'u': print("Making Up move");
      newGame.matrix=newGame.upSlideMatrix(newGame.matrix);
      break;
      case 'd': print("Making Down move");
      newGame.matrix=newGame.downSlideMatrix(newGame.matrix);
      break;
    }
    newGame.matrix=newGame.add2ToEmptySpace(newGame.matrix);
    newGame.printMatrix(newGame.matrix);
    if(newGame.containsNumber(2048,newGame.matrix)){
      print("You Win!!"+"Number of Moves=$moveCount");
    }
  }
  if(!newGame.containsNumber(2048,newGame.matrix)){
    print("Game Over!!"+"Number of Moves=$moveCount");
  }
}













