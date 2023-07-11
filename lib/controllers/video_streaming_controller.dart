import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:riverpod_tutorials/main.dart';

import '../model/streaming_video_model.dart';
import 'package:http/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final videosProvider = StateProvider<List<StreamingVideoModel>>((ref) => []);

final streamingVideosControllerProvider =
    StateNotifierProvider<StreamingVideosController, bool>(
  (ref) => StreamingVideosController(ref),
);

class StreamingVideosController extends StateNotifier<bool> {
  final Ref _ref;
  StreamingVideosController(Ref ref)
      : _ref = ref,
        super(false);

  int counter = 0;

  Future getStreamingVideo() async {
    state = true;
    Response response = await get(Uri.parse(
        'https://raw.githubusercontent.com/samih93/riverpod_tutorials/master/api.txt'));
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      print((data as List).length);

      _ref.read(videosProvider.notifier).update((state) =>
          List.from((data).map((e) => StreamingVideoModel.fromJson(e))));
      state = false;
      //  print("list videos lenght :" + list.length.toString());
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  removeMovieById(String id) {
    state = true;
    print("deleted ${id}");
    _ref.read(videosProvider.notifier).update((state) {
      state.removeWhere((element) => element.id == id);
      return state;
    });
    state = false;
  }

  void increment() {
    counter++;
  }
}



// addLikeToVideo({
//   required int userId,
//   required int videoId,
//   required int type,
// }) {
//   streamingVideos.forEach((element) {
//     if (element.id == videoId.toString()) {
//       print("type " + type.toString());
//       if (element.isliked) {
//         element.isliked == false;
//         element.likesCount = (int.parse(element.likesCount!) - 1).toString();
//       } else {
//         element.isliked == true;
//         element.likesCount = (int.parse(element.likesCount!) + 1).toString();

//         //! update dislike if its disliked
//         if (element.isDisliked) {
//           element.isDisliked == false;
//           element.disLikesCount =
//               (int.parse(element.disLikesCount!) - 1).toString();
//         }
//       }
//     }
//   });
// }
