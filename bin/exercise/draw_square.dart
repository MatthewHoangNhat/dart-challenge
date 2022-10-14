import '../exercise.dart';

class DrawSquare extends Exercise {
  int squareSize = 3;

  DrawSquare({required this.squareSize});

  @override
  void execute() {
    handle();
  }

  handle() {
    for (int i = 0; i < squareSize; i++) {
      print(_horizontalDivider(squareSize));
      print(_verticalDivider(squareSize));
    }
    String lastHorizontalDivider = _horizontalDivider(squareSize);
    print(lastHorizontalDivider);
  }

  String _horizontalDivider(int squareSize) {
    String rowStr = ' ';
    for (int j = 0; j < squareSize; j++) {
      rowStr += '${'-' * squareSize} ';
    }
    return rowStr;
  }

  String _verticalDivider(int squareSize) {
    String spaceStr = '';
    for (int index = 0; index < squareSize + 1; index++) {
      spaceStr += '|${' ' * squareSize}';
    }
    return spaceStr;
  }
}
