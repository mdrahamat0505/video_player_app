import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:video_player_app/widgets/video_card.dart';

import '../components/loading_list_page.dart';
import '../controllers/home_controller.dart';
import '../helpers/hex_color.dart';
import '../models/video.dart';
import 'bloc/video_player_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeC = HomeController();

  @override
  void initState() {
    // TODO: implement initState
    homeC.scrollController = ScrollController();
    homeC.scrollController.addListener(homeC.scrollListener);
    homeC.fetchGraphQLClient();

    super.initState();
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

          // leading: IconButton(
          //   icon: Image.asset(
          //     'assets/img/Icon.png',
          //     height: 24,
          //     width: 24,
          //     fit: BoxFit.cover,
          //     color: hexToColor('#000000'),
          //   ),
          //   iconSize: 24,
          //   onPressed: () {},
          //   color: hexToColor('#FFFFFF'),
          // ),
          titleSpacing: 0,

          // actions: [
          //   getDefaultImageFromAsset(context: context),
          //   const SizedBox(
          //     width: 14,
          //   ),
          // ],
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: hexToColor('#FFFFFF'),
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarDividerColor: hexToColor('#FFFFFF'),
            systemNavigationBarColor: hexToColor('#FFFFFF'),
          ),
        ),

        resizeToAvoidBottomInset: false,
        body: GetBuilder<HomeController>(
          id: 'aVeryUniqueID', // here
          init: HomeController(),

          builder: (logic) {
            if (logic.videoViewModelList.value.isEmpty) {
              //First initializing apps load 10 data
              logic.fetchGraphQLClient();
            }

            return Obx(
              () {
                return Visibility(
                  visible: homeC.showSpinner.value,
                  replacement: Center(
                    child: LoadingListPage(),
                  ),
                  child: RefreshIndicator(
                    displacement: 250,
                    // backgroundColor: Colors.white,
                    // color: Colors.green,
                    strokeWidth: 3,
                    triggerMode: RefreshIndicatorTriggerMode.onEdge,
                    onRefresh: () async {
                      await Future.delayed(const Duration(milliseconds: 1500));
                      log('Test');
                      homeC.fetchGraphQLClient();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0,right: 12),
                      child: Column(
                        children: [
                          Expanded(flex: 0,child: SizedBox(height: 10,)),
                          Expanded(
                            flex: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                               // SizedBox(width: 12,),
                                Text(
                                  'Trending Videos',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 20.0,color: hexToColor('#1A202C'), fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          Expanded(flex: 0,child: SizedBox(height: 10,)),

                          Expanded(
                            child: ListView.builder(
                              itemCount: logic.videoViewModelList.value.length,
                              itemBuilder: (context, index) {
                                            return VideoCard(
                                              video: logic.videoViewModelList.value[index],);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // child: CustomScrollView(
                    //   slivers: [
                    //     //  CustomSliverAppBar(),
                    //     SliverPadding(
                    //       padding: const EdgeInsets.only(bottom: 60.0),
                    //       sliver: SliverList(
                    //         delegate: SliverChildBuilderDelegate(
                    //               (context, index) {
                    //             // final video = [Video()];
                    //             return VideoCard(
                    //               video: logic.videoViewModelList.value[index],);
                    //           },
                    //           childCount: logic.videoViewModelList.value.length-1,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
