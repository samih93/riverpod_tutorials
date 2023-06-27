import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>((ref) => Stream.periodic(
      Duration(seconds: 2),
      (computationCount) => computationCount,
    ));

class MyStreamScreen extends ConsumerWidget {
  const MyStreamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Streamr Provider"),
        ),
        body: streamData.when(
            data: (data) {
              return Center(
                  child: Text(
                "${data}",
                style: TextStyle(fontSize: 20),
              ));
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => Center(child: CircularProgressIndicator())));
  }
}
