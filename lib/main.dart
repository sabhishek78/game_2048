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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SwipeDetector(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RowGrid(matrix: matrix,rowNumber: 0),
              RowGrid(matrix: matrix,rowNumber: 1),
              RowGrid(matrix: matrix,rowNumber: 2),
              RowGrid(matrix: matrix,rowNumber: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildContainer(leftSlideMatrix,Icons.arrow_left),
                  buildContainer(upSlideMatrix,Icons.arrow_upward),
                  buildContainer(downSlideMatrix,Icons.arrow_downward),
                  buildContainer(rightSlideMatrix,Icons.arrow_right),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: s,
                      style: DefaultTextStyle.of(context).style,

                    ),
                  )
                ],
              )
            ],
          ),onSwipeUp: () {
            print("Swip up detected");
          matrix=upSlideMatrix(matrix);
          containsNumber(2048, matrix)? s='You Win!!': matrix=add2ToEmptySpace(matrix);
          if(containsNumber(0, matrix)){
            setState(() {
            });
          }else{
            s='Game over';
            setState(() {
            });
          }

        },
          onSwipeDown: () {
            matrix=downSlideMatrix(matrix);
            containsNumber(2048, matrix)? s='You Win!!': matrix=add2ToEmptySpace(matrix);
            if(containsNumber(0, matrix)){
              setState(() {
              });
            }else{
              s='Game over';
              setState(() {
              });
            }

          },
          onSwipeLeft: () {
            matrix=leftSlideMatrix(matrix);
            containsNumber(2048, matrix)? s='You Win!!': matrix=add2ToEmptySpace(matrix);
            if(containsNumber(0, matrix)){
              setState(() {
              });
            }else{
              s='Game over';
              setState(() {
              });
            }

          },
          onSwipeRight: () {
            matrix=rightSlideMatrix(matrix);
            containsNumber(2048, matrix)? s='You Win!!': matrix=add2ToEmptySpace(matrix);
            if(containsNumber(0, matrix)){
              setState(() {
              });
            }else{
              s='Game over';
              setState(() {
              });
            }

          },
          swipeConfiguration: SwipeConfiguration(
              verticalSwipeMinVelocity: 100.0,
              verticalSwipeMinDisplacement: 50.0,
              verticalSwipeMaxWidthThreshold:100.0,
              horizontalSwipeMaxHeightThreshold: 50.0,
              horizontalSwipeMinDisplacement:50.0,
              horizontalSwipeMinVelocity: 200.0),
        )
        ),
      ) ;// This trailing comma makes auto-formatting nicer for build methods.

  }

  Container buildContainer(function,icon) {
    return Container(
                  child: IconButton(
                    icon: Icon(icon),
                    iconSize: 50,
                    color: Colors.blue,

                    onPressed: () {
                      matrix=function(matrix);
                      containsNumber(2048, matrix)? s='You Win!!': matrix=add2ToEmptySpace(matrix);
                      if(containsNumber(0, matrix)){
                        setState(() {
                        });
                      }else{
                       s='Game over';
                       setState(() {
                       });
                      }

                    },
                  ),
                  width: 80,
                  height: 80,
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
      children: <Widget>[
//        for(int i=0;i<4;i++){  //have to ask
//          Cell(element: matrix[rowNumber][i]) ;
//        }
        Cell(element: matrix[rowNumber][0]),
        Cell(element: matrix[rowNumber][1]),
        Cell(element: matrix[rowNumber][2]),
        Cell(element: matrix[rowNumber][3]),
      ],
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
