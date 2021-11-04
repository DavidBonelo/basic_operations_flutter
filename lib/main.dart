import 'package:flutter/material.dart';
import 'package:flutter_nord_theme/flutter_nord_theme.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // forced dark theme because NordTheme.light() is kinda broken rn.
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: NordTheme.light(),
      darkTheme: NordTheme.dark(),
      home: const HomePage(),
    );
  }
}


