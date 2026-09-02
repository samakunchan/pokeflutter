import 'package:flutter/material.dart';
import 'package:pokeflutter/pages/home_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (_, __, ___) {
      return HomePage();
    });
  }
}
