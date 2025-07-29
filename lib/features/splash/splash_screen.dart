import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_portfolio/features/home/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PortfolioScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Container(
                padding: EdgeInsets.all(
                  4.0,
                ), // Add padding inside the container
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(
                      255,
                      231,
                      230,
                      230,
                    ), // Orange border
                    width: 2.0, // Border width
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(
                        255,
                        255,
                        255,
                        0.8,
                      ), // White shadow color
                      blurRadius: 10.0, // Blur radius
                      spreadRadius: 2.0, // Spread radius
                      offset: Offset(2, 2), // Shadow position (x, y)
                    ),
                  ],
                ),
                child: Image.network(
                  'asstes/photo_splach.jpg',
                  width: 200,
                  height: 200,
                  fit: BoxFit
                      .cover, // Adjust how the image fits within the space
                ),
              ),
            ),
            // const SizedBox(
            //   height: defaultPadding,
            // ),
            SizedBox(height: 20),
            const AnimatedLoadingText(),
          ],
        ),
      ),
    );
  }
}

class AnimatedLoadingText extends StatelessWidget {
  const AnimatedLoadingText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 2),
        builder: (context, value, child) => Column(
          children: [
            LinearProgressIndicator(
              backgroundColor: Colors.black,
              color: Colors.white,
              value: value,
            ),
            const SizedBox(height: 12),
            Text(
              '${(value * 100).toInt()}%',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(2, 2),
                  ),
                  Shadow(
                    color: Colors.black,
                    blurRadius: 10,
                    offset: Offset(-2, -2),
                  ),
                ],
              ),
            ),
          ],
        ),
        tween: Tween(begin: 0.0, end: 1.0),
      ),
    );
  }
}
