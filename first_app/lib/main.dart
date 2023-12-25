import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          const Color.fromARGB(255, 22, 147, 169),
          const Color.fromARGB(255, 105, 46, 207),
        ),
      ),
    ),
  );
}