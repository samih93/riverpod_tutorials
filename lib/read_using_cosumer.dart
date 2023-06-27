import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

// ! read provider using consumer
class MyHomePage1 extends StatelessWidget {
  const MyHomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Riverpod tuorials Home 1"),
        ),
        // body: Center(child: Text("${name}")));
        body: Consumer(
            builder: (context, ref, child) =>
                Center(child: Text("${ref.watch(nameProvider)}"))));
  }
}
