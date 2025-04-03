import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String display = "0";

  void updateDisplay(String value) {
    setState(() {
      if (display == "0") {
        display = value;
      } else {
        display += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            display,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text("")
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}