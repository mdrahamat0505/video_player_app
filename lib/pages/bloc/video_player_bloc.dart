// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:bloc/bloc.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:formz/formz.dart';
//
// import 'package:http/http.dart' as http;
//
// import '../../models/video_view_model.dart';
//
// part 'video_player_event.dart';
//
// part 'video_player_state.dart';
//
// class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
//
//   ScrollController scrollController = ScrollController();
//   VideoPlayerBloc() : super(const VideoPlayerState()) {
//  //   on<VideoDataFaced>(_mapWatherFeathToState);
//   }
//
//
//   //Scroll detection when scroll reached bottom
//   scrollListener() {
//
//     showSpinner = false;
//     if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
//       //When scroll reach end then fetch new pokemon again
//       if (showSpinner.value == false) {
//         if (pokemons.value.pokemons != null && pokemons.value.pokemons!.length <= page) {
//           page = page + 5;
//           // showSpinner(true);
//           fetchGraphQLClient();
//         }
//       }
//     }
//   }
//
//   void _mapWatherFeathToState(
//       VideoDataFaced event,
//       Emitter<VideoPlayerState> emit,
//       ) async {
//     scrollController.addListener(scrollListener);
//    // final prefs = await SharedPreferences.getInstance();
//     try {
//       // final WeatherDAO weatherDAO = WeatherDAO();
//       // final LocationData locationData = await Location().getLocation();
//       String apiKey = "71318e996c0dc1afbc62f3e104ecc9e8";
//       String latitude = locationData.latitude == null
//           ? "31.5925"
//           : locationData.latitude.toString();
//       String longitude = locationData.longitude == null
//           ? "74.3095"
//           : locationData.longitude.toString();
//
//       final String url =
//           'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
//
//       final queryParameters = {
//         'lat': latitude,
//         'lon': longitude,
//         'appid': apiKey,
//       };
//
//       final uri = Uri.https(
//           'api.openweathermap.org', '/data/2.5/weather', queryParameters);
//
//       // final dynamic url = "http://api.openweathermap.org/data/2.5/weather?units=metric&lat=$latitude&lon=$longitude&appid=$apiKey";
//       await prefs.setString('url', 'uri');
//       final urlOld = prefs.getString('url');
//
//       var connectivityResult = await (Connectivity().checkConnectivity());
//
//       if (connectivityResult == ConnectivityResult.none) {
//         final weatherModels = await weatherDAO.get();
//         emit(state.copyWith(
//             weatherModel: weatherModels,
//             status: FormzStatus.submissionSuccess));
//       } else {
//         final response = await http.get(uri);
//
//         if (response.statusCode == 200) {
//           Map data = jsonDecode(response.body);
//           final WeatherModel weatherModel = WeatherModel.fromJson(data);
//           if (weatherModel != null) {
//             emit(state.copyWith(
//                 weatherModel: weatherModel,
//                 status: FormzStatus.submissionSuccess));
//
//             await weatherDAO.deleteAll();
//             await weatherDAO.save(weatherModel);
//           }
//         } else if (response.statusCode == 412) {
//           Map data = jsonDecode(response.body);
//           final WeatherModel weatherModel = WeatherModel.fromJson(data);
//           if (weatherModel != null) {
//             emit(state.copyWith(
//                 weatherModel: null, status: FormzStatus.submissionFailure));
//           }
//         } else if (response.statusCode == 500) {
//           Map data = jsonDecode(response.body);
//           final WeatherModel weatherModel = WeatherModel.fromJson(data);
//           if (weatherModel != null) {
//             emit(state.copyWith(
//                 weatherModel: null, status: FormzStatus.submissionFailure));
//           }
//         }
//       }
//     } catch (e) {
//       log('reportIssueImageFiles' + e.toString());
//     }
//   }
// }
