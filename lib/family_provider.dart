import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

class FamilyProviderScreen extends ConsumerWidget {
  FamilyProviderScreen({super.key});

  final _nameProvider = Provider.family<String, String>((ref, name) {
    return "hello ${name}";
  }); // ! read provider using consumer

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var name = ref.watch(_nameProvider("ahmad"));
    return Scaffold(
        appBar: AppBar(
          title: Text("Family Provider"),
        ),
        // body: Center(child: Text("${name}")));
        body: Center(child: Text("${name}")));
  }
}
