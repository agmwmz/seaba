import 'package:flutter/material.dart';
import 'battlefield.dart';

class Screen extends StatefulWidget {
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Battlefield battlefield = Battlefield(dimension: 15);

  @override
  Widget build(BuildContext context) {
    return drawField();
  }

  Widget drawField() {
    var rows = <Widget>[];
    for (var x = 0; x <= battlefield.dimension; x++) {
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
    List<String> list = ['A', 'B', 'C'];
    var elements = <Widget>[];
    for (var y = 0; y <= battlefield.dimension; y++) {
      if (y == 0 || x == 0) {
        elements.add(SizedBox(
          width: 30,
          height: 30,
          child: Center(
            child: Text(
              y == 0
                  ? x == 0
                      ? ''
                      : x.toString()
                  : y.toString(),
              textAlign: TextAlign.center,
            ),
          ),
        ));
      } else {
        elements.add(
          InkWell(
            child: Container(
              width: 30,
              height: 30,
              //color: x % 2 == 0 ? Colors.blue : Colors.red,
              decoration: BoxDecoration(
                color: getColor(x, y),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                // borderRadius: BorderRadius.circular(12),
              ),
            ),
            onTap: () => onTapProcessint(x, y),
          ),
        );
      }
    }
    return elements;
  }

  Color getColor(int x, int y) {
    if (battlefield.cells[x - 1][y - 1] == 0) return Colors.blue;
    if (battlefield.cells[x - 1][y - 1] == 1) return Colors.green;
    if (battlefield.cells[x - 1][y - 1] == 2) return Colors.red;
    return Colors.black;
  }

  void onTapProcessint(int x, int y) {
    battlefield.cells[x - 1][y - 1] = 1;
    setState(() {});
  }
}
