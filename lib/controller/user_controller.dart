import 'package:algorand_vote/constants/firebase.dart';
import 'package:algorand_vote/models/user.dart';
import 'package:algorand_vote/screen/home/home_screen.dart';
import 'package:algorand_vote/screen/home/intro_screen.dart';
import 'package:algorand_vote/widget/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController fullnameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneNoTextEditingController = TextEditingController();
  Rx<User> firebaseUser;
  String usersCollection = "users";
  // final _storage = GetStorage();
  Rx<UserData> userData = UserData().obs;
  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, setInitialScreen);
  }

  setInitialScreen(User user) {
    // bool onInstall = _storage.read("FreshInstall");
    // if (onInstall == true || onInstall == null) {
    //   Get.offAll(OnBoarding());
    // } else {
    if (user == null) {
      Get.offAll(IntroScreen());
    } else {
      userData.bindStream(userDataStream());
      Get.offAll(Home());
    }
  }

  signIn() async {
    showLoading();
    try {
      await auth
          .signInWithEmailAndPassword(
              email: emailTextEditingController.text.trim(),
              password: passwordTextEditingController.text.trim())
          .then((result) {
        _clearControllers();
      });
    } catch (e) {
      var error = e.toString().split("]");
      var displayError = error[1];
      Get.snackbar(
        "Error",
        displayError,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        duration: Duration(seconds: 5),
      );
    }
    dismissLoading();
  }

  signUp() async {
    showLoading();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: emailTextEditingController.text.trim(),
              password: passwordTextEditingController.text.trim())
          .then((result) {
        String userId = result.user.uid;
        addDataToDb(uid: userId);
        _clearControllers();
      });
    } catch (e) {
      var error = e.toString().split("]");
      var displayError = error[1];
      Get.snackbar(
        "Error",
        displayError,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        duration: Duration(seconds: 5),
      );
    }
    dismissLoading();
  }

  signOut() {
    auth.signOut();
  }

  addDataToDb({String uid}) async {
    await firebaseFirestore.collection(usersCollection).doc(uid).set({
      "uid": uid,
      "name": fullnameTextEditingController.text.trim(),
      "email": emailTextEditingController.text.trim(),
      "password": passwordTextEditingController.text.trim(),
    });
  }

  updateUserDataDb(Map<String, dynamic> data) {
    firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseUser.value.uid)
        .update(data)
        .then((value) {
      _clearControllers();
    });
    _clearControllers();
  }

  Stream<UserData> userDataStream() => firebaseFirestore
      .collection(usersCollection)
      .doc(firebaseUser.value.uid)
      .snapshots()
      .map((snapshot) => UserData.fromSnapshot(snapshot));

  Future<bool> isEmailVerified() async {
    return firebaseUser.value.emailVerified;
  }

  Future<void> sendEmailVerification() async {
    firebaseUser.value.sendEmailVerification();
  }

  _clearControllers() {
    emailTextEditingController.clear();
    passwordTextEditingController.clear();
    fullnameTextEditingController.clear();
    phoneNoTextEditingController.clear();
    usernameTextEditingController.clear();
  }
}