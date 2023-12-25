import 'package:flutter/material.dart';
import 'dart:math';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatefulWidget {
  final Color color1;
  final Color color2;

  const GradientContainer(this.color1, this.color2, {Key? key}) : super(key: key);

  const GradientContainer.purple({Key? key})
      : color1 = const Color.fromARGB(255, 56, 98, 224),
        color2 = const Color.fromARGB(255, 14, 50, 141),
        super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _GradientContainerState createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  late String currentImage;

  var activeDiceImage = [
    'assets/dice-images/dice-1.png',
    'assets/dice-images/dice-2.png',
    'assets/dice-images/dice-3.png',
    'assets/dice-images/dice-4.png',
    'assets/dice-images/dice-5.png',
    'assets/dice-images/dice-6.png',
  ];

  void rollDice() {
    int randomIndex = Random().nextInt(activeDiceImage.length);
    setState(() {
      currentImage = activeDiceImage[randomIndex];
    });
  }

  @override
  void initState() {
    super.initState();
    // Initialize the currentImage when the widget is first created
    rollDice();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [widget.color1, widget.color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              currentImage ?? '', // Provide a default value if currentImage is null
              width: 200,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                backgroundColor: const Color.fromARGB(255, 210, 217, 198),
              ),
              onPressed: rollDice,
              child: const Text(
                'Roll Dice',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}