
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
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text(
                      matrix[0][0].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                Container(
                  child: Center(
                    child: Text(
                      matrix[0][1].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                Container(
                  child: Center(
                    child: Text(
                      matrix[0][2].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                Container(
                  child: Center(
                    child: Text(
                      matrix[0][3].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text(
                         matrix[1][0].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                Container(
                  child: Center(
                    child: Text(
                      matrix[1][1].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                Container(
                  child: Center(
                    child: Text(
                      matrix[1][2].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                Container(
                  child: Center(
                    child: Text(
                      matrix[1][3].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text(
                      matrix[2][0].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                Container(
                  child: Center(
                    child: Text(
                      matrix[2][1].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                Container(
                  child: Center(
                    child: Text(
                      matrix[2][2].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                Container(
                  child: Center(
                    child: Text(
                      matrix[2][3].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text(
                      matrix[3][0].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                Container(
                  child: Center(
                    child: Text(
                      matrix[3][1].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                Container(
                  child: Center(
                    child: Text(
                      matrix[3][2].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
                Container(
                  child: Center(
                    child: Text(
                      matrix[3][3].toString(),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: IconButton(
                    icon: Icon(Icons.arrow_left),
                    tooltip: 'Left Slide',
                    onPressed: () {
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
                  ),
                  width: 80,
                  height: 80,
                ),
                Container(
                  child: IconButton(
                    icon: Icon(Icons.arrow_upward),
                    tooltip: 'Up Slide',
                    onPressed: () {
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
                  ),
                  width: 80,
                  height: 80,
                ),
                Container(
                  child: IconButton(
                    icon: Icon(Icons.arrow_downward),
                    tooltip: 'Down Slide',
                    onPressed: () {
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
                  ),
                  width: 80,
                  height: 80,
                ),
                Container(
                  child: IconButton(
                    icon: Icon(Icons.arrow_right),
                    tooltip: 'Right Slide',
                    onPressed: () {
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
                  ),
                  width: 80,
                  height: 80,
                ),
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
        ),
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
