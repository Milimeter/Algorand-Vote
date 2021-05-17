import 'package:algorand_vote/constants/asset_path.dart';
import 'package:algorand_vote/screen/auth/login.dart';
import 'package:algorand_vote/screen/auth/signup.dart';
import 'package:algorand_vote/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroLogin extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Positioned(
          bottom: 20,
          child: Column(
            children: [
              SizedBox(
                width: size.width * 0.90,
                              child: CustomButton(
                  onTap: () => Get.to(Login()),
                  text: "Sign In",
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: size.width * 0.90,
                child: CustomButton(
                  onTap: () => Get.to(Signup()),
                  text: "Sign Up",
                  bgColor: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 10),
              Text("Powered by Algorand"),
            ],
          ),
        ),
        Positioned(
          top: 50,
          left: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(sisu),
              Text(
                "Alovote",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Vote wisely, Every vote counts",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ]),
    );
  }
}
