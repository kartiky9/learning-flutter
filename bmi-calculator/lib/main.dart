import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
        sliderTheme: SliderThemeData(
          activeTrackColor: Colors.white.withOpacity(0.9),
          thumbColor: kbuttonColor,
          overlayColor: kbuttonColor.withOpacity(0.2),
          inactiveTrackColor: Colors.grey[700],
        ),
      ),      
      home: InputPage(),
    );
  }
}

