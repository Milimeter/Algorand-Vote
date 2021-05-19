import 'package:algorand_vote/constants/firebase.dart';
import 'package:algorand_vote/models/user.dart';
import 'package:algorand_vote/screen/control/algorand_setup.dart';
import 'package:algorand_vote/screen/drawer/home.dart';
import 'package:algorand_vote/screen/intro2.dart';
import 'package:algorand_vote/services/algo_services.dart';
import 'package:algorand_vote/services/bloc/wallet_bloc.dart';
import 'package:algorand_vote/widget/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:algorand_vote/screen/intro.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController fullnameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneNoTextEditingController = TextEditingController();
  Rx<User> firebaseUser;
  String usersCollection = "users";
  final _storage = GetStorage();
  Rx<UserData> userData = UserData().obs;
  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, setInitialScreen);
  }

  setInitialScreen(User user) {
    bool onInstall = _storage.read("FreshInstall");
    bool walletCreated = _storage.read("walletCreated");
    if (onInstall == true || onInstall == null) {
      Get.offAll(IntroScreen());
    } else {
      if (user == null) {
        Get.offAll(IntroLogin());
      } else {
        if (walletCreated == true || walletCreated != null) {
          userData.bindStream(userDataStream());
          Get.offAll(HomeScreen());
        } else {
          provideWalletPage();
          // Get.offAll(AlgorandSetup());
        }
      }
    }
  }

  Widget provideWalletPage() {
    return BlocProvider(
      create: (_) => WalletBloc(accountRepository: accountRepository)..start(),
      child: AlgorandSetup(),
    );
  }

  signIn() async {
    showLoading();
    try {
      await auth
          .signInWithEmailAndPassword(
              email: emailTextEditingController.text.trim(),
              password: passwordTextEditingController.text.trim())
          .then((result) {
        userData.bindStream(userDataStream());
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
