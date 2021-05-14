import 'package:algorand_vote/controller/vote_controller.dart';
import 'package:algorand_vote/models/vote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoteListWidget extends StatelessWidget {
  final VoteController _voteController = Get.find();
  @override
  Widget build(BuildContext context) {
    Function alternateColor = getAlternate(start: 0);

    String activeVoteId = _voteController.activeVote.value?.voteId ?? '';

    return Column(
      children: <Widget>[
        for (Vote vote in _voteController.voteLists)
          Card(
            child: ListTile(
              title: Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  vote.voteTitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: activeVoteId == vote.voteId
                        ? Colors.white
                        : Colors.black,
                    fontWeight: activeVoteId == vote.voteId
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
              selected: activeVoteId == vote.voteId ? true : false,
              onTap: () {
                _voteController.activeVote.value = vote;
              },
            ),
            color: activeVoteId == vote.voteId
                ? Colors.red[200]
                : alternateColor(),
          ),
      ],
    );
  }

  Function getAlternate({int start = 0}) {
    int indexNum = start;

    Color getColor() {
      Color color = Colors.teal[100];

      if (indexNum % 2 == 0) {
        color = Colors.blueAccent[100];
      }
      ++indexNum;
      return color;
    }

    return getColor;
  }
}
