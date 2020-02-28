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

class GameController{
 List<List<int>>matrix;
 String status;
 int moves;
 GameController(){
   this.matrix=[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]];
   this.status='';
   this.moves=0;
   add2ToEmptySpace();
 }
  resetGame(){
    matrix=[[0,0,0,0],[0,0,0,0],[0,0,0,0],[0,0,0,0]];
    add2ToEmptySpace();
    status='';
    moves=0;
 }
  add2ToEmptySpace(){
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

 }

 bool checkLeft(i, j) {
   return j == 0 ? false : matrix[i][j - 1] == matrix[i][j];
 }

 bool checkRight(i, j) {
   return j == 3 ? false : matrix[i][j + 1] == matrix[i][j];
 }

 bool checkUp(i, j) {
   return i == 0 ? false : matrix[i - 1][j] == matrix[i][j];
 }

 bool checkDown(i, j) {
   return i == 3 ? false : matrix[i + 1][j] == matrix[i][j];
 }

 void checkWinGameOver() {
   if (containsNumber(2048)) {
     status = 'You Win!!';
   } else {
     if (containsNumber(0,)) {
       add2ToEmptySpace();
     } else {
       // if 0 is not present check for adjacent matching
       if (!adjacentCellsMatch()) {
         status = 'Game Over';
       }
     }
   }
  // setState(() {});
 }
 bool containsNumber(int number){
   for(var i=0;i<matrix.length;i++){
     for(var j=0;j<matrix.length;j++){
       if(matrix[i][j]==number){
         return true;
       }
     }}
   return false;
 }
 List<List<int>> downSlideMatrix() => matrix = upDownSlideMatrix(rightSlide);

 List<List<int>> upSlideMatrix() => matrix = upDownSlideMatrix(leftSlide);

 List<List<int>> rightSlideMatrix() => matrix = leftRightSlideMatrix(rightSlide);

 List<List<int>> leftSlideMatrix() => matrix = leftRightSlideMatrix(leftSlide);

 List<List<int>> transpose() {

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

 List<List<int>> leftRightSlideMatrix(callback) {
   for(var i=0;i<matrix.length;i++){
     matrix[i]=callback(matrix[i]);
   }
   moves=moves+1;
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
 List<List<int>>  upDownSlideMatrix(callback){
   transpose();
   for(var i=0;i<matrix.length;i++){
     matrix[i]=callback(matrix[i]);
   }
   moves++;
   matrix=transpose();
   return matrix;
 }


 bool adjacentCellsMatch() {
   int i, j;
   bool match = false;
   for (i = 0; i < matrix.length; i++) {
     for (j = 0; j < matrix[i].length; j++) {
       match = match ||
           checkLeft(i, j) ||
           checkRight(i, j) ||
           checkUp(i, j) ||
           checkDown( i, j);
       if(match){
         return true;
       }
     }
   }
   return match;
 }
}

