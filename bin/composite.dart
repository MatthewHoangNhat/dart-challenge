import 'exercise.dart';

class Composite {
  List<Exercise> exercises = [];

  void add(Exercise exercise) {
    exercises.add(exercise);
  }

  void remove(Exercise exercise) {
    exercises.remove(exercise);
  }

  void execute() {
    for (int i = 0; i < exercises.length; i++) {
      print('#$i: ');
      final result = exercises.elementAt(i).execute();
      if (result != null) {
        print(result);
      }
      print('');
    }
  }
}
