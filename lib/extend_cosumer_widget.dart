// wrap the widget with cosumer widget and pass the ref
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ! first method watch the name provider  and i can call name in all widget
    final name = ref.watch(nameProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Riverpod tuorials Home"),
        ),
        body: Center(child: Text("${name}")));
  }
}
