import 'package:calculator/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  late int firstNum;
  late int secondNum;
  late String history = "";
  late String textToDisplay = "";
  late String res;
  late String operation;

  void btnONclick(String btnval) {
    if (btnval == "C") {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnval == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnval == '+-') {
      if (textToDisplay[0] != '-') {
        res = '-$textToDisplay';
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnval == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnval == '+' ||
        btnval == '-' ||
        btnval == 'X' ||
        btnval == '÷') {
      firstNum = int.parse(textToDisplay);
      res = '';
      operation = btnval;
    } else if (btnval == "=") {
      secondNum = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'X') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '÷') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnval).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            alignment: const Alignment(1, 1),
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                history,
                style: GoogleFonts.rubik(
                    textStyle:
                        const TextStyle(fontSize: 24, color: Colors.grey)),
              ),
            ),
          ),
          Container(
            alignment: const Alignment(1, 1),
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                textToDisplay,
                style: GoogleFonts.rubik(
                    textStyle:
                        const TextStyle(fontSize: 42, color: Colors.grey)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                  text: "AC",
                  color: Colors.grey,
                  textcolor: Colors.white,
                  textsize: 16,
                  callback: btnONclick),
              CalculatorButton(
                  text: "C",
                  color: Colors.grey,
                  textcolor: Colors.white,
                  textsize: 30,
                  callback: btnONclick),
              CalculatorButton(
                  text: "<",
                  color: Colors.red.shade300,
                  textcolor: Colors.white,
                  textsize: 30,
                  callback: btnONclick),
              CalculatorButton(
                  text: "÷",
                  color: Colors.purple,
                  textcolor: Colors.white,
                  textsize: 30,
                  callback: btnONclick)
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            CalculatorButton(
                text: "9",
                color: Colors.white,
                textcolor: Colors.black,
                textsize: 30,
                callback: btnONclick),
            CalculatorButton(
                text: "8",
                color: Colors.white,
                textcolor: Colors.black,
                textsize: 30,
                callback: btnONclick),
            CalculatorButton(
                text: "7",
                color: Colors.white,
                textcolor: Colors.black,
                textsize: 30,
                callback: btnONclick),
            CalculatorButton(
                text: "X",
                color: Colors.purple,
                textcolor: Colors.white,
                textsize: 30,
                callback: btnONclick)
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            CalculatorButton(
                text: "6",
                color: Colors.white,
                textcolor: Colors.black,
                textsize: 30,
                callback: btnONclick),
            CalculatorButton(
                text: "5",
                color: Colors.white,
                textcolor: Colors.black,
                textsize: 30,
                callback: btnONclick),
            CalculatorButton(
                text: "4",
                color: Colors.white,
                textcolor: Colors.black,
                textsize: 30,
                callback: btnONclick),
            CalculatorButton(
                text: "-",
                color: Colors.purple,
                textcolor: Colors.white,
                textsize: 30,
                callback: btnONclick)
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            CalculatorButton(
                text: "3",
                color: Colors.white,
                textcolor: Colors.black,
                textsize: 30,
                callback: btnONclick),
            CalculatorButton(
                text: "2",
                color: Colors.white,
                textcolor: Colors.black,
                textsize: 30,
                callback: btnONclick),
            CalculatorButton(
                text: "1",
                color: Colors.white,
                textcolor: Colors.black,
                textsize: 30,
                callback: btnONclick),
            CalculatorButton(
                text: "+",
                color: Colors.purple,
                textcolor: Colors.white,
                textsize: 30,
                callback: btnONclick)
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            // Padding(padding: EdgeInsets.all(0)),
            CalculatorButton(
                text: "+-",
                color: Colors.white,
                textcolor: Colors.black,
                textsize: 19,
                callback: btnONclick),
            CalculatorButton(
                text: "0",
                color: Colors.white,
                textcolor: Colors.black,
                textsize: 30,
                callback: btnONclick),
            CalculatorButton(
                text: "00",
                color: Colors.white,
                textcolor: Colors.black,
                textsize: 17,
                callback: btnONclick),
            CalculatorButton(
                text: "=",
                color: Colors.green.shade400,
                textcolor: Colors.white,
                textsize: 30,
                callback: btnONclick)
          ])
        ],
      ),
    );
  }
}
