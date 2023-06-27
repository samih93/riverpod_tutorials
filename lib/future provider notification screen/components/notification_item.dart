import 'package:flutter/material.dart';

import '../../model/notification_model.dart';
import '../../widgets/default_textview.dart';

class NotificationItem extends StatelessWidget {
  NotificationItem(this.notificationModel, {super.key});
  NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade900,
      ),
      child: Row(
        children: [
          CircleAvatar(
            child: Image.network("${notificationModel.avatar.toString()}"),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              defaultTextView(
                                  text:
                                      "${notificationModel.name.toString().trim()}",
                                  fontsize: 15,
                                  fontWeight: FontWeight.bold),
                              SizedBox(
                                width: 2,
                              ),
                              if (notificationModel.verified == true)
                                CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.blue,
                                  child: Icon(
                                    Icons.check,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              Expanded(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Expanded(
                                      child: defaultTextView(
                                          overflow: TextOverflow.ellipsis,
                                          text: "${notificationModel.time}",
                                          color: Colors.grey,
                                          fontsize: 13),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(Icons.delete),
                        //   iconSize: 20,
                        //   color: primarycolor,
                        // )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: defaultTextView(
                        textAlign: TextAlign.left,
                        text: getNotificationMessage(
                            notificationModel.subject.toString()),
                        color: Colors.grey),
                  ),
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }

  getNotificationMessage(String subject) {
    String res = "";
    if (subject == "subscribe") res = "Started following you";
    if (subject == "like") res = "Liked your post";
    if (subject == "reply") res = "Replied to your post";
    return res;
  }
}
