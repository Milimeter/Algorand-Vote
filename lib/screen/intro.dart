import 'package:algorand_vote/constants/asset_path.dart';
import 'package:algorand_vote/screen/intro2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onboarding_screen/onboarding_screen.dart';

class IntroScreen extends StatelessWidget {
  final PageController _controller = PageController();

  final List<_SliderModel> mySlides = [
    _SliderModel(
      imageAssetPath: Image.asset(
        a,
        // scale: 1,
      ),
      title: 'Alovote',
      desc:
          'If we do not vote, we are ignoring history and giving away our future',
      minTitleFontSize: 10,
      descStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    _SliderModel(
      imageAssetPath: Image.asset(b),
      title: 'Alovote',
      desc: 'Every vote matters, every voice counts. Revel in your influence',
      minTitleFontSize: 10,
      descStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    _SliderModel(
      imageAssetPath: Image.asset(c),
      title: 'Alovote',
      desc:
          'Learn from the leaders of past and present and find out about the power of exercising our civil duty',
      minTitleFontSize: 10,
      descStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
  ];
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      label: const Text(
        'Get Started',
        key: Key('get_started'),
      ),

      /// This function works when you will complete `OnBoarding`
      function: () async {
        await box.write("FreshInstall", false);

        Get.to(IntroLogin());
      },

      /// This [mySlides] must not be more than 5.
      mySlides: mySlides,
      controller: _controller,
      slideIndex: 0,
      statusBarColor: Colors.white,
      indicators: Indicators.cool,
      skipPosition: SkipPosition.bottomRight,
      skipDecoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20.0),
      ),
      skipStyle: TextStyle(color: Colors.white),

      pageIndicatorColorList: [
        Colors.yellow,
        Colors.green,
        Colors.red,
        Colors.yellow,
        Colors.blue
      ],
    );
  }
}

class _SliderModel {
  const _SliderModel({
    this.imageAssetPath,
    this.title = "title",
    this.desc = "title",
    this.miniDescFontSize = 12.0,
    this.minTitleFontSize = 15.0,
    this.descStyle,
    this.titleStyle,
  });

  final Image imageAssetPath;
  final String title;
  final TextStyle titleStyle;
  final double minTitleFontSize;
  final String desc;
  final TextStyle descStyle;
  final double miniDescFontSize;
}
