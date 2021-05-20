import 'package:algorand_vote/constants/asset_path.dart';
import 'package:algorand_vote/screen/control/donate.dart';
import 'package:algorand_vote/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

class VoteSuccess extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;

  const VoteSuccess({Key key, this.text1, this.text2, this.text3})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.90,
            width: size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Colors.purple, Colors.deepPurple])),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      "Your Vote Counts",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Stack(alignment: Alignment.center, children: [
                      CircleAvatar(
                        backgroundColor: Colors.white60,
                        radius: 180,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 150,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 138.0),
                        child: Image.asset(person),
                      )
                    ]),
                    AutoSizeText(
                      "Your Vote was successful",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              text: "Donate",
              onTap: () {
                Get.to(Donate(
                  text1: text1,
                  text2: text3,
                ));
              },
              bgColor: Colors.deepPurple,
            ),
          )
        ],
      ),
    );
  }
}
