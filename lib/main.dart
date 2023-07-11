import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorials/AutoDispose%20Modifier%20with%20timeout%20cashing/home_screen.dart';
import 'package:riverpod_tutorials/read_using_cosumer.dart';
import 'package:riverpod_tutorials/services/api_service.dart';
import 'package:riverpod_tutorials/state%20notifier%20provider/counterDemo.dart';
import 'package:riverpod_tutorials/state%20notifier%20provider/state_notifier_provider.dart';
import 'package:riverpod_tutorials/state_provider_%20counter%20screen.dart';
import 'package:riverpod_tutorials/stream%20provider/stream%20screen.dart';

import 'controllers/trapflix video list screen.dart';
import 'controllers/video_streaming_controller.dart';
import 'extend statefull_widget.dart';
import 'extend_cosumer_widget.dart';
import 'family_provider.dart';
import 'future provider notification screen/notification_screen.dart';
import 'model/notification_model.dart';
import 'multi value family  provider.dart';
import 'package:routemaster/routemaster.dart';

final nameProvider = Provider<String>((ref) => "hello samih");

final counterProvider =
    StateProvider.family<int, int>((ref, counter) => counter);

final routes = RouteMap(routes: {
  '/': (_) => MaterialPage(
        child: VideoListScreen(),
      ),
  '/multi-family': (_) => MaterialPage(child: MultiValueFamilyProviderScreen()),
  '/home-page-1': (_) => MaterialPage(child: MyHomePage1()),
  '/counter-screen/:counter': (info) => MaterialPage(
      child: CounterScreen(int.parse(info.pathParameters['counter']!))),
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) => routes),
      routeInformationParser: RoutemasterParser(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
    );
  }
}
