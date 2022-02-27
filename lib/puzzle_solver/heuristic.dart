import 'package:very_good_slide_puzzle/models/models.dart';

///Heuristic used in the IDA* algorithm for solving the puzzle
abstract class Heuristic {
  const Heuristic();

  double getHeuristic(Puzzle puzzle1);

  double getDistance(Position a, Position b);
}

class ManhattanHeuristic extends Heuristic {
  const ManhattanHeuristic();

  @override
  double getHeuristic(Puzzle puzzle1) {
    double rst = 0;
    for (int i = 0; i < puzzle1.tiles.length; i++) {
      if (!puzzle1.tiles[i].isWhitespace) {
        rst += getDistance(
            puzzle1.tiles[i].currentPosition, puzzle1.tiles[i].correctPosition);
      }
    }
    return rst;
  }

  @override
  double getDistance(Position a, Position b) {
    return ((b.x - a.x).abs() + (b.y - a.y).abs()).toDouble();
  }
}

class InverseDistanceHeuristic extends Heuristic {
  const InverseDistanceHeuristic();

  @override
  double getHeuristic(Puzzle puzzle1) {
    int rst = 0;

    int invCount = 0;
    List<Tile> rowTiles = List.from(puzzle1.tiles);
    rowTiles.sort((a, b) => (100 * (a.currentPosition.x - b.currentPosition.x) +
            (a.currentPosition.y - b.currentPosition.y))
        .toInt());

    List<Tile> columnTiles = List.from(puzzle1.tiles);
    columnTiles.sort((a, b) =>
        (100 * (a.currentPosition.y - b.currentPosition.y) +
                (a.currentPosition.x - b.currentPosition.x))
            .toInt());

    for (int i = 0; i < 16; i++) {
      if (rowTiles[i].isWhitespace) continue;
      for (int j = i + 1; j < 16; j++) {
        if (!rowTiles[j].isWhitespace &&
            rowTiles[i].value > rowTiles[j].value) {
          invCount += 1;
        }
      }
    }

    rst += invCount ~/ 3 + invCount % 3;
    invCount = 0;

    for (int i = 0; i < 16; i++) {
      if (columnTiles[i].isWhitespace) continue;
      for (int j = i + 1; j < 16; j++) {
        if (!columnTiles[j].isWhitespace &&
            columnTiles[i].value > columnTiles[j].value) invCount += 1;
      }
    }

    rst += invCount ~/ 3 + invCount % 3;

    return rst.toDouble();
  }

  @override
  double getDistance(Position a, Position b) {
    return ((b.x - a.x).abs() + (b.y - a.y).abs()).toDouble();
  }
}
