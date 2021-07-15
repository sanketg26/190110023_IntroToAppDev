import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}
class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String equationToDisplay = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;
  int intFirstNum = 0;
  int intSecondNum = 0;
  // double ans1 = 0;
  // double ans2 = 0;
  String operationToPerform = "";
  String firstNumber = "";
  String secondNumber = "";

  onclick(String number){
    setState(() {
      if(number == "C"){
        equationToDisplay ="0";
        result = "0";
        intFirstNum = 0;
        intSecondNum = 0;
        // ans1 = 0;
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      }else if(number == "Del"){
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equationToDisplay = equationToDisplay.substring(0, equationToDisplay.length -1);
        if(equationToDisplay == ""){
          equationToDisplay = "0";
        }
      }else if(number == "+" || number == "-" || number == "*" || number == "/"|| number=="%" ){
        operationToPerform = number;
        firstNumber = equationToDisplay;
        intFirstNum = int.parse(firstNumber);
        equationToDisplay = equationToDisplay + number;
      }
      else if(number == "="){
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        intSecondNum = int.parse(equationToDisplay.substring(firstNumber.length+1, equationToDisplay.length));

        if(operationToPerform == "+"){
          result = (intFirstNum+intSecondNum).toString();
        }
        if(operationToPerform == "-"){
          result = (intFirstNum-intSecondNum).toString();
        }
        if(operationToPerform == "*"){
          result = (intFirstNum*intSecondNum).toString();
        }
        if(operationToPerform == "/"){
          result = (intFirstNum/intSecondNum).toString();
        }
        if(operationToPerform == "%"){
          result = (intFirstNum*intSecondNum/100).toString();
        }
      }else{
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        if(equationToDisplay == "0"){
          equationToDisplay = number;
          expression = number;
        }
        else if(number == "="){
          equationToDisplay = equationToDisplay;
        }
        else{
          equationToDisplay = equationToDisplay + number;
          expression = expression + number;
        }
      }
    });
  }

  Widget newButton(String number, Color buttoncolor){
    return Container(
      child: RaisedButton(
        onPressed: (){
          return onclick(number);
        },
        color: buttoncolor,
        padding: EdgeInsets.all(13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
        child: Text(
          number,
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),

      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Expanded(
            //     child: Container(
            //       alignment: Alignment.bottomRight,
            //       padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
            //       child: Text(
            //         'Answer',
            //         style: TextStyle(
            //           fontStyle: FontStyle.italic,
            //           fontSize: 25.0,
            //           fontWeight: FontWeight.w800,
            //         ),
            //       ),
            //     ),
            // ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Text(
                equationToDisplay,
                style: TextStyle(
                  fontSize: equationFontSize,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Text(
                result,
                style: TextStyle(
                  fontSize: resultFontSize,
                ),
              ),
            ),
            Row(
              children: [
                newButton('C',Colors.deepOrangeAccent),
                newButton('Del',Colors.lightBlueAccent),
                newButton('%',Colors.lightBlueAccent),
                newButton('/',Colors.lightBlueAccent),
              ],
            ),
            Row(
              children: [
                newButton('7',Colors.grey),
                newButton('8',Colors.grey),
                newButton('9',Colors.grey),
                newButton('*',Colors.lightBlueAccent),
              ],
            ),
            Row(
              children: [
                newButton('4',Colors.grey),
                newButton('5',Colors.grey),
                newButton('6',Colors.grey),
                newButton('-',Colors.lightBlueAccent),
              ],
            ),
            Row(
              children: [
                newButton('1',Colors.grey),
                newButton('2',Colors.grey),
                newButton('3',Colors.grey),
                newButton('+',Colors.lightBlueAccent),
              ],
            ),

            Row(
              children: [
                newButton('00',Colors.grey),
                newButton('0',Colors.grey),
                newButton('.',Colors.grey),
                newButton('=',Colors.orangeAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


