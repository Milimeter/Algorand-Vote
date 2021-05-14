import 'package:algorand_vote/constants/const.dart';
import 'package:algorand_vote/controller/vote_controller.dart';
import 'package:algorand_vote/models/vote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    Key key,
    @required this.value,
    @required this.unit,
    @required this.chartImage,
    @required this.unitIcon,
  }) : super(key: key);

  final String value;
  final String unit;
  final String chartImage;
  final String unitIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacing * 2)),
      child: Container(
        height: 115,
        padding: EdgeInsets.all(spacing * 1.5),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    value,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                  ),
                  Text(
                    unit,
                    style: TextStyle(height: 1),
                  )
                ],
              ),
            ),
            SizedBox(width: spacing * 2),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SvgPicture.asset(
                      chartImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(width: spacing * 2),
                  Column(
                    children: [
                      SvgPicture.asset(
                        unitIcon,
                        height: 24,
                        width: 24,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VoteWidget extends StatelessWidget {
  final VoteController _voteController = Get.find();
  @override
  Widget build(BuildContext context) {
    Vote activeVote = _voteController.activeVote.value;
    List<String> options = [];

    for (Map<String, int> option in activeVote.options) {
      option.forEach((title, value) {
        options.add(title);
      });
    }

    return Obx(
      () => Column(
        children: <Widget>[
          Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              child: Text(
                activeVote.voteTitle,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
          for (String option in options)
            Card(
              child: InkWell(
                onTap: () {
                  _voteController.selectedOptionInActiveVote = option;
                },
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(minHeight: 60),
                        width: 8,
                        color: Colors.green,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            option,
                            maxLines: 5,
                            style: TextStyle(fontSize: 22),
                          ),
                          color: _voteController
                                      .selectedOptionInActiveVotee.value ==
                                  option
                              ? Colors.green
                              : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
