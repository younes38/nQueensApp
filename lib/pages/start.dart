import 'package:chess_queens/components/consts.dart';
import 'package:chess_queens/solver/queen_solver.dart';
import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  List<List<List<int>>> solutions;
  double _sliderNumeber = 4;
  int n;
  @override
  void initState() {
    solutions = QueenSolver().getSolutions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16),
          decoration: backgroudDecoration,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "WELCOME",
                  style: TextStyle(
            
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 150,
                child: Center(
                  child: Text(""),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Slider(
                      value: _sliderNumeber,
                      onChanged: (val) => setState(() => _sliderNumeber = val),
                      activeColor: Colors.amber,
                      inactiveColor: Colors.amber,
                      min: 4,
                      max: 10,
                      divisions: 6,
                      label: _sliderNumeber.toInt().toString(),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Text(
                      _sliderNumeber.toInt().toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              RaisedButton(
                onPressed: () {
                  n = _sliderNumeber.toInt();
                  List<List<int>> sol = solutions[n];

                  Navigator.of(context).pushNamed('/board', arguments: {
                    'solutions': sol,
                    'size': sol.length,
                    'n': n,
                  });
                },
                child: Text("GO"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
