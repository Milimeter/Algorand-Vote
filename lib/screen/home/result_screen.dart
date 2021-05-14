import 'package:algorand_vote/controller/vote_controller.dart';
import 'package:algorand_vote/models/vote.dart';
import 'package:algorand_vote/services/service.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  final VoteController _voteController = Get.find();

  @override
  Widget build(BuildContext context) {
    retrieveActiveVoteData(context);
    // final voteId = _voteController.activeVote.value?.voteId;
    // retrieveMarkedVoteFromFirestore(voteId: voteId);
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: createChart(context),
    );
  }

  Widget createChart(BuildContext context) {
    return charts.BarChart(
      retrieveVoteResult(),
      animate: true,
    );
  }

  List<charts.Series<VoteData, String>> retrieveVoteResult() {
    Vote activeVote = _voteController.activeVote.value;

    List<VoteData> data = [];
    for (var option in activeVote.options) {
      option.forEach((key, value) {
        data.add(VoteData(key, value));
      });
    }

    return [
      charts.Series<VoteData, String>(
        id: 'VoteResult',
        colorFn: (_, pos) {
          if (pos % 2 == 0) {
            return charts.MaterialPalette.green.shadeDefault;
          }
          return charts.MaterialPalette.blue.shadeDefault;
        },
        domainFn: (VoteData vote, _) => vote.option,
        measureFn: (VoteData vote, _) => vote.total,
        data: data,
      )
    ];
  }

  void retrieveActiveVoteData(BuildContext context) {
    final voteId = _voteController.activeVote.value?.voteId;
    retrieveMarkedVoteFromFirestore(voteId: voteId);
  }
}

/// Sample ordinal data type.
class VoteData {
  final String option;
  final int total;

  VoteData(this.option, this.total);
}
