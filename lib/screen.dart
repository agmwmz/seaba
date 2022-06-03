import 'package:flutter/material.dart';
import 'battlefield.dart';

class Screen extends StatelessWidget {
  Battlefield battlefield = Battlefield();

  @override
  Widget build(BuildContext context) {
    return drawField();
  }

  Widget drawField() {
    var rows = <Widget>[];
    for (var x = 1; x <= battlefield.dimension; x++) {
      rows.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: drawRow(x),
      ));
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: rows,
    );
  }

  List<Widget> drawRow(int x) {
    var elements = <Widget>[];
    for (var y = 1; y <= battlefield.dimension; y++) {
      elements.add(
        Container(
          width: 50,
          height: 50,
          //color: x % 2 == 0 ? Colors.blue : Colors.red,
          decoration: BoxDecoration(
            color: getColor(x, y),
            border: Border.all(
              color: Colors.yellow,
              width: 4,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }
    return elements;
  }

  Color getColor(int x, int y) {
    if (battlefield.cells[x - 1][y - 1] == 0) return Colors.blue;
    if (battlefield.cells[x - 1][y - 1] == 1) return Colors.green;
    if (battlefield.cells[x - 1][y - 1] == 1) return Colors.red;
    return Colors.black;
  }
}
