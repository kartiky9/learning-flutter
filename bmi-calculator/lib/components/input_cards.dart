import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SliderInputCard extends StatelessWidget {
  final Color cardColor;
  final int inputValue;
  final String inputTitle;
  final String inputUnit;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;

  const SliderInputCard(
      {Key key,
      @required this.inputTitle,
      @required this.cardColor,
      this.inputUnit,
      @required this.inputValue,
      @required this.onChanged,
      this.min = 20.0,
      this.max = 300.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      cardColor: this.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(inputTitle, style: Theme.of(context).textTheme.headline5),
          SizedBox(
            height: 10.0,
          ),
          Text(this.inputValue.toString() + ' ' + this.inputUnit,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(
            height: 10.0,
          ),
          _getSliderWidget(),
        ],
      ),
    );
  }

  Widget _getSliderWidget() {
    return Slider(
      // activeColor: buttonColor,
      min: this.min,
      max: this.max,
      divisions: (this.max.toInt() - this.min.toInt()),
      onChanged: this.onChanged,
      value: this.inputValue.toDouble(),
    );
  }
}

class ButtonInputCard extends StatefulWidget {
  final Color cardColor;
  final String inputTitle;
  final int inputValue;
  final Function onAdd;
  final Function(TapDownDetails) onAddDown;
  final Function(TapUpDetails) onAddUp;
  final Function onAddCancel;
  final Function onSubstract;
  final Function(TapDownDetails) onSubstractDown;
  final Function(TapUpDetails) onSubstractUp;
  final Function onSubstractCancel;

  ButtonInputCard(
      {this.cardColor,
      this.inputTitle,
      this.inputValue,
      this.onAdd,
      this.onSubstract,
      this.onAddDown,
      this.onAddUp,
      this.onAddCancel,
      this.onSubstractDown,
      this.onSubstractUp,
      this.onSubstractCancel});

  @override
  _ButtonInputCardState createState() => _ButtonInputCardState();
}

class _ButtonInputCardState extends State<ButtonInputCard> {
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      cardColor: this.widget.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.inputTitle, style: Theme.of(context).textTheme.headline5),
          SizedBox(
            height: 10.0,
          ),
          Text(this.widget.inputValue.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10.0,
          ),
          _getButtonWidget(),
        ],
      ),
    );
  }

  Widget _getButtonWidget() {
    return Theme(
      data: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0.0,
          backgroundColor: kCardButtonColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(
            flex: 2,
          ),
          _getGestureButton(
            FontAwesomeIcons.minus,
            onTap: this.widget.onSubstract,
            onTapUp: this.widget.onSubstractUp,
            onTapDown: this.widget.onSubstractDown,
            onTapCancel: this.widget.onSubstractCancel,
          ),
          Spacer(
            flex: 1,
          ),
          _getGestureButton(
            FontAwesomeIcons.plus,
            onTap: this.widget.onAdd,
            onTapUp: this.widget.onAddUp,
            onTapDown: this.widget.onAddDown,
            onTapCancel: this.widget.onAddCancel,
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getGestureButton(IconData icon,
      {Function onTap,
      Function(TapDownDetails) onTapDown,
      Function(TapUpDetails) onTapUp,
      Function onTapCancel}) {
    const double radius = 14.0;
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kCardButtonColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(radius),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
