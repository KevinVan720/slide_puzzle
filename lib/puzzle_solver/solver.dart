import 'package:very_good_slide_puzzle/models/models.dart';

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

class PuzzleSolver {
  PuzzleSolver(
      {this.heuristic = const ManhattanHeuristic(), required this.startPuzzle});
  ManhattanHeuristic heuristic;
  Puzzle startPuzzle;

  Map<Puzzle, Tile> IDAstar() {
    double bound = heuristic.getHeuristic(startPuzzle);
    Map<Puzzle, Tile> path = {
      Puzzle(tiles: [...startPuzzle.tiles]): const Tile(
          value: -1,
          correctPosition: Position(x: -1, y: -1),
          currentPosition: Position(x: -1, y: -1))
    };

    while (true) {
      print("search with bound: " + bound.toString());
      double distance =
          IDAstarRec(path, 0, heuristic.getHeuristic(startPuzzle), bound);
      if (distance == double.infinity) {
        print("not found");
        return {};
      } else {
        if (distance <= 0) {
          print("found");
          return path;
        } else {
          bound = distance;
        }
      }
    }
  }

  double IDAstarRec(
      Map<Puzzle, dynamic> path, double g, double h, double bound) {
    Puzzle puzzle = path.keys.last;

    double f = g + h;

    if (f > bound) {
      return f;
    }

    if (heuristic.getHeuristic(puzzle) == 0.0) {
      return -f;
    }

    double min = double.infinity;
    Tile whiteTile = puzzle.getWhitespaceTile();
    for (int i = 0; i < 16; i++) {
      if (puzzle.isTileMovableAndCloseToWhite(puzzle.tiles[i])) {
        final mutablePuzzle = Puzzle(tiles: List.from(puzzle.tiles));
        final p = mutablePuzzle.moveTiles(mutablePuzzle.tiles[i], []);

        if (path.containsKey(p) != true) {
          path[p] = puzzle.tiles[i]
              .copyWith(currentPosition: puzzle.tiles[i].currentPosition);
          double t = IDAstarRec(
              path,
              g + 1,
              h -
                  heuristic.getDistance(puzzle.tiles[i].currentPosition,
                      puzzle.tiles[i].correctPosition) +
                  heuristic.getDistance(puzzle.tiles[i].correctPosition,
                      whiteTile.currentPosition),
              bound);
          if (t < 0) {
            return t;
          }
          if (t < min) {
            min = t;
          }
          path.remove(p);
        }
      }
    }
    return min;
  }
}
