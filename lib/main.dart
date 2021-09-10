import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        //brightness: Brightness.dark,
        primaryColor: Color(0xFF26313D),
         scaffoldBackgroundColor: Color(0xFF26313D),
      ),
      home: InputPage(),
      // routes: {
      //   'input':(context)=>InputPage(),
      //   'result':(context)=>ResultsPage(),
      // },
    );
  }
}


