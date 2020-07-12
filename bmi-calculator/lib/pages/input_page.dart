import 'dart:async';

import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:bmi_calculator/components/gender_card.dart';
import 'package:bmi_calculator/components/input_cards.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';

const double buttonHeightFactor = 0.08;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int heightValue = 100;
  int weight = 50;
  int age = 25;
  bool isMale = true;
  Timer timer;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: InkResponse(
                    onTap: () {
                      setState(() {
                        this.isMale = true;
                      });
                    },
                    child: GenderCard(
                      cardColor: this.isMale
                          ? kCardBackgroundColor
                          : kCardBackgroundColorInActive,
                      gender: GenderEnum.male,
                      iconColor: this.isMale
                          ? Theme.of(context).iconTheme.color
                          : kCardIconColorInActive,
                    ),
                  ),
                ),
                Expanded(
                  child: InkResponse(
                    onTap: () {
                      setState(() {
                        this.isMale = false;
                      });
                    },
                    child: GenderCard(
                      cardColor: this.isMale
                          ? kCardBackgroundColorInActive
                          : kCardBackgroundColor,
                      gender: GenderEnum.female,
                      iconColor: this.isMale
                          ? kCardIconColorInActive
                          : Theme.of(context).iconTheme.color,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SliderInputCard(
              cardColor: kCardBackgroundColor,
              inputTitle: 'HEIGHT',
              inputUnit: 'cm',
              inputValue: heightValue,
              onChanged: (double value) {
                setState(() {
                  this.heightValue = value.toInt();
                });
              },
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ButtonInputCard(
                    cardColor: kCardBackgroundColor,
                    inputTitle: 'WEIGHT',
                    inputValue: this.weight,
                    onAdd: () {
                      setState(() {
                        this.weight++;
                      });
                    },
                    onAddDown: (TapDownDetails details) {
                      timer =
                          Timer.periodic(Duration(milliseconds: 100), (timer) {
                        setState(() {
                          this.weight++;
                        });
                      });
                    },
                    onAddUp: (TapUpDetails details) {
                      timer.cancel();
                    },
                    onAddCancel: () {
                      timer.cancel();
                    },
                    onSubstract: () {
                      setState(() {
                        this.weight--;
                      });
                    },
                    onSubstractDown: (TapDownDetails details) {
                      timer =
                          Timer.periodic(Duration(milliseconds: 100), (timer) {
                        setState(() {
                          this.weight--;
                        });
                      });
                    },
                    onSubstractUp: (TapUpDetails details) {
                      timer.cancel();
                    },
                    onSubstractCancel: () {
                      timer.cancel();
                    },
                  ),
                ),
                Expanded(
                  child: ButtonInputCard(
                    cardColor: kCardBackgroundColor,
                    inputTitle: 'AGE',
                    inputValue: this.age,
                    onAdd: () {
                      setState(() {
                        this.age++;
                      });
                    },
                    onAddDown: (TapDownDetails details) {
                      timer =
                          Timer.periodic(Duration(milliseconds: 100), (timer) {
                        setState(() {
                          this.age++;
                        });
                      });
                    },
                    onAddUp: (TapUpDetails details) {
                      timer.cancel();
                    },
                    onAddCancel: () {
                      timer.cancel();
                    },
                    onSubstract: () {
                      setState(() {
                        this.age--;
                      });
                    },
                    onSubstractDown: (TapDownDetails details) {
                      timer =
                          Timer.periodic(Duration(milliseconds: 100), (timer) {
                        setState(() {
                          this.age--;
                        });
                      });
                    },
                    onSubstractUp: (TapUpDetails details) {
                      timer.cancel();
                    },
                    onSubstractCancel: () {
                      timer.cancel();
                    },
                  ),
                ),
              ],
            ),
          ),
          InkResponse(
            onTap: () {
              CalculateBMI calc = CalculateBMI(weight: this.weight, height: this.heightValue);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext buildContext) {
                  return ResultPage(
                    bmiNumber: calc.calculateMyBMI(),
                    bmiResult: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  );
                },
              ));
            },
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              color: kbuttonColor,
              width: double.infinity,
              height: size.height * buttonHeightFactor,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Calculate BMI',
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
}
