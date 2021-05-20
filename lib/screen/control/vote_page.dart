import 'package:algorand_vote/constants/asset_path.dart';
import 'package:algorand_vote/screen/control/successa.dart';
import 'package:algorand_vote/widget/custom_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoteScreen extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;

  const VoteScreen({Key key, this.text1, this.text2, this.text3})
      : super(key: key);
  Widget container() => Container();

  _vote(context) {
    return AwesomeDialog(
        context: context,
        animType: AnimType.LEFTSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.SUCCES,
        title: 'Confirm your Selection?',
        desc: 'You have selected $text1 fot the post of $text2',
        btnOkOnPress: () => Get.to(VoteSuccess()),
        btnOkIcon: Icons.check_circle,
        onDissmissCallback: () => Get.back())
      ..show();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            width: size.width,
            color: Colors.blue[800],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(top: 200),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(finegirl),
                    radius: 50,
                  ),
                  SizedBox(height: 20),
                  AutoSizeText(
                    text1,
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AutoSizeText(
                    text3,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.deepPurple, size: 20),
                      Icon(Icons.star, color: Colors.deepPurple, size: 20),
                      Icon(Icons.star, color: Colors.deepPurple, size: 20),
                      Icon(Icons.star, color: Colors.deepPurple, size: 20),
                      Icon(Icons.star, color: Colors.blue, size: 20),
                    ],
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      "About $text1",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  AutoSizeText(
                    " is an American politician, conservative talk radio host, former social worker, and former 2020 Republican presidential candidate who served one term in the United States House of Representatives",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.purple[300],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            AutoSizeText(
                              "Experience",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            AutoSizeText(
                              "Yes",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            AutoSizeText(
                              "Region",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            AutoSizeText(
                              "Kabal, Senegal",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  CustomButton(
                    text: "Continue",
                    onTap: () => _vote(context),
                    bgColor: Colors.deepPurple,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
