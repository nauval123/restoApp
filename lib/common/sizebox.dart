import 'package:flutter/material.dart';

/// Class Verticals , digunakan untuk memberi jarak pada diantara widget yang diinginkan secara verticals.
/// Memiliki parameter val (nilai ) bertipe double yang akan digunakan sebagai nilai height dari SizedBox
/// Mengembalikan widget SizedBox(height: val)
class Verticals extends StatelessWidget {
  final double val;
  const Verticals(this.val, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: val);
  }
}

/// Class Horizontals , digunakan untuk memberi jarak pada diantara widget yang diinginkan secara Horizontal.
/// Memiliki parameter val (nilai ) bertipe double yang akan digunakan sebagai nilai width dari SizedBox
/// Mengembalikan widget SizedBox(width: val)
class Horizontals extends StatelessWidget {
  final double val;
  const Horizontals(this.val, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: val);
  }
}
