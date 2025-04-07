import 'package:flutter/material.dart';
import 'package:pokeflutter/pages/home_page.dart';

void main() {
  // debugRepaintRainbowEnabled = true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
