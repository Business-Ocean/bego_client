import 'package:flutter/material.dart';

final class BegoShadows {
  static const boxShadow1 = [shadow1a, shadow1b];
  static const boxShadow2 = [shadow2a, shadow2b];
  static const boxShadow3 = [shadow3a, shadow3b];
  static const boxShadow4 = [shadow4a, shadow4b];
  static const boxShadow5 = [shadow5a, shadow5b];

  // // Elevation Light/1
  // static const shadow1a = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.15),
  //   offset: Offset(0, 1),
  //   blurRadius: 3,
  //   spreadRadius: 1,
  // );

  // static const shadow1b = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.3),
  //   offset: Offset(0, 1),
  //   blurRadius: 2,
  //   spreadRadius: 0,
  // );

  // // Elevation Light/2
  // static const shadow2a = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.15),
  //   offset: Offset(0, 2),
  //   blurRadius: 6,
  //   spreadRadius: 1,
  // );

  // static const shadow2b = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.3),
  //   offset: Offset(0, 1),
  //   blurRadius: 2,
  //   spreadRadius: 0,
  // );

  // // Elevation Light/3
  // static const shadow3a = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.3),
  //   offset: Offset(0, 1),
  //   blurRadius: 3,
  //   spreadRadius: 0,
  // );

  // static const shadow3b = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.15),
  //   offset: Offset(0, 4),
  //   blurRadius: 8,
  //   spreadRadius: 3,
  // );

  // // Elevation Light/4
  // static const shadow4a = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.3),
  //   offset: Offset(0, 2),
  //   blurRadius: 3,
  //   spreadRadius: 1,
  // );

  // static const shadow4b = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.15),
  //   offset: Offset(0, 6),
  //   blurRadius: 10,
  //   spreadRadius: 4,
  // );

  // // Elevation Light/5
  // static const shadow5a = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.3),
  //   offset: Offset(0, 4),
  //   blurRadius: 4,
  //   spreadRadius: 0,
  // );

  // static const shadow5b = BoxShadow(
  //   color: Color.fromRGBO(0, 0, 0, 0.15),
  //   offset: Offset(0, 8),
  //   blurRadius: 12,
  //   spreadRadius: 6,
  // );

  // Elevation Light/1
  static const shadow1a = BoxShadow(
    color: Color.fromRGBO(128, 128, 128, 0.15),
    offset: Offset(0, 1),
    blurRadius: 3,
    spreadRadius: 1,
  );

  static const shadow1b = BoxShadow(
    color: Color.fromRGBO(128, 128, 128, 0.3),
    offset: Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0,
  );

  // Elevation Light/2
  static const shadow2a = BoxShadow(
    color: Color.fromRGBO(128, 128, 128, 0.15),
    offset: Offset(0, 2),
    blurRadius: 6,
    spreadRadius: 1,
  );

  static const shadow2b = BoxShadow(
    color: Color.fromRGBO(128, 128, 128, 0.3),
    offset: Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0,
  );

  // Elevation Light/3
  static const shadow3a = BoxShadow(
    color: Color.fromRGBO(128, 128, 128, 0.3),
    offset: Offset(0, 1),
    blurRadius: 3,
    spreadRadius: 0,
  );

  static const shadow3b = BoxShadow(
    color: Color.fromRGBO(128, 128, 128, 0.15),
    offset: Offset(0, 4),
    blurRadius: 8,
    spreadRadius: 3,
  );

  // Elevation Light/4
  static const shadow4a = BoxShadow(
    color: Color.fromRGBO(128, 128, 128, 0.3),
    offset: Offset(0, 2),
    blurRadius: 3,
    spreadRadius: 1,
  );

  static const shadow4b = BoxShadow(
    color: Color.fromRGBO(128, 128, 128, 0.15),
    offset: Offset(0, 6),
    blurRadius: 10,
    spreadRadius: 4,
  );

  // Elevation Light/5
  static const shadow5a = BoxShadow(
    color: Color.fromRGBO(128, 128, 128, 0.3),
    offset: Offset(0, 4),
    blurRadius: 4,
    spreadRadius: 0,
  );

  static const shadow5b = BoxShadow(
    color: Color.fromRGBO(128, 128, 128, 0.15),
    offset: Offset(0, 8),
    blurRadius: 12,
    spreadRadius: 6,
  );

  static List<BoxShadow> colorBoxShadow(Color color) => [
        BoxShadow(
          color: color,
          offset: const Offset(0, -1),
          blurRadius: 10,
          spreadRadius: 2,
        ),
        BoxShadow(
          color: color,
          offset: const Offset(0, 4),
          blurRadius: 20,
          spreadRadius: 4,
        ),
        // const BoxShadow(
        //   color: Colors.grey,
        //   offset: Offset.zero,
        //   blurRadius: 0.5,
        //   spreadRadius: 0,
        // ),
      ];
}
