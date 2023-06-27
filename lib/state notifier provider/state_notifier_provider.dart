import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorials/main.dart';

import 'counterDemo.dart';

final stateCounterProvider =
    StateNotifierProvider<CounterDemo, int>((ref) => CounterDemo());

class MyScreen extends ConsumerWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counter = ref.watch(stateCounterProvider);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // ref.read(counterProvider.notifier).state++;
            ref.read(stateCounterProvider.notifier).increment();
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("State Notifier Provider"),
        ),
        body: Center(child: Text("${counter}")));
  }
}
