import 'package:flutter/material.dart';
import 'package:swifty_protein/pages/login.dart';
import 'package:swifty_protein/pages/splash.dart';
import 'package:swifty_protein/pages/signup.dart';
import 'package:swifty_protein/view/home.dart';
import 'package:device_preview/device_preview.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(
      DevicePreview(
        // enabled: false,
        builder: (context) => const MyApp(), // Changed this line
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Molecule Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}
