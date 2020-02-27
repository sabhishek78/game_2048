import 'package:swipedetector/swipedetector.dart';
import 'package:flutter/material.dart';
import 'game_logic.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '2048 GAME'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<int>> matrix=initializeMatrix();
  String s='';
  bool adjacentCellsMatch(matrix){
    int i,j;
    bool match=false;
    for(i=0;i<matrix.length;i++){
      for(j=0;j<matrix[i].length;j++){
        match=match|| checkLeft(matrix,i,j)||checkRight(matrix,i,j)||checkUp(matrix,i,j)||checkDown(matrix,i,j);
      }
    }
    return match;
  }
//  bool adjacentCellsMatch(matrix){
//    matrix.forEach((e)=>e.forEach((n)=>checkLeft(matrix,e[0],e[1])||checkRight(matrix,e[0],e[1])||checkUp(matrix,e[0],e[1])||checkDown(matrix,e[0],e[1])));
//  }
  bool checkLeft(matrix,i,j){
    return j==0?false:matrix[i][j-1]==matrix[i][j];
  }
  bool checkRight(matrix,i,j){
    return j==3? false:matrix[i][j+1]==matrix[i][j];
  }
  bool checkUp(matrix,i,j){
    return i==0?false:matrix[i-1][j]==matrix[i][j];
  }
  bool checkDown(matrix,i,j){
    return i==3?false:matrix[i+1][j]==matrix[i][j];
  }
  void checkWinGameOver() {
    if(containsNumber(2048, matrix)){
      s='You Win!!';
    }
    else{
      if(containsNumber(0, matrix)){
        matrix=add2ToEmptySpace(matrix);
      }
      else{// if 0 is not present check for adjacent matching
        if(!adjacentCellsMatch(matrix)){
          s='Game Over';
        }
      }
    }
    setState(() {});
  }
  Container buildIcon(function,icon,s) {
    return Container(
      child: IconButton(
        icon: Icon(icon),
        iconSize: 50,
        color: Colors.blue,
        onPressed: () {
          matrix=function(matrix,s);
          checkWinGameOver();
          },
      ),
      width: 80,
      height: 80,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GestureDetector(
            onHorizontalDragEnd: (DragEndDetails details){
              details.primaryVelocity>0?matrix=leftRightSlideMatrix(matrix,'l'):matrix=leftRightSlideMatrix(matrix,'r');
                matrix=add2ToEmptySpace(matrix);
                checkWinGameOver();
                //setState(() {});
              },
            onVerticalDragEnd: (DragEndDetails details){
              details.primaryVelocity>0?matrix=upDownSlideMatrix(matrix,'u'):matrix=upDownSlideMatrix(matrix,'d');
              matrix=add2ToEmptySpace(matrix);
              checkWinGameOver();
             // setState(() {});
            },
          child:
          Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RowGrid(matrix: matrix, rowNumber: 0),
                RowGrid(matrix: matrix, rowNumber: 1),
                RowGrid(matrix: matrix, rowNumber: 2),
                RowGrid(matrix: matrix, rowNumber: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    buildIcon(leftRightSlideMatrix, Icons.arrow_left,'l'),
                    buildIcon(upDownSlideMatrix, Icons.arrow_upward,'u'),
                    buildIcon(upDownSlideMatrix, Icons.arrow_downward,'d'),
                    buildIcon(leftRightSlideMatrix, Icons.arrow_right,'r'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: s,
                        style: DefaultTextStyle
                            .of(context)
                            .style,

                      ),
                    )
                  ],
                )
              ],
            ),
          ),),
      ),
    );

  }

}


class RowGrid extends StatelessWidget {
  const RowGrid({
    Key key,
    @required this.matrix,
    @required this.rowNumber,
  }) : super(key: key);
  final List<List<int>> matrix;
  final int rowNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: matrix[rowNumber].map((item)=> Cell(element:item)).toList(),
    );
  }
}

class Cell extends StatefulWidget {
  const Cell({
    Key key,
    @required this.element,
  }) : super(key: key);

  final int element;

  @override
  _CellState createState() => _CellState();
}

class _CellState extends State<Cell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: Center(
        child: Text(
          widget.element.toString(),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }
}
