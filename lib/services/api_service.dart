import 'dart:convert';

import 'package:riverpod_tutorials/model/notification_model.dart';
import 'package:http/http.dart';

class ApiService {
  String endPoint =
      "https://trapflix.com/social/mobile_api/get_notifications?session_id=63da9f31a5a84e3f797155bfa5a7df342be0285816878515847829120e900b4e442fc1f7f3b62d8d36&type=notifs&page_size=20&offset=10000";

  Future<List<NotificationModel>> fetchAllNotifications() async {
    Response response = await get(Uri.parse(endPoint));
    if (response.statusCode == 200) {
      List result = jsonDecode(response.body)["data"];
      return result.map((e) => NotificationModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
