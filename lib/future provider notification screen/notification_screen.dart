import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorials/model/notification_model.dart';
import 'package:riverpod_tutorials/future%20provider%20notification%20screen/components/notification_item.dart';
import 'package:riverpod_tutorials/services/api_service.dart';

import '../main.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

var notificationDataProvider = FutureProvider<List<NotificationModel>>(
    (ref) => ref.read(apiServiceProvider).fetchAllNotifications());

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("Riverpod tuorials Home 1"),
        ),
        // body: Center(child: Text("${name}")));
        body: notifications.when(
            data: (data) {
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemBuilder: (context, index) => NotificationItem(data[index]),
                itemCount: data.length,
              );
            },
            error: (error, stacktrace) => Text("${error}"),
            loading: () => Center(child: CircularProgressIndicator())));
  }
}
