import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:riverpod_tutorials/main.dart';

import '../model/streaming_video_model.dart';
import 'package:http/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamingVideosNotifier extends ChangeNotifier {
  List<StreamingVideoModel> streamingVideos = [];

  int counter = 0;

  bool isloading = false;
  Future<List<StreamingVideoModel>> getStreamingVideo() async {
    isloading = true;
    notifyListeners();
    Response response = await get(Uri.parse(
        'https://raw.githubusercontent.com/samih93/riverpod_tutorials/master/api.txt'));
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body);
      print((data as List).length);
      streamingVideos =
          List.from((data).map((e) => StreamingVideoModel.fromJson(e)));
      //  print("list videos lenght :" + list.length.toString());
      isloading = false;
      notifyListeners();
    } else {
      throw Exception(response.reasonPhrase);
    }
    return streamingVideos;
  }

  removeMovieById(String id) {
    print("deleted ${id}");
    streamingVideos.removeWhere((element) => element.id == id);
    print(streamingVideos.length);
    notifyListeners();
  }

  void increment() {
    counter++;
    notifyListeners();
  }
}

final StreamingVideosController =
    ChangeNotifierProvider<StreamingVideosNotifier>(
  (ref) => StreamingVideosNotifier()..getStreamingVideo(),
);

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
