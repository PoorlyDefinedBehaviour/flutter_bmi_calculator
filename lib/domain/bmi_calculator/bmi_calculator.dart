import 'dart:math';
import 'package:meta/meta.dart';

Map<String, String> calculateBmi(
    {@required double height, @required double weight}) {
  final bmi = weight / pow(height / 100, 2);

  if (bmi < 18.5) {
    return {
      'bmi': bmi.toStringAsFixed(1),
      'title': 'underweight',
      'message': 'you need to exercise more'
    };
  }
  if (bmi <= 25) {
    return {
      'bmi': bmi.toStringAsFixed(1),
      'title': 'normal',
      'message': 'you are good, but keep exercising'
    };
  }
  return {
    'bmi': bmi.toStringAsFixed(1),
    'title': 'overweight',
    'message': 'fat boi',
  };
}
