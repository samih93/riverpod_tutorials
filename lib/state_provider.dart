import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorials/main.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counter = ref.watch(counterProvider);
// ! to listen on data
    ref.listen(counterProvider, (previous, next) {
      if (next == 10) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("the value is ${next}")));
      }
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Counter"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // reset state
              //    ref.invalidate(counterProvider);
              //!  or
              return ref.refresh(counterProvider);
            },
          )
        ],
      ),
      body: Center(
          child: Text(
        "${counter}",
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
