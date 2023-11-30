import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/models/video_view_model.dart';
import 'package:http/http.dart' as http;



class HomeController extends GetxController {

  final showSpinner = RxBool(false);

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
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      //When scroll reach end then fetch new pokemon again
      if (showSpinner.value == false) {
          page = page + 1;
          // showSpinner(true);
          fetchGraphQLClient();

      }
    }
  }

  // Future<PokemonsQueryGraphql> fetchArtemisClient(ArtemisClient client) async {
  //   final pokemonsQuery = PokemonsQuery(variables: PokemonsArguments(quantity: 15));
  //   final result = await client.execute(pokemonsQuery);
  //   if (result.hasErrors) {
  //     throw Exception(result.errors);
  //   }
  //   return result.data!;
  // }

  void fetchGraphQLClient() async {
    url = "https://test-ximit.mahfil.net/api/trending-video/1?page=$page";
    showSpinner.value = true;

    http.Response res = await http.get(Uri.parse(url));


    if (res.statusCode == 200) {
      videoViewModelList.clear();
      String data = res.body;
      var jsonData = jsonDecode(data);

     var dataS = jsonData['results'];

      var shoutIncidents = await (dataS).map((e) => VideoViewModel.fromJson(e)).toList();

     // VideoViewModel newsData = VideoViewModel.fromJson(jsonData['results']);

      if (shoutIncidents  != 0) {
        // newsList.value.addAll(newsData.articles as dynamic);
        // news.addAll(newsData.articles as dynamic);
        //scrollController.jumpTo(0.0);


        videoViewModelList.value = shoutIncidents.cast<VideoViewModel>();
        showSpinner.value = true;
        //videoViewModelList.value.addAll(shoutIncidents);
        try {
        } catch (e) {}
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


    // final pokemonsQuery = PokemonsQuery(variables: PokemonsArguments(quantity: page));
    // final queryOptions = QueryOptions(
    //   document: pokemonsQuery.document,
    //   variables: pokemonsQuery.variables.toJson(),
    //   fetchPolicy: FetchPolicy.cacheAndNetwork,
    // );
  //  final result = await Config().graphQLClient.query(queryOptions);
  //   if (result.hasException) {
  //     throw result.exception!;
  //   }

  //  pokemons.value = PokemonsQueryGraphql.fromJson(result.data!);
    showSpinner.value = true;
    update(['aVeryUniqueID']);
    update();

  }
}