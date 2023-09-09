import 'package:flutter/material.dart';


class BasicCalculator extends StatefulWidget {
  @override
  _BasicCalculatorState createState() => _BasicCalculatorState();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  String output = "";
  String input = "";
  String result = "";
  double num1 = 0.0;
  double num2 = 0.0;
  String operator = "";

  void _onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        output = "";
        input = "";
        num1 = 0.0;
        num2 = 0.0;
        operator = "";
        result = "";
      }else if(value == "CE"){
        setState(() {
          if (input.isNotEmpty) {
            input = input.substring(0, input.length - 1);
            output = output.substring(0, output.length - 1);
          }
        });
      }
      else if(value == "(" || value == ")"){
        input += value;

      }
      else if(value == "." || value == "0" || value == "00" || value == "1" || value == "2" || value == "3" || value == "4" || value == "5" || value == "6" || value == "7" || value == "8" || value == "9"){
        input += value;
        output += value;
      }
      else if (value == "+" || value == "-" || value == "*" || value == "/" || value=="%") {
        operator = value;
        input += value;
        num1 = double.parse(output);
        output = "";
      } else if (value == "=") {
        num2 = double.parse(output);
        if (operator == "+") {
          result = (num1 + num2).toString();
          output = result;
        } else if (operator == "-") {
          result = (num1 - num2).toString();
          output = result;
        } else if (operator == "*") {
          result = (num1 * num2).toString();
          output = result;
        } else if (operator == "/") {
          result = (num1 / num2).toStringAsFixed(10);
          output = result;
        }
        else if (operator == "%") {
          result = ((num1 * num2)/100).toString();
        }
        operator = "";
        num1 = 0.0;
        num2 = 0.0;
      } else {
        output += value;
      }
    });
  }

  Widget constructButton(String value) {
    final Color buttonsCOlor = Color(0xFF0B344F);
    return Expanded(

      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(buttonsCOlor),
          // Change this color
        ),
        onPressed: () => _onButtonPressed(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 30.0,),
        ),
      ),
    );
  }

  Widget constructLastBuildButton(String value) {
    final Color buttonsCOlor = Color(0xFF0B344F);
    return Container(
      width: 100,
      height: 58,
      child: ElevatedButton(

        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: MaterialStateProperty.all<Color>(buttonsCOlor),
          // Change this color
        ),
        onPressed: () => _onButtonPressed(value),
        child: Text(
          value,
          style: TextStyle(fontSize: 30.0,),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final Color appbarAndBody = Color(0xFF0E2433);
    final Color buttonsCOlor = Color(0xFF0B344F);

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
        backgroundColor: appbarAndBody,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
        toolbarHeight: 60,
        leading: Icon(Icons.menu),
        elevation: 0,

      ),
      body: Form(

        child: Column(

          children: <Widget>[
            Container(
              color: appbarAndBody,
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Column(
                children: [
                  Text(
                    input.toString(),
                    style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(
                    height: 125.5,
                  ),

                  Text(
                    result,
                    style: TextStyle(fontSize: 49.90, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],

              ),
            ),
            SizedBox(
              height: 0,
            ),
            Container(
              decoration: BoxDecoration(
                color: buttonsCOlor,
              ),
              child: Column(
                children: [
                  Row(

                    children: <Widget>[
                      ElevatedButton(

                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor: MaterialStateProperty.all<Color>(buttonsCOlor),
                          // Change this color
                        ),
                        onPressed: () => _onButtonPressed("down"),
                        child: Icon(Icons.arrow_drop_down),
                      ),
                      constructButton("C"),
                      ElevatedButton(

                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor: MaterialStateProperty.all<Color>(buttonsCOlor),
                          // Change this color
                        ),
                        onPressed: () => _onButtonPressed("CE"),
                        child: Icon(Icons.close),
                      ),
                      constructButton("/"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      constructButton("("),
                      constructButton(")"),
                      constructButton("%"),
                      constructButton("*"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      constructButton("1"),
                      constructButton("2"),
                      constructButton("3"),
                      constructButton("-"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      constructButton("4"),
                      constructButton("5"),
                      constructButton("6"),
                      constructButton("+"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              constructLastBuildButton("7"),
                              constructLastBuildButton("8"),
                              constructLastBuildButton("9"),
                            ],
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              constructLastBuildButton("0"),
                              constructLastBuildButton("00"),
                              constructLastBuildButton("."),
                            ],
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Container(
                            width: 92,
                            height: 116,

                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(0),
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF296D98)),
                                // Change this color
                              ),
                              onPressed: () => _onButtonPressed("="),
                              child: Text(
                                "=",
                                style: TextStyle(fontSize: 30.0,),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
