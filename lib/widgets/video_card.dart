import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../helpers/hex_color.dart';
import '../models/video.dart';
import '../models/video_view_model.dart';
import '../pages/video_info.dart';

class VideoCard extends StatelessWidget {
  final VideoViewModel video;
  final bool hasPadding;
  final VoidCallback? onTap;

  const VideoCard({
    Key? key,
    required this.video,
    this.hasPadding = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(VideoInfo(video:video));
        // context.read(selectedVideoProvider).state = video;
        // context
        //     .read(miniPlayerControllerProvider)
        //     .state
        //     .animateToHeight(state: PanelState.MAX);
        // if (onTap != null) onTap!();
      },
      child: Column(
        children: [
          Stack(
            children: [


              if(video.thumbnail != null)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: hasPadding ? 12.0 : 0,
                ),
                child: Image.network(
                  video.thumbnail.toString(),
                  height: 220.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 8.0,
                right: hasPadding ? 20.0 : 8.0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  color: Colors.black,
                  child: Text(
                    video.duration.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(video.channelImage != null)
                GestureDetector(
                  onTap: () {
                    Get.to(VideoInfo(video:video));

                  },
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(video.channelImage.toString()),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          video.title.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 15.0,color: hexToColor('#1A202C')),
                        ),
                      ),
                      if(video.dateAndTime != null)
                        SizedBox(height: 5,),

                        //timeago.format(DateTime.parse(video.dateAndTime))
                      Flexible(
                        child: Text(
                          '${video.viewers.toString()} views • ${DateFormat.yMMMd().format(DateTime.parse(video.dateAndTime))}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,

                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 14.0, color: hexToColor('#718096'),),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                   // Get.to(VideoInfo(video:video));
                  },
                  child:  Icon(Icons.more_vert, size: 20.0, color: hexToColor('#CBD5E0')),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
