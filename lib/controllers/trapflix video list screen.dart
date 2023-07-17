import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorials/controllers/video_streaming_controller.dart';
import 'package:riverpod_tutorials/main.dart';
import 'package:routemaster/routemaster.dart';

import '../AutoDispose Modifier with timeout cashing/counter_screen.dart';

class VideoListScreen extends ConsumerStatefulWidget {
  const VideoListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VideoListScreenState();
}

class _VideoListScreenState extends ConsumerState<VideoListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // Future.delayed(Duration(milliseconds: 100)).then((value) {
    //   ref.read(streamingVideosControllerProvider.notifier).getStreamingVideo();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isloading = ref.watch(streamingVideosControllerProvider);
    var videos = ref.watch(videosProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Routemaster.of(context).push('/counter-screen/${3}');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Streaming video "),
        actions: [
          IconButton(
              onPressed: () {
                //
                ref.invalidate(streamingVideosControllerProvider);
                Routemaster.of(context).push('/home-page-1');
                // ref
                //     .watch(streamingVideosControllerProvider.notifier)
                //     .getStreamingVideo();
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemBuilder: (context, index) {
                var video = videos[index];
                return Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Column(
                      children: [
                        Image.network(video.thumbnail.toString()),
                        Text("${video.title}")
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          ref
                              .read(streamingVideosControllerProvider.notifier)
                              .removeMovieById(video.id!);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ))
                  ],
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: videos.length),
    );
  }
}
