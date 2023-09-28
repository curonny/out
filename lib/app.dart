import 'package:flutter/material.dart';

import 'presentation/home_page/screens/homepage.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News!"),),
      body: const HomePage(),
    );
  }
}