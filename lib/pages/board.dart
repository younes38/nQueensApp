import 'package:chess_queens/components/consts.dart';
import 'package:flutter/material.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  double width;
  int n;
  List<List<int>> solutions;
  int index;
  int size;
  //return list of rows

  List<Widget> buildRows(int n, List<int> place) {
    List<Widget> rows = new List(n);
    width -= 16 * 2 + 5 * n;
    width = width / n;
    for (int i = 0; i < n; i++) {
      List<Widget> col = List(n);
      for (int j = 0; j < n; j++) {
        col[j] = Container(
          width: width,
          height: width,
          //color: place[j] == i ? Colors.amberAccent : Colors.grey,
          color: (i + j).isOdd ? Colors.white : Colors.black,
          //margin: EdgeInsets.all(2),
          child: place[j] == i
              ?  SizedBox(
      height: 33,
      width: 99,
      child: Image.asset(
        'assets/chess.png',
        height: 25,
        color: Colors.blueAccent,
      ),
    )
              : null,
        );
      }
      rows[i] = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: col,
      );
    }

    return rows;
  }

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  void _goRight() {
    setState(() {
      index += 1;
      index %= size;
    });
  }

  void _goLeft() {
    setState(() {
      index -= 1;
      index %= size;
    });
  }

  Map data;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    data = ModalRoute.of(context).settings.arguments;
    n = data['n'];
    size = data['size'];
    solutions = data["solutions"];

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: backgroudDecoration,
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                
                child: Text(
                  "There are $size Solutions for $n X $n chess board",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  
                ),
                color: Colors.black
              ),
              SizedBox(
                height: 10,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey[400],
                radius: 40,
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildRows(n, solutions[index]),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(12),
                //color: Colors.blue,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        child: Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.chevron_left,
                            size: 50,
                          ),
                        ),
                        onTap: () => _goLeft(),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        child: Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.chevron_right,
                            size: 50,
                          ),
                        ),
                        onTap: () => _goRight(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
