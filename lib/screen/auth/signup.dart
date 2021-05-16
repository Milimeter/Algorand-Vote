import 'package:algorand_vote/constants/asset_path.dart';
import 'package:algorand_vote/controller/user_controller.dart';
import 'package:algorand_vote/screen/auth/login.dart';
import 'package:algorand_vote/screen/auth/widget/bottom_widget.dart';
import 'package:algorand_vote/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  final UserController _userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset(signup),
            SizedBox(height: 20),
            Text("Create Account"),
            SizedBox(height: 20),
            TextFormField(
              controller: _userController.fullnameTextEditingController,
              decoration: InputDecoration(
                hintText: "Full Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.verified_user, color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _userController.emailTextEditingController,
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.mail, color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _userController.passwordTextEditingController,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock, color: Colors.deepPurple),
              ),
            ),
            SizedBox(height: 11),
            Align(
              alignment: Alignment.centerRight,
              child: Text("Forgot password"),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: "Sign Up",
              onTap: () => _userController.signUp(),
              bgColor: Colors.deepPurple,
            ),
            SizedBox(height: 11),
            BottomTextWidget(
              onTap: () => Get.off(Login()),
              text1: "Already have an account?",
              text2: "Sign in!!",
            ),
            Divider(color: Colors.deepPurple),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.google, color: Colors.blue[900]),
                SizedBox(width: 20),
                Icon(FontAwesomeIcons.facebook, color: Colors.orangeAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
