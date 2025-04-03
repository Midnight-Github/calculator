import 'package:flutter/material.dart';
import 'Dart:math';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String display = "0";
  String operator = "";
  String prevDisplay = "0";

  void backSpace() {
    setState(() {
      if (int.parse(display).abs().toString().length > 1) {
        display = display.substring(0, display.length - 1);
      } else {
        display = "0";
      }
    });
  }

  void clearData() {
    setState(() {
      display = "0";
      prevDisplay = "0";
      operator = "";
    });
  }

  void clearDisplay() {
    setState(() {
      display = "0";
    });
  }

  void appendToDisplay(String value) {
    if (value == "." && display.contains(".")) {
      return;
    }
    
    setState(() {
      if (display == "0") {
        display = value;
      } else {
        display += value;
      }
    });
  }

  void setOperator(String op) {
    if (display != "0" && prevDisplay != "0") {
      calculate();
    }

    setState(() {
      operator = op;
      prevDisplay = display;
      display = "0";
    });
  }

  void invertSign() {
    if (display == "0") {
      return;
    }

    setState(() {
      display = (-int.parse(display)).toString();
    });
  }

  ElevatedButton createButton(String text, Function() onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(20),
      ),
      child: Text(text),
    );
  }

  void calculate() {
    setState(() {
      switch (operator) {
        case "+":
          display = (int.parse(prevDisplay) + int.parse(display)).toString();
          break;
        case "-":
          display = (int.parse(prevDisplay) - int.parse(display)).toString();
          break;
        case "*":
          display = (int.parse(prevDisplay) * int.parse(display)).toString();
          break;
        case "/":
          display = (int.parse(prevDisplay) / int.parse(display)).toString();
          break;
        case "%":
          display = (int.parse(prevDisplay) % int.parse(display)).toString();
          break;
        case "^":
          display = pow(int.parse(prevDisplay), int.parse(display)).toString();
          break;
        default:
          break;
      }
      operator = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              display,
              style: const TextStyle(
                fontSize: 108,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              children: [
                createButton("%", () {setOperator("%");}),
                createButton("CE", clearData),
                createButton("C", clearDisplay),
                createButton("⌫", backSpace),

                createButton("^", () {setOperator("^");}),
                createButton("+/-", invertSign),
                createButton(".", () {appendToDisplay(".");}),
                createButton("/", () {setOperator("/");}),

                createButton("7", () {appendToDisplay("7");}),
                createButton("8", () {appendToDisplay("8");}),
                createButton("9", () {appendToDisplay("9");}),
                createButton("*", () {setOperator("*");}),

                createButton("4", () {appendToDisplay("4");}),
                createButton("5", () {appendToDisplay("5");}),
                createButton("6", () {appendToDisplay("6");}),
                createButton("-", () {setOperator("-");}),

                createButton("1", () {appendToDisplay("1");}),
                createButton("2", () {appendToDisplay("2");}),
                createButton("3", () {appendToDisplay("3");}),
                createButton("+", () {setOperator("+");}),
                
                createButton("", () {}),
                createButton("0", () {appendToDisplay("0");}),
                createButton("", () {}),
                createButton("=", calculate),

              ],
            ),
          ),
        ],
      ),
    );
  }
}