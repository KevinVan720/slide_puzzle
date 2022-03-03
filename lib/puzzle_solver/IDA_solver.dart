import 'package:very_good_slide_puzzle/models/models.dart';
import 'package:very_good_slide_puzzle/puzzle_solver/heuristic.dart';

///Solving the puzzle with the IDA* algorithm
class PuzzleSolver {
  PuzzleSolver(
      {this.heuristic = const ManhattanHeuristic(), required this.startPuzzle});
  Heuristic heuristic;
  Puzzle startPuzzle;

  Map<Puzzle, Tile> IDAstar() {
    double bound = heuristic.getHeuristic(startPuzzle);

    ///path records the puzzle and the last tiled tapped
    ///the insertion order is preserved which is important
    Map<Puzzle, Tile> path = {
      Puzzle(tiles: [...startPuzzle.tiles]): const Tile(
          value: -1,
          correctPosition: Position(x: -1, y: -1),
          currentPosition: Position(x: -1, y: -1))
    };

    while (true) {
      print("search with bound: " + bound.toString());
      double distance =
          IDAstarSearch(path, 0, heuristic.getHeuristic(startPuzzle), bound);
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

  double IDAstarSearch(
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
    for (int i = 0; i < puzzle.tiles.length; i++) {
      ///Move only the tiles close to the whitespace
      if (puzzle.isTileMovableAndCloseToWhite(puzzle.tiles[i])) {
        final mutablePuzzle = Puzzle(tiles: List.from(puzzle.tiles));
        final p = mutablePuzzle.moveTiles(mutablePuzzle.tiles[i], []);

        if (path.containsKey(p) != true) {
          path[p] = puzzle.tiles[i]
              .copyWith(currentPosition: puzzle.tiles[i].currentPosition);
          double t = IDAstarSearch(
              path,
              g + 1,

              ///Save time by computing just the heuristic difference between two puzzles
              ///I can only think of how to do it with the Manhattan heuristic
              h -
                  heuristic.getDistance(puzzle.tiles[i].currentPosition,
                      puzzle.tiles[i].correctPosition) +
                  heuristic.getDistance(
                    whiteTile.currentPosition,
                    puzzle.tiles[i].correctPosition,
                  ),
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

class SolveTimeoutError extends Error {
  SolveTimeoutError();
}
