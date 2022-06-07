import 'dart:html';

class Battlefield {
  int dimension = 10;
  List<List<int>> cells = <List<int>>[];

  Battlefield({this.dimension = 10}) {
    cells = <List<int>>[];
    for (int i = 0; i < dimension; i++) {
      cells.add(List<int>.generate(dimension, (index) => 0));
    }

    //   for (int x = 0; x < dimension; x++) {
    //     var rowCell = <int>[];
    //     for (int y = 0; y < dimension; y++) {
    //       if (y % 3 == 0) {
    //         rowCell.add(2);
    //       } else if (y % 2 == 0) {
    //         rowCell.add(1);
    //       } else {
    //         rowCell.add(0);
    //       }
    //     }
    //     cells.add(rowCell);
    //   }
  }
}
