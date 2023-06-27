import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorials/model/user_model.dart';

import 'main.dart';

class MultiValueFamilyProviderScreen extends ConsumerWidget {
  MultiValueFamilyProviderScreen({super.key});

  final _nameProvider = Provider.family<String, UserModel>((ref, user) {
    return "Name ${user.name} - Address : ${user.address}";
  }); // ! read provider using consumer

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var name = ref.watch(_nameProvider(UserModel("samih", "barja")));
    return Scaffold(
        appBar: AppBar(
          title: Text("Multi family Provider"),
        ),
        // body: Center(child: Text("${name}")));
        body: Center(child: Text("${name}")));
  }
}
