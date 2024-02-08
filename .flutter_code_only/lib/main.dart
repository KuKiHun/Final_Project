import 'package:flutter/material.dart';
import 'package:final_project/follaw/main_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreenTest(),
    );
  }
}
