import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state notifier provider/counterDemo.dart';

// ! auto dispose reset the data if no needed
final mycounterProvider =
    StateNotifierProvider.autoDispose<CounterDemo, int>((ref) {
  //! keep the data
  // ref.keepAlive();

  final link = ref.keepAlive();
  final timer = Timer(Duration(seconds: 10), () {
    link.close();
  });

  ref.onDispose(() => timer.cancel());
  return CounterDemo();
});

class DisposeCounterScreen extends ConsumerWidget {
  const DisposeCounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counter = ref.watch(mycounterProvider);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(mycounterProvider.notifier).increment();
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("State Notifier Provider"),
        ),
        body: Center(child: Text("${counter}")));
  }
}
