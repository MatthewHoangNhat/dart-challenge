import '../exercise.dart';

class ValidatePassword extends Exercise {
  ValidatePassword({required this.password});
  String password;
  bool isValidationPassword(String password) {
    RegExp regex =
        RegExp(r'^(?=.*?[a-z|A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');

    if (password.isEmpty) {
      return false;
    }

    if (!regex.hasMatch(password)) {
      return false;
    }

    return true;
  }

  @override
  bool execute() {
    return isValidationPassword(password);
  }
}
