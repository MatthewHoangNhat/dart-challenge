import '../exercise.dart';

class Divisor extends Exercise {
  Divisor({required this.number});
  final int number;

  List<int> _divisor(int number) {
    List<int> divisors = [];
    for (int i = 1; i <= number; i++) {
      if (number % i == 0) {
        divisors.add(i);
      }
    }
    return divisors;
  }

  @override
  List<int> execute() {
    return (_divisor(number));
  }
}
