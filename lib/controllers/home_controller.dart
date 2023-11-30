import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/models/video_view_model.dart';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as di;

class HomeController extends GetxController {
  final showSpinner = RxBool(false);
  final valueAutoPlay = RxBool(false);

  final dio = di.Dio();

  final videoViewModel = Rx(VideoViewModel());
  final videoViewModelList = RxList<VideoViewModel>([]);
  ScrollController scrollController = ScrollController();
  var page = 1;
  var url;

  @override
  void onInit() {
    url = "https://test-ximit.mahfil.net/api/trending-video/1?page=$page";
    scrollController.addListener(scrollListener);
    //fetchGraphQLClient();
    super.onInit();
  }

  //Scroll detection when scroll reached bottom
  scrollListener() {
    url = "https://test-ximit.mahfil.net/api/trending-video/1?page=$page";
    showSpinner.value = false;
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      //When scroll reach end then fetch new pokemon again
      page = page + 1;
      // showSpinner(true);
      fetchGraphQLClient();
      if (showSpinner.value == false) {
        // page = page + 1;
        // // showSpinner(true);
        // fetchGraphQLClient();
      }
    }
  }

  void fetchGraphQLClient() async {
    showSpinner.value = false;
    di.Response responseDio;

    url = "https://test-ximit.mahfil.net/api/trending-video/1?page=$page";
    responseDio = await dio.get(url);

    if (responseDio.statusCode == 200) {
      videoViewModelList.clear();
      var result = responseDio.data;
      // var jsonData = json.decode(data);

      var dataResult = result['results'];

      var shoutIncidents =
          await (dataResult).map((e) => VideoViewModel.fromJson(e)).toList();

      if (shoutIncidents != 0) {
        videoViewModelList.value = shoutIncidents.cast<VideoViewModel>();
        showSpinner.value = true;
        //videoViewModelList.value.addAll(shoutIncidents);
        try {} catch (e) {}
        showSpinner.value = true;
      } else {
        showSpinner.value = true;
        videoViewModelList.clear();
        update();
      }
    } else {
      showSpinner.value = true;
      videoViewModelList.clear();
      update();
    }

    showSpinner.value = true;
    update(['aVeryUniqueID']);
    update();
  }
}
