import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:video_player_app/pages/home_page.dart';

import '../controllers/home_controller.dart';
import '../helpers/hex_color.dart';
import '../models/video_view_model.dart';

class VideoInfo extends StatefulWidget {
  final VideoViewModel video;

  const VideoInfo({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  final homeC = HomeController();

  @override
  void initState() {
    // TODO: implement initState
    homeC.valueAutoPlay.value = true;

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    homeC.valueAutoPlay.value = false;
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    homeC.valueAutoPlay.value = false;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: hexToColor('#FFFFFF'),
        appBar: AppBar(
          backgroundColor: hexToColor('#FFFFFF'),
          surfaceTintColor: hexToColor('#FFFFFF'),
          bottomOpacity: 0.0,
          toolbarOpacity: 0.0,
          // leadingWidth: 92,
          toolbarHeight: 0,
          centerTitle: true,
          elevation: 0,
          shadowColor: hexToColor('#FFFFFF'),
          titleSpacing: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: hexToColor('#FFFFFF'),
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarDividerColor: hexToColor('#FFFFFF'),
            systemNavigationBarColor: hexToColor('#FFFFFF'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return Stack(
                  children: [
                    YoYoPlayer(
                      autoPlayVideoAfterInit: homeC.valueAutoPlay.value,
                      aspectRatio: 16 / 9,
                      url: widget.video.manifest,
                      videoStyle: VideoStyle(),
                      videoLoadingStyle: VideoLoadingStyle(),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 10.0,
                      child: SizedBox(
                        height: 12,
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            if (homeC.valueAutoPlay.value != false) {
                              homeC.valueAutoPlay.value = false;
                            } else {
                              homeC.valueAutoPlay.value = false;
                            }

                            Get.to(HomePage());
                            print('Use image search');
                          },
                        ),
                      ),
                    ),
                  ],
                );
              }),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        widget.video.title,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 15.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        '${widget.video.viewers.toString()} views •  ${timeago
                            .format(
                            (DateTime.parse(widget.video.dateAndTime)))}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                          fontSize: 14.0,
                          color: hexToColor('#718096'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //const Divider(),
                      _ActionsRow(video: widget.video),
                      // const Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      _AuthorInfo(user: widget.video),
                      SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                      //  SizedBox(height: 10,),
                      _CommentRow(
                        user: widget.video,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //const Divider(),
                      SizedBox(
                        height: 10,
                      ),
                      _CommentShow(
                        user: widget.video,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Divider(),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionsRow extends StatelessWidget {
  final VideoViewModel video;

  const _ActionsRow({
    Key? key,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildAction(
              context, Icons.heart_broken_outlined, 'MASH ALLAH (12K) '),
          _buildAction(context, Icons.thumb_up_outlined, 'LIKE (12K)'),
          //_buildAction(context, Icons.thumb_down_outlined, video.disl),
          _buildAction(context, Icons.reply_rounded, 'SHARE'),
          _buildAction(context, Icons.report_outlined, 'REPORT'),
        ],
      ),
    );
  }

  Widget _buildAction(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey, spreadRadius: 0),
            ],
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 18,
                color: hexToColor('#718096'),
              ),
              const SizedBox(height: 5.0),
              SizedBox(
                width: 60,
                child: Text(
                  label,
                  maxLines: 1,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                      color: hexToColor('#718096'),
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthorInfo extends StatelessWidget {
  final VideoViewModel user;

  const _AuthorInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Navigate to profile'),
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(user.channelImage),
          ),
          const SizedBox(width: 5.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    user.channelName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                        color: hexToColor('#1A202C'),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Flexible(
                  child: Text(
                    '${user.channelSubscriber} subscribers',
                    overflow: TextOverflow.ellipsis,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                        color: hexToColor('#718096'),
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 3,
          ),
          SizedBox(
            // width: 109,
            height: 33,
            child: ElevatedButton.icon(
              // <-- ElevatedButton
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              // style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.purple,
              //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              //     textStyle: TextStyle(
              //         fontSize: 30,
              //         fontWeight: FontWeight.bold)),
              icon: Icon(
                Icons.add,
                size: 10.0,
                color: Colors.white,
              ),

              label: Text(
                'SUBSCRIBE',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          // TextButton(
          //   onPressed: () {},
          //   child: Text(
          //     'SUBSCRIBE',
          //     style: Theme.of(context)
          //         .textTheme
          //         .bodyLarge!
          //         .copyWith(color: Colors.white),
          //   ),
          // )
        ],
      ),
    );
  }
}

class _CommentRow extends StatelessWidget {
  final VideoViewModel user;

  const _CommentRow({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                "Comments 7.5K",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                    color: hexToColor('#718096'),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Spacer(),
            SizedBox(
              width: 50,
            ),
            Column(
              children: [
                SizedBox(
                  height: 9,
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.arrow_drop_up,
                      color: hexToColor('#718096'),
                    ),
                    onPressed: () {
                      print('Use image search');
                    },
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: hexToColor('#718096'),
                  ),
                  onPressed: () {
                    print('Use image search');
                  },
                ),
              ],
            ),
          ],
        ),

        SearchBar(
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 255, 255, 255)),
          trailing: [
            IconButton(
              icon: Icon(
                Icons.send_sharp,
                color: hexToColor('#718096'),
              ),
              onPressed: () {
                print('Use image search');
              },
            ),
          ],
          elevation: MaterialStateProperty.all(1.0),
          constraints: const BoxConstraints(minHeight: 47.0),
          shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
          hintText: 'Add Comment',
          hintStyle: MaterialStateProperty.all(
              TextStyle(color: hexToColor('#CBD5E0'))),
          // other arguments
        )
        // CommentBox(CBD5E0
        //   labelText: 'Add Comment',
        //   errorText: 'Comment cannot be blank',
        //   withBorder: false,
        //   sendButtonMethod: () {
        //     // if (formKey.currentState!.validate()) {
        //     //   // print(commentController.text);
        //     //   // setState(() {
        //     //   //   var value = {
        //     //   //     'name': 'New User',
        //     //   //     'pic':
        //     //   //     'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
        //     //   //     'message': commentController.text,
        //     //   //     'date': '2021-01-01 12:00:00'
        //     //   //   };
        //     //   //   filedata.insert(0, value);
        //     //   // });
        //     //   commentController.clear();
        //     //   FocusScope.of(context).unfocus();
        //     // } else {
        //     //   print("Not validated");
        //     // }
        //   },
        //   // formKey: formKey,
        //   // commentController: commentController,
        //   backgroundColor: Colors.white,
        //   textColor: Colors.black12,
        //   sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.white),
        // ),
      ],
    );
  }
}

class _CommentShow extends StatelessWidget {
  final VideoViewModel user;

  const _CommentShow({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Navigate to profile'),
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: NetworkImage(user.channelImage),
          ),
          const SizedBox(width: 5.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    "${user.channelName} 2 days ago",
                    overflow: TextOverflow.ellipsis,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                        color: hexToColor('#718096'),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Flexible(
                  child: Text(
                    'হুজুরের বক্তব্য গুলো ইংরেজি তে অনুবাদ করে সারা পৃথিবীর মানুষদের কে শুনিয়ে দিতে হবে। কথা গুলো খুব দামি',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                        color: hexToColor('#4A5568'),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
