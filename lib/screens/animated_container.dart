import 'package:flutter/material.dart';

class AnimationContainer extends StatefulWidget {
  const AnimationContainer({super.key});

  @override
  State<AnimationContainer> createState() => _AnimationContainerState();
}

class _AnimationContainerState extends State<AnimationContainer> {
  @override
  Widget build(BuildContext context) {
    int width = 200;
    int height = 200;
    int r = 0;
    int g = 0;
    int b = 0;

    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Color.fromRGBO(r, g, b, 1),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
