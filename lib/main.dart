import 'package:algorand_vote/constants/firebase.dart';
import 'package:algorand_vote/controller/algorand_controller.dart';
import 'package:algorand_vote/controller/app_controller.dart';
import 'package:algorand_vote/controller/user_controller.dart';
import 'package:algorand_vote/screen/intro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(UserController());
    //Get.put(VoteController());
    Get.put(AppController());
    Get.put(AlgorandController());
  });
  await GetStorage.init();
 
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Algorand Vote',
    home: IntroScreen(),
  ));
}
