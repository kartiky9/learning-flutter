import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/input_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final sizedBoxheightFactor = 0.1;
  final double horizontalPadding = 15.0;
  final double verticalPadding = 10.0;

  final String bmiResult, bmiNumber, interpretation;

  ResultPage({this.bmiResult, this.bmiNumber, this.interpretation});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: size.height * sizedBoxheightFactor,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: this.horizontalPadding),
            child: Text(
              'Your Result',
              style: Theme.of(context).textTheme.headline3.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyText2.color),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: this.horizontalPadding,
                vertical: this.verticalPadding,
              ),
              child: ReusableCard(
                cardColor: kCardBackgroundColor,
                child: _getResultWidget(),
              ),
            ),
          ),
          InkResponse(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              color: kbuttonColor,
              width: double.infinity,
              height: size.height * buttonHeightFactor,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'RE-CALCULATE',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(fontSize: 25.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getResultWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          this.bmiResult.toUpperCase(),
          style: kResultTextStyle,
        ),
        Text(
          this.bmiNumber,
          style: kBMITextStyle,
        ),
        Text(
          this.interpretation,
          style: kbodyTextStyle,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
