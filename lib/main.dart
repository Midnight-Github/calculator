import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'page/calculator_page.dart';

void main() {
  runApp(const MainApp());

  doWhenWindowReady(() {
    const initialSize = Size(350, 550);
    appWindow.size = initialSize;
    // appWindow.minSize = initialSize;
    // appWindow.maxSize = const Size(1200, 800);
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage()
    );
  }
}
