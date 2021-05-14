import 'package:algorand_vote/controller/app_controller.dart';
import 'package:algorand_vote/screen/auth/widget/bottom_widget.dart';
import 'package:algorand_vote/screen/auth/widget/default_layout.dart';
import 'package:algorand_vote/screen/auth/widget/login_widget.dart';
import 'package:algorand_vote/screen/auth/widget/signup_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Auth extends StatelessWidget {
  final AppController _appController = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      background: Image.asset(
        'assets/images/auth_bg.png',
        height: Get.height,
        width: Get.width,
        fit: BoxFit.fill,
      ),
      body: Scaffold(
          backgroundColor: Colors.transparent,
          body: Obx(
            () => SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      // Logo
                      SvgPicture.asset(
                        'assets/icons/logo.svg',
                        width: Get.width * 0.2,
                      ),
                      SizedBox(height: 50),
                      Visibility(
                          visible: _appController.isLoginWidgetDisplayed.value,
                          child: LoginWidget()),
                      Visibility(
                          visible: !_appController.isLoginWidgetDisplayed.value,
                          child: RegistrationWidget()),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: _appController.isLoginWidgetDisplayed.value,
                        child: BottomTextWidget(
                          onTap: () {
                            _appController.changeDisplayedAuthWidget();
                          },
                          text1: "Don\'t have an account?",
                          text2: "Create account!",
                        ),
                      ),
                      Visibility(
                        visible: !_appController.isLoginWidgetDisplayed.value,
                        child: BottomTextWidget(
                          onTap: () {
                            _appController.changeDisplayedAuthWidget();
                          },
                          text1: "Already have an account?",
                          text2: "Sign in!!",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
