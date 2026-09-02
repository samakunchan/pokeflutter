import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pokeflutter/pages/home_page.dart';
import 'package:sizer/sizer.dart';

void main() {
  if (kIsWeb) {
    runApp(
      DevicePreview(
        enabled: kIsWeb,
        builder: (_) => const MainApp(),
      ),
    );
  } else {
    runApp(const MainApp());
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (_, __, ___) => HomePage());
  }
}
