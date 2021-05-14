import 'package:algorand_vote/controller/vote_controller.dart';
import 'package:algorand_vote/models/vote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

const String kVotes = 'votes';
const String kTitle = 'title';
final VoteController _voteController = Get.find();
void getVoteListFromFirestore() async {
  FirebaseFirestore.instance.collection(kVotes).get().then((snapshot) {
    List<Vote> voteList = [];

    snapshot.docs.forEach((DocumentSnapshot document) {
      voteList.add(mapFirestoreDocToVote(document));
    });

    _voteController.voteLists = voteList;
  });
}

Vote mapFirestoreDocToVote(document) {
  Vote vote = Vote(voteId: document.documentID);
  List<Map<String, int>> options = [];
  document.data.forEach((key, value) {
    if (key == kTitle) {
      vote.voteTitle = value;
    } else {
      options.add({key: value});
    }
  });

  vote.options = options;
  return vote;
}

void markVote(String voteId, String option) async {
  // increment value

  FirebaseFirestore.instance.collection(kVotes).doc(voteId).update({
    option: FieldValue.increment(1),
  });
}

void retrieveMarkedVoteFromFirestore({String voteId,}) {
  // Retrieve updated doc from server
  FirebaseFirestore.instance
      .collection(kVotes)
      .doc(voteId)
      .get()
      .then((document) {
    _voteController.voteLists = mapFirestoreDocToVote(document);
  });
}
