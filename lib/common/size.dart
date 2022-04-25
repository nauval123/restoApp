import 'package:flutter/material.dart';

/// Class displaySize dengan parameter Context.
/// Mengembalikan nilai MediaQuery.of(context).size bertipe Size
Size displaySize(BuildContext context) {
  return MediaQuery.of(context).size;
}

/// Class displayHeight dengan parameter Context dan int number (nilai default 1).
/// Mengembalikan nilai dari MediaQuery.of(context).size.height * number
double displayHeight(BuildContext context, {int number = 1}) {
  return displaySize(context).height * number;
}

/// Class displayWidth dengan parameter Context dan int number (nilai default 1).
/// Mengembalikan nilai dari MediaQuery.of(context).size.width * number
double displayWidth(BuildContext context, {int number = 1}) {
  return displaySize(context).width * number;
}

/// Class displayHalfHeight dengan parameter Context dan double number (nilai default 0.5).
/// Mengembalikan nilai dari MediaQuery.of(context).size.height * number
double displayHalfHeight(BuildContext context, {double number = 0.5}) {
  return displaySize(context).height * number;
}

/// Class displayHalfWidth dengan parameter Context dan double number (nilai default 0.5).
/// Mengembalikan nilai dari MediaQuery.of(context).size.width * number
double displayHalfWidth(BuildContext context, {double number = 0.5}) {
  return displaySize(context).width * number;
}
