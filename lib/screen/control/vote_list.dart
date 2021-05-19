import 'package:algorand_vote/constants/asset_path.dart';
import 'package:algorand_vote/screen/control/vote_page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget electionContainer(
            {String image, String text1, String text2, String text3}) =>
        GestureDetector(
          onTap: () => Get.to(VoteScreen(
            text1: text1,
            text2: text2,
            text3: text3,
          )),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: size.width,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(image),
                    radius: 50,
                  ),
                  SizedBox(width: 12),
                  Column(
                    children: [
                      AutoSizeText(
                        text1,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      AutoSizeText(
                        text2,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 5),
                      AutoSizeText(
                        text3,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            electionContainer(
              image: finegirl,
              text1: "Mary Steward",
              text2: "Millenium Party",
              text3: "As CTO officer E",
            ),
            electionContainer(
              image: finegirl,
              text1: "John Howard",
              text2: "Arrow Party",
              text3: "As CTO officer E",
            ),
            electionContainer(
              image: finegirl,
              text1: "Tom Watson",
              text2: "Wimboc Party",
              text3: "As CTO officer E",
            ),
            electionContainer(
              image: finegirl,
              text1: "Jury Festus",
              text2: "Kise Party",
              text3: "As CTO officer E",
            ),
            electionContainer(
              image: finegirl,
              text1: "Kobia Write",
              text2: "Mighty Party",
              text3: "As CTO officer E",
            ),
            electionContainer(
              image: finegirl,
              text1: "Tracy Stark",
              text2: "Vig Party",
              text3: "As CTO officer E",
            ),
          ],
        ),
      ),
    );
  }
}
