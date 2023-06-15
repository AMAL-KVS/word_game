import 'dart:developer';
import 'package:get/get.dart';
import '../model/vertex.dart';

class GridController extends GetxController {
  // RxString stringList = ''.obs;
  String stringList = '';

  List<List<Vertex?>> vertices = [];

  List<Vertex> vertexIds = [];
  Set<int> vertexIdsFnl = {};
  int row = 0;
  int column = 0;

  bool right = false;
  bool left = false;
  bool up = false;
  bool down = false;
  bool diagonalBL = false;
  bool diagonalBR = false;
  bool diagonalTL = false;
  bool diagonalTR = false;
  bool isAllDirection = false;

  List<List<Vertex?>> createVertices(List<String> list, int row, int column) {
    row = row;
    column = column;
    int count = -1;
    vertices = List.generate(
      column,
      (index) => List.generate(row, (i) {
        count += 1;
        return Vertex(value: list[count], id: count);
      }),
    );

    return vertices;
  }

  bool getIds() {
    if (stringList.isEmpty) {
      diagonalTR = diagonalTL =
          diagonalBR = diagonalBL = right = left = up = down = false;
      vertexIdsFnl = {};
      return false;
    } else if (stringList.length == 1) {
      diagonalTR = diagonalTL =
          diagonalBR = diagonalBL = right = left = up = down = true;
    }

    bool helperFn(
      List<List<Vertex?>> vertexList,
      int i,
      int j,
      int count,
      String word,
    ) {
      if (count == stringList.length) {
        return true;
      }

      if (i < 0 ||
          i >= vertexList.length ||
          j < 0 ||
          j >= vertexList[i].length ||
          vertexList[i][j]?.value != word[count]) {
        vertexIdsFnl = {};

        return false;
      }

      Vertex? temp = vertexList[i][j];
      vertexList[i][j] = null;

      log('Iam working (down - $down) (left $left) (right $right) (up  $up)');

      bool found = false;
      if (helperFn(vertexList, 0, 0, count + 1, word)) {
        log('Iam working 1');
        found = true;
      } else if (helperFn(vertexList, i - 1, j, count + 1, word) &&
          up &&
          isAllDirection) {
        found = true;
        diagonalTR =
            diagonalTL = diagonalBR = diagonalBL = left = right = false;
        log('Iam working 2');
      } else if (helperFn(vertexList, i, j + 1, count + 1, word) && right) {
        found = true;
        diagonalTR = diagonalTL = diagonalBR = diagonalBL = up = down = false;
        log('Iam working 3');
      } else if (helperFn(vertexList, i, j - 1, count + 1, word) &&
          left &&
          isAllDirection) {
        found = true;
        diagonalTR = diagonalTL = diagonalBR = diagonalBL = up = down = false;

        log('Iam working 4');
      } else if (helperFn(vertexList, i + 1, j, count + 1, word) && down) {
        found = true;
        left = right = false;

        log('Iam working 5');
      } else if (helperFn(vertexList, i + 1, j - 1, count + 1, word) &&
          diagonalBL) {
        found = true;
        left = right = up = down = false;
        log('Iam working 6');
      } else if (helperFn(vertexList, i + 1, j + 1, count + 1, word) &&
          diagonalBR &&
          isAllDirection) {
        found = true;
        diagonalTR = diagonalTL = diagonalBL = left = right = up = down = false;
        log('Iam working 7');
      } else if (helperFn(vertexList, i - 1, j + 1, count + 1, word) &&
          diagonalTR &&
          isAllDirection) {
        found = true;
        diagonalBR = diagonalTL = diagonalBL = left = right = up = down = false;
        log('Iam working 8');
      } else if (helperFn(vertexList, i - 1, j - 1, count + 1, word) &&
          diagonalTL &&
          isAllDirection) {
        found = true;
        diagonalTR = diagonalBR = diagonalBL = left = right = up = down = false;
        log('Iam working 9');
      }

      vertexList[i][j] = temp;
      if (found) {
        vertexIdsFnl.add(vertexList[i][j]!.id);
      } else {
        vertexIdsFnl = {};
      }
      return found;
    }

    for (var i = 0; i < vertices.length; i++) {
      for (var j = 0; j < vertices[i].length; j++) {
        if (vertices[i][j]?.value == stringList[0] &&
            helperFn(vertices, i, j, 0, stringList)) {
          if (stringList.length == 1) {
            vertexIdsFnl = {vertices[i][j]!.id};
          }
          return true;
        }
      }
    }
    vertexIdsFnl = {};
    return false;
  }
}
