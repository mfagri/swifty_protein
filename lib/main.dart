import 'package:flutter/material.dart';
import 'package:swifty_protein/pages/login.dart';
import 'package:swifty_protein/pages/splash.dart';
import 'package:swifty_protein/pages/signup.dart';
import 'package:swifty_protein/view/home.dart';
import 'package:device_preview/device_preview.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => const MyApp(), // Changed this line
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Add this for DevicePreview
      locale: DevicePreview.locale(context), // Add this for DevicePreview
      builder: DevicePreview.appBuilder, // Add this for DevicePreview
      debugShowCheckedModeBanner: false,
      title: 'Molecule Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(), // Changed this to start with SplashScreen
    );
  }
}
