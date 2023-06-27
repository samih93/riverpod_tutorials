import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorials/main.dart';

import '../AutoDispose Modifier with timeout cashing/counter_screen.dart';

class VideoListScreen extends ConsumerWidget {
  const VideoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var videos =
        ref.watch(ref.read(streamingVideoController).streamingVideosProvider);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DisposeCounterScreen()));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(title: Text("Streaming video")),
        body: videos.when(
            data: (data) => ListView.separated(
                itemBuilder: (context, index) => Column(
                      children: [
                        Image.network(data[index].thumbnail.toString()),
                        Text("${data[index].title}")
                      ],
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: data.length),
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => Center(child: CircularProgressIndicator())));
  }
}
