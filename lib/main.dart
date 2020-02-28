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
  GameController newGame= GameController();
  Container buildIcon(function, icon, callback) {
    return Container(
      child: IconButton(
        icon: Icon(icon),
        iconSize: 50,
        color: Colors.blue,
        onPressed: () {
          function(callback);
          newGame.checkWinGameOver();
          setState(() {

          });
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
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              newGame.resetGame();
              setState(() {});
            },
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            details.primaryVelocity > 0
                ? newGame.leftSlideMatrix()
                : newGame.rightSlideMatrix();
            newGame.add2ToEmptySpace();
            newGame.checkWinGameOver();
            setState(() {});
          },
          onVerticalDragEnd: (DragEndDetails details) {
            details.primaryVelocity > 0 ? newGame.upSlideMatrix() : newGame.downSlideMatrix();
            newGame.add2ToEmptySpace();
            newGame.checkWinGameOver();
             setState(() {});
          },
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${newGame.moves}' + ' moves',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                RowGrid(matrix: newGame.matrix, rowNumber: 0),
                RowGrid(matrix: newGame.matrix, rowNumber: 1),
                RowGrid(matrix: newGame.matrix, rowNumber: 2),
                RowGrid(matrix: newGame.matrix, rowNumber: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    buildIcon(
                        newGame.leftRightSlideMatrix, Icons.arrow_left, newGame.leftSlide),
                    buildIcon(newGame.upDownSlideMatrix, Icons.arrow_upward, newGame.leftSlide),
                    buildIcon(
                        newGame.upDownSlideMatrix, Icons.arrow_downward, newGame.rightSlide),
                    buildIcon(
                        newGame.leftRightSlideMatrix, Icons.arrow_right, newGame.rightSlide),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: newGame.status,
                        style: DefaultTextStyle.of(context).style,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
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
      children: matrix[rowNumber].map((item) => Cell(element: item)).toList(),
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
