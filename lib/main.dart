import 'package:flutter/material.dart';
import 'package:navigator/screens/splash_screen/splash_screen.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() async {
  AndroidYandexMap.useAndroidViewSurface = false;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'City guide',
      home: SplashScreen(),
    );
  }
}
