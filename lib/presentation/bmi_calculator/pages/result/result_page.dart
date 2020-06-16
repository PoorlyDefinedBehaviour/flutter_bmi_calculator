import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/presentation/widgets/card_widget.dart'
    as Widgets;

import '../../../../constants.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final String message;
  final String bmi;

  ResultPage({
    @required this.title,
    @required this.message,
    @required this.bmi,
  });

  Color getColorForTitle() {
    if (title == 'normal') {
      return Colors.green;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Widgets.Card(
                color: kInactiveCardColor,
                child: Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          title,
                          style: kLabelTextStyle.copyWith(
                            color: getColorForTitle(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Text(
                                bmi,
                                style: TextStyle(
                                  fontSize: 64.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text("cm"),
                            ]),
                      ),
                      Expanded(
                        child: Text(
                          message,
                          style: kLabelTextStyle.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          color: kCallToActionColor,
                          height: 30.0,
                          child: Center(
                            child: Text(
                              "RE-CALCULATE",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
