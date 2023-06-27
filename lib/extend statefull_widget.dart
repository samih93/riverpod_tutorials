import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

class MyHomePage2 extends ConsumerStatefulWidget {
  const MyHomePage2({super.key});

  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends ConsumerState<MyHomePage2> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Riverpod tuorials Home 2"),
        ),
        body: Center(child: Text("${name}")));
  }
}
