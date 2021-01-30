import 'dart:math';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(_chars.length),
        ),
      ),
    );

/// remap a value from the interval [a1,a2] to the interval [b1,b2]
double remapInterval(
        dynamic value, dynamic a1, dynamic a2, double b1, double b2) =>
    b1 + ((value - a1) * (b2 - b1)) / (a2 - a1);
