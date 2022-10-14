import '../exercise.dart';

class UniqueElementList extends Exercise {
  UniqueElementList({required this.firstArray, required this.secondArray});
  final List<int> firstArray;
  final List<int> secondArray;

  List<int> _handleUniqueElementList(
      List<int> firstArray, List<int> secondArray) {
    Set<int> array = {};
    array.addAll(firstArray);
    array.addAll(secondArray);

    return array.toList();
  }

  @override
  List<int> execute() {
    return _handleUniqueElementList(firstArray, secondArray);
  }
}
