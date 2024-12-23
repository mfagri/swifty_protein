import 'package:flutter/material.dart';
import 'package:swifty_protein/pages/login.dart';
import 'package:swifty_protein/pages/signup.dart';
import 'package:swifty_protein/view/home.dart';
import 'package:device_preview/device_preview.dart';
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // if (Platform.isAndroid) {
//   //   AndroidWebView.platform = AndroidWebView();
//   // }

//   runApp(const MyApp());
// }

void main() => runApp(
      DevicePreview(
        builder: (context) => const SignUpPage(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Molecule Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
