import 'dart:math';

import '../exercise.dart';

class PrimeNumber extends Exercise {
  PrimeNumber({required this.number});
  int number;
  bool _isPrimeNumber(int number) {
    if (number > 0 && number < 4) return true;
    if (number < 1) return false;

    for (int index = 2; index <= sqrt(number).round(); index++) {
      if (number % index == 0) return false;
    }
    return true;
  }

  @override
  bool execute() {
    return _isPrimeNumber(number);
  }
}
