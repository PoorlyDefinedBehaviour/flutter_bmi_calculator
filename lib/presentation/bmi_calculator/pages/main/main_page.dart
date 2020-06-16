import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/domain/bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/presentation/bmi_calculator/pages/result/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/presentation/widgets/card_widget.dart'
    as Widgets;

class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

enum Gender { male, female }

class _MainpageState extends State<Mainpage> {
  Gender selectedGender = Gender.male;
  double height = 170;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Widgets.Card(
                  onTap: () => setState(() => selectedGender = Gender.male),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.mars,
                        size: 60.0,
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text('MALE', style: kLabelTextStyle)
                    ],
                  ),
                  color: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                ),
              ),
              Expanded(
                child: Widgets.Card(
                  onTap: () => setState(() => selectedGender = Gender.female),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.venus,
                        size: 60.0,
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text('FEMALE', style: kLabelTextStyle),
                    ],
                  ),
                  color: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                ),
              ),
            ],
          ),
          Widgets.Card(
            color: kInactiveCardColor,
            child: Column(
              children: <Widget>[
                Text('HEIGHT', style: kLabelTextStyle),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Text(
                      height.toInt().toString(),
                      style: TextStyle(
                        fontSize: 64.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text('cm'),
                  ],
                ),
                SliderTheme(
                  data: SliderThemeData(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    min: 120.0,
                    max: 250.0,
                    value: height,
                    onChanged: (sliderValue) =>
                        setState(() => height = sliderValue),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Widgets.Card(
                    color: kInactiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT', style: kLabelTextStyle),
                        Text('$weight', style: kNumberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                onPressed: () => setState(() => weight -= 1),
                                shape: CircleBorder(),
                                color: kActionButtonColor,
                                child: Icon(FontAwesomeIcons.minus),
                              ),
                            ),
                            Expanded(
                              child: RaisedButton(
                                onPressed: () => setState(() => weight += 1),
                                shape: CircleBorder(),
                                color: kActionButtonColor,
                                child: Icon(FontAwesomeIcons.plus),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Widgets.Card(
                    color: kInactiveCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: kLabelTextStyle),
                        Text('$age', style: kNumberStyle),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                onPressed: () => setState(() => age -= 1),
                                shape: CircleBorder(),
                                color: kActionButtonColor,
                                child: Icon(FontAwesomeIcons.minus, size: 32),
                              ),
                            ),
                            Expanded(
                              child: RaisedButton(
                                onPressed: () => setState(() => age += 1),
                                shape: CircleBorder(),
                                color: kActionButtonColor,
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  size: 32,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              final result =
                  calculateBmi(height: height, weight: weight.toDouble());

              print(result);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      title: result['title'],
                      message: result['message'],
                      bmi: result['bmi'],
                    ),
                  ));
            },
            child: Container(
              color: kCallToActionColor,
              height: 30.0,
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
