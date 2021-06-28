import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var result = '';

  Widget cal_bt(textt) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          result = result + textt;
        });
      },
      child: Text(
        textt,
        style: TextStyle(
          fontSize: 18,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
    );
  }

  clear() {
    setState(() {
      result = '';
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double val = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = val.toString();
    });
  }

  update() {
    setState(() {
      result = result.substring(0, result.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 120, right: 20),
                child: Text(
                  result,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    clear();
                  },
                  child: Text(
                    'C',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
                cal_bt('%'),
                ElevatedButton(
                  onPressed: () {
                    update();
                  },
                  child: Text(
                    'D',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
                cal_bt('/'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                cal_bt('7'),
                cal_bt('8'),
                cal_bt('9'),
                cal_bt('X'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                cal_bt('4'),
                cal_bt('5'),
                cal_bt('6'),
                cal_bt('-'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                cal_bt('1'),
                cal_bt('2'),
                cal_bt('3'),
                cal_bt('+'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                cal_bt('00'),
                cal_bt('0'),
                cal_bt('.'),
                ElevatedButton(
                  onPressed: () {
                    output();
                  },
                  child: Text(
                    '=',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
