import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator/screens/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (xtx) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(226, 192, 128, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            // Use Expanded to push the image to the top and make the text stay at the bottom
            child: Center(
              child: Image.asset(
                'assets/images/splash.png',
                //25% of height & 50% of width
                height: 325,
                width: 350,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
                bottom: 20), // Add some padding to the bottom of the text
            child: Text(
              'при поддержке by PixelCore',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(66, 56, 46, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
