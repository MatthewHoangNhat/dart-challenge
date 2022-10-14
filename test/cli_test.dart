import 'package:test/test.dart';

import '../bin/exercise/divisor.dart';
import '../bin/exercise/prime_number.dart';
import '../bin/exercise/unique_element_list.dart';
import '../bin/exercise/validate_password.dart';

void main() {
  divisorTest();
  primeNumberTest();
  uniqueElementList();
  validatePassword();
}

validatePassword() {
  group('Validation password:', () {
    test('validation password', () {
      expect(ValidatePassword(password: 'hoangtrungnhat1@').execute(), true);
    });
    test('validation password without special character', () {
      expect(ValidatePassword(password: 'hoangtrungnhat1').execute(), false);
    });
    test('validation  password without number', () {
      expect(ValidatePassword(password: 'hoangtrungnhat@').execute(), false);
    });
    test('validation  password without number and special character', () {
      expect(ValidatePassword(password: 'hoangtrungnhat').execute(), false);
    });
    test(
        'validation password without lowercase letters, only has capitalize letters',
        () {
      expect(ValidatePassword(password: 'HOANGTRUNGNHAT1@').execute(), true);
    });
    test(
        'validation password without capitalize letters, only has lowercase letters',
        () {
      expect(ValidatePassword(password: 'hoangtrungnhat1@').execute(), true);
    });
  });
}

uniqueElementList() {
  group('Unique Element List:', () {
    test('All elements first array differ all elements second array', () {
      expect(
          UniqueElementList(firstArray: [1, 2, 3], secondArray: [4, 5])
              .execute(),
          [1, 2, 3, 4, 5]);
    });
    test('Some elements in first array match with second array', () {
      expect(
          UniqueElementList(firstArray: [1, 2, 3], secondArray: [3, 4])
              .execute(),
          [1, 2, 3, 4]);
    });
    test('First array has some elements, second array hasn\'t elements', () {
      expect(
          UniqueElementList(firstArray: [1, 2, 3], secondArray: []).execute(),
          [1, 2, 3]);
    });
  });
}

primeNumberTest() {
  group('Prime Number:', () {
    test('Positive number', () {
      expect(PrimeNumber(number: 0).execute(), false);
    });
    test('Real prime number', () {
      expect(PrimeNumber(number: 11).execute(), true);
    });
    test('Negative number', () {
      expect(PrimeNumber(number: -12).execute(), false);
    });
    test('Number one', () {
      expect(PrimeNumber(number: 1).execute(), true);
    });
    test('Number two', () {
      expect(PrimeNumber(number: 1).execute(), true);
    });
  });
}

divisorTest() {
  group('Divisor:', () {
    test('Divide with positive number', () {
      expect(Divisor(number: 10).execute(), [1, 2, 5, 10]);
    });
    test('Divide with negative number', () {
      expect(Divisor(number: -10).execute(), []);
    });
    test('Divide with zero', () {
      expect(Divisor(number: 0).execute(), []);
    });
    test('Divide with one', () {
      expect(Divisor(number: 1).execute(), [1]);
    });
  });
}
