import 'package:flutter/material.dart';

import '../state_provider.dart';
import 'counter_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DisposeCounterScreen()));
          },
          child: Text("Go Counter Page"),
        ),
      ),
    );
  }
}
