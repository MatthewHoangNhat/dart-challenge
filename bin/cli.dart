import 'composite.dart';
import 'exercise/divisor.dart';
import 'exercise/draw_square.dart';
import 'exercise/prime_number.dart';
import 'exercise/unique_element_list.dart';
import 'exercise/validate_password.dart';

Future<void> main() async {
  final composite = Composite();
  composite.add(Divisor(number: 4));
  composite.add(DrawSquare(squareSize: 3));
  composite.add(PrimeNumber(number: 11));
  composite.add(UniqueElementList(firstArray: [1, 2, 3], secondArray: [3, 4]));
  composite.add(ValidatePassword(password: 'hello1@'));

  // composite.add(CowsAndBulls());
  // composite.add(GuessNumber());
  // composite.add(GuessWord());
  // composite.add(RockPaperScissor());
  composite.execute();
}
