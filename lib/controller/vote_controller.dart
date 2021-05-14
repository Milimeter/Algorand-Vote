import 'package:algorand_vote/models/vote.dart';
import 'package:algorand_vote/services/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoteController extends GetxController {
  static VoteController instance = Get.find();

  RxList<Vote> _voteList;
  Rx<Vote> _activeVote;
  RxString _selectedOptionInActiveVotee;
  RxInt currentStep = 0.obs;
  Rx<Vote> get activeVote => _activeVote;
  RxString get selectedOptionInActiveVotee => _selectedOptionInActiveVotee;

  @override
  void onInit() {
    super.onInit();
    Future.microtask(() {
      clearState();
      loadVoteList();
    });
  }

  void clearState() {
    _voteList.value = null;
    _activeVote.value = null;
    _selectedOptionInActiveVotee.value = null;
  }

  void loadVoteList() async {
    getVoteListFromFirestore();
  }

  RxList<Vote> get voteLists => voteLists;
  set voteLists(newValue) {
    _voteList.value = newValue;
  }

  Rx<Vote> get activeVotes => activeVotes;
  set activeVotes(newValue) {
    _activeVote = newValue;
  }

   set selectedOptionInActiveVote(String newValue) {
    _selectedOptionInActiveVotee.value = newValue;
  }

  bool step2Required() {
    if (_activeVote.value == null) {
      return false;
    }

    return true;
  }

  bool step3Required() {
    if (_selectedOptionInActiveVotee.value == null) {
      return false;
    }
    return true;
  }

  Step getStep({
    String title,
    Widget child,
    bool isActive = false,
  }) {
    return Step(
      title: Text(title),
      content: child,
      isActive: isActive,
    );
  }

  void markMyVote() {
    final voteId = _activeVote.value.voteId;
    final option = _selectedOptionInActiveVotee.value;

    markVote(voteId, option);
  }
}
