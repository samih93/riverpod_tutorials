class NotificationModel {
  int? id;
  int? notifierId;
  int? recipientId;
  String? status;
  String? subject;
  int? entryId;
  String? time;
  String? username;
  String? avatar;
  bool? verified;
  String? name;
  String? url;
  String? userUrl;
  int? post_id;
  int? user_id;

  NotificationModel(
      {this.id,
      this.notifierId,
      this.recipientId,
      this.status,
      this.subject,
      this.entryId,
      this.time,
      this.username,
      this.avatar,
      this.verified,
      this.name,
      this.url,
      this.userUrl,
      this.post_id,
      this.user_id});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notifierId = json['notifier_id'];
    recipientId = json['recipient_id'];
    status = json['status'];
    subject = json['subject'];
    entryId = json['entry_id'];
    time = json['time'];
    username = json['username'];
    avatar = json['avatar'];
    verified = json['verified'] == "1" ? true : false;
    name = json['name'];
    url = json['url'];
    userUrl = json['user_url'];
    post_id = json['post_id'];
    user_id = json['user_id'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['notifier_id'] = this.notifierId;
  //   data['recipient_id'] = this.recipientId;
  //   data['status'] = this.status;
  //   data['subject'] = this.subject;
  //   data['entry_id'] = this.entryId;
  //   data['time'] = this.time;
  //   data['username'] = this.username;
  //   data['avatar'] = this.avatar;
  //   // data['verified'] = this.verified;
  //   data['name'] = this.name;
  //   data['url'] = this.url;
  //   data['user_url'] = this.userUrl;
  //   data['user_id'] = this.userId;
  //   return data;
  // }
}
