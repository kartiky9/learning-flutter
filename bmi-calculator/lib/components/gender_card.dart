import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum GenderEnum { male, female }

class GenderCard extends StatelessWidget {
  final Color cardColor;
  final GenderEnum gender;
  final Color iconColor;

  GenderCard({@required this.cardColor,@required this.gender, @required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      cardColor: cardColor,
      child: _getGenderCard(context),
    );
  }

  Widget _getGenderCard(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          (gender == GenderEnum.male)
              ? FontAwesomeIcons.mars
              : FontAwesomeIcons.venus,
          size: 80.0,
          color: iconColor,
        ),
        SizedBox(height: 10.0,),
        Text(
          (gender == GenderEnum.male) ? 'Male' : 'Female',
        )
      ],
    );
  }
}
