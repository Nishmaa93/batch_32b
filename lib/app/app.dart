import 'package:batch32/screen/arithmetic_screen.dart';
import 'package:batch32/screen/hello_world_screen.dart';
import 'package:batch32/screen/simple_interest_screen.dart';
import 'package:batch32/screen/column_screen.dart';
import 'package:flutter/material.dart';

import '../screen/calculator_app.dart';
import '../screen/column_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}
