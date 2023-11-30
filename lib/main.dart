import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player_app/controllers/home_controller.dart';
import 'package:video_player_app/pages/home_page.dart';

void main() async{
  initAppConfig();
  runApp( MyApp());
}


 initAppConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.put(HomeController());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      title: 'Flutter Video player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}


// class home extends StatefulWidget {
//
//
//   @override
//   State<home> createState() => _homeState();
// }
//
// class _homeState extends State<home> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }


