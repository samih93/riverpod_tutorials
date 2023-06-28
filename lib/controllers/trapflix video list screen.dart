import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorials/controllers/video_streaming_controller.dart';
import 'package:riverpod_tutorials/main.dart';

import '../AutoDispose Modifier with timeout cashing/counter_screen.dart';

class VideoListScreen extends ConsumerWidget {
  const VideoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var streamingController = ref.watch(StreamingVideosController);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DisposeCounterScreen()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Streaming video ${streamingController.counter} "),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(StreamingVideosController).increment();
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: streamingController.isloading
          ? CircularProgressIndicator()
          : ListView.separated(
              itemBuilder: (context, index) => Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Column(
                        children: [
                          Image.network(streamingController
                              .streamingVideos[index].thumbnail
                              .toString()),
                          Text(
                              "${streamingController.streamingVideos[index].title}")
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            ref.read(StreamingVideosController).removeMovieById(
                                streamingController.streamingVideos[index].id!);
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.white,
                          ))
                    ],
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: streamingController.streamingVideos.length),
    );
  }
}
