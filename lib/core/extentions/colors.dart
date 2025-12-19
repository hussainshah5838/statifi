import 'dart:ui';

Color averageColor(Color a, Color b) {
  return Color.fromARGB(
    ((a.alpha + b.alpha) ~/ 2),
    ((a.red + b.red) ~/ 2),
    ((a.green + b.green) ~/ 2),
    ((a.blue + b.blue) ~/ 2),
  );
}
