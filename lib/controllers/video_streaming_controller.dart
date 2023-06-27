import 'dart:convert';

import 'package:riverpod_tutorials/main.dart';

import '../model/streaming_video_model.dart';
import 'package:http/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamingVideosController {
  var streamingVideosProvider =
      FutureProvider.autoDispose<List<StreamingVideoModel>>(
          (ref) => ref.read(streamingVideoController).getStreamingVideo());

  Future<List<StreamingVideoModel>> getStreamingVideo() async {
    List<StreamingVideoModel> list = [];
    Response response = await get(Uri.parse(
        'https://raw.githubusercontent.com/samih93/riverpod_tutorials/master/api.txt'));
    if (response.statusCode == 200) {
      // print(response.body);
      var data = jsonDecode(response.body);
      print((data as List).length);
      list = List.from((data).map((e) => StreamingVideoModel.fromJson(e)));
      //  print("list videos lenght :" + list.length.toString());
    } else {
      throw Exception(response.reasonPhrase);
    }
    return list;
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
