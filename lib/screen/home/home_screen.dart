import 'package:algorand_vote/constants/const.dart';
import 'package:algorand_vote/controller/user_controller.dart';
import 'package:algorand_vote/controller/vote_controller.dart';
import 'package:algorand_vote/screen/auth/widget/default_layout.dart';
import 'package:algorand_vote/screen/home/result_screen.dart';
import 'package:algorand_vote/screen/home/widget/vote.dart';
import 'package:algorand_vote/screen/home/widget/vote_list.dart';
import 'package:algorand_vote/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class HomeScreen extends StatelessWidget {
//   final UserController _userController = Get.find();
//   final VoteController _voteController = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[800],
//       body: Column(
//         children: [
//           AutoSizeText(
//             _userController.userData.value.email,
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             margin: EdgeInsets.only(top: 50),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(75),
//                 topRight: Radius.circular(75),
//               ),
//             ),
//             child: Column(
//               children: [
//                 if (_voteController.voteLists == null)
//                   Container(
//                     color: Colors.lightBlue,
//                     child: Center(
//                       child: showLoading(),
//                     ),
//                   ),
//                 if (_voteController.voteLists != null)
//                   Expanded(
//                     child: Stepper(
//                       type: StepperType.horizontal,
//                       currentStep: _voteController.currentStep.value,
//                       steps: [
//                         getStep(
//                           title: 'Choose',
//                           child: VoteListWidget(),
//                           isActive: true,
//                         ),
//                         getStep(
//                           title: 'Vote',
//                           child: VoteWidget(),
//                           isActive: _currentStep >= 1 ? true : false,
//                         ),
//                       ],
//                       onStepCancel: () {
//                         if (_currentStep <= 0) {
//                           voteState.activeVote = null;
//                         } else if (_currentStep <= 1) {
//                           voteState.selectedOptionInActiveVote = null;
//                         }

//                         setState(() {
//                           _currentStep =
//                               (_currentStep - 1) < 0 ? 0 : _currentStep - 1;
//                         });
//                       },
//                       onStepContinue: () {
//                         if (_currentStep == 0) {
//                           if (step2Required(voteState)) {
//                             setState(() {
//                               _currentStep =
//                                   (_currentStep + 1) > 2 ? 2 : _currentStep + 1;
//                             });
//                           } else {
//                             showSnackBar(
//                                 context, 'Please select a vote first!');
//                           }
//                         } else if (_currentStep == 1) {
//                           if (step3Required(voteState)) {
//                             // submit vote
//                             markMyVote(voteState);

//                             // Go To Result Screen
//                             Navigator.pushReplacementNamed(context, '/result');
//                           } else {
//                             showSnackBar(context, 'Please mark your vote!');
//                           }
//                         }
//                       },
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class Home extends StatelessWidget {
  final UserController _userController = Get.find();
  final VoteController _voteController = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      background: Image.asset(
        'assets/images/home_bg.png',
        height: Get.height,
        width: Get.width,
        fit: BoxFit.fill,
      ),
      body: Scaffold(
        backgroundColor: Colors.transparent,
        body: Obx(
          () => Container(
            width: Get.width,
            height: Get.height,
            padding: EdgeInsets.all(spacing * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Hello,",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      _userController.userData.value.name,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      _userController.userData.value.email,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    SizedBox(height: spacing * 2),
                    Text(
                      "Choose your vote wisely",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: spacing),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Daily Activity",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        SizedBox(height: 12),
                        if (_voteController.voteLists == null)
                          Container(
                            color: Colors.lightBlue,
                            child: Center(
                              child: showLoading(),
                            ),
                          ),
                        if (_voteController.voteLists != null)
                          Expanded(
                            child: Stepper(
                              type: StepperType.horizontal,
                              currentStep: _voteController.currentStep.value,
                              steps: [
                                _voteController.getStep(
                                  title: 'Choose',
                                  child: VoteListWidget(),
                                  isActive: true,
                                ),
                                _voteController.getStep(
                                  title: 'Vote',
                                  child: VoteWidget(),
                                  isActive:
                                      _voteController.currentStep.value >= 1
                                          ? true
                                          : false,
                                ),
                              ],
                              onStepCancel: () {
                                if (_voteController.currentStep.value <= 0) {
                                  _voteController.activeVote.value = null;
                                } else if (_voteController.currentStep.value <=
                                    1) {
                                  _voteController
                                      .selectedOptionInActiveVotee.value = null;
                                }

                                _voteController.currentStep.value =
                                    (_voteController.currentStep.value - 1) < 0
                                        ? 0
                                        : _voteController.currentStep.value - 1;
                              },
                              onStepContinue: () {
                                if (_voteController.currentStep.value == 0) {
                                  if (_voteController.step2Required()) {
                                    _voteController
                                        .currentStep.value = (_voteController
                                                    .currentStep.value +
                                                1) >
                                            2
                                        ? 2
                                        : _voteController.currentStep.value + 1;
                                  } else {
                                    Get.snackbar("Notice!",
                                        "Please select a vote first!");
                                  }
                                } else if (_voteController.currentStep.value ==
                                    1) {
                                  if (_voteController.step3Required()) {
                                    // submit vote
                                    _voteController.markMyVote();

                                    // Go To Result Screen
                                    Get.off(ResultScreen());
                                    // Navigator.pushReplacementNamed(
                                    //     context, '/result');
                                  } else {
                                    Get.snackbar(
                                        "Notice!", 'Please mark your vote!');
                                  }
                                }
                              },
                            ),
                          ),
                        SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacing * 1.5),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "GOOD",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3
                                          .copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      "Performance",
                                      style: TextStyle(height: 1),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(width: spacing),
                              Container(
                                height: 65,
                                width: 1,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(width: spacing),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.star_rounded,
                                        color: Theme.of(context).primaryColor),
                                    Icon(Icons.star_rounded,
                                        color: Theme.of(context).primaryColor),
                                    Icon(Icons.star_rounded,
                                        color: Theme.of(context).primaryColor),
                                    Icon(Icons.star_rounded,
                                        color: Theme.of(context).primaryColor),
                                    Icon(Icons.star_half_rounded,
                                        color: Theme.of(context).primaryColor),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
