import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/streaming_video_model.dart';


class TrapflixVideoItem extends StatelessWidget {
  TrapflixVideoItem(this.streamingVideoModel, {super.key});
  StreamingVideoModel streamingVideoModel;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        // showModalBottomSheet(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return BottomSheetVideoItem(streamingVideoModel);
        //   },
        // );
      },
      child: streamingVideoModel.video_app_cover != "https://trapflix.com/"
          ? Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.only(right: 10),
              child: SizedBox(
                width: 200,
                child: Image.network(
                    streamingVideoModel.video_app_cover!),
              ),
            )
          : SizedBox(),
    );
  }
}
