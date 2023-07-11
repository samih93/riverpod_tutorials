import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorials/main.dart';
import 'package:routemaster/routemaster.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen(this.counter, {super.key});
  final int counter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("counter is ${counter}");
    var c = ref.watch(counterProvider(counter));
    print("c is ${c}");

// ! to listen on data
    ref.listen(counterProvider(counter), (previous, next) {
      if (next == 10) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("the value is ${next}")));
      }
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state++;
          ref
              .read(counterProvider(counter).notifier)
              .update((state) => state + 1);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Routemaster.of(context).pop();
            ref.invalidate(counterProvider);
          },
        ),
        title: Text("Counter"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              //  reset state
              ref.invalidate(counterProvider);
              //!  or
              //   return ref.refresh(counterProvider(0));
            },
          )
        ],
      ),
      body: Center(
          child: Text(
        "${c}",
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
