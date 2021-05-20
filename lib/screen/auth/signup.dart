import 'package:algorand_vote/constants/asset_path.dart';
import 'package:algorand_vote/controller/user_controller.dart';
import 'package:algorand_vote/screen/auth/login.dart';
import 'package:algorand_vote/screen/auth/widget/bottom_widget.dart';
import 'package:algorand_vote/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  final UserController _userController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _validateAndSave() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  _validateAndSubmit() async {
    print("authentication process");
    if (_validateAndSave()) {
      _userController.signUp();
    }
    print("Validate Error");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              Image.asset(signup),
              SizedBox(height: 20),
              Text("Create Account"),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? 'Field Cannot be empty' : null;
                },
                controller: _userController.fullnameTextEditingController,
                decoration: InputDecoration(
                  hintText: "Full Name",
                  border: OutlineInputBorder(),
                  prefixIcon:
                      Icon(Icons.verified_user, color: Colors.deepPurple),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                validator: (String value) {
                  Pattern pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(value))
                    return 'Enter Valid Email';
                  else
                    return null;
                },
                controller: _userController.emailTextEditingController,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail, color: Colors.deepPurple),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                
                validator: (password) {
                  Pattern pattern =
                      r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(password))
                    return 'At least one letter, At least one number, and be longer than six charaters';
                  else
                    return null;
                },
                controller: _userController.passwordTextEditingController,
                decoration: InputDecoration(
                  helperText: "Not less than 6 characters.", 
                  hintText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock, color: Colors.deepPurple),
                ),
              ),
              SizedBox(height: 11),
              Align(
                alignment: Alignment.centerRight,
                child: Text("Forgot password"),
              ),
              SizedBox(height: 20),
              CustomButton(
                text: "Sign Up",
                onTap: () => _validateAndSubmit(),
                bgColor: Colors.deepPurple,
              ),
              SizedBox(height: 11),
              BottomTextWidget(
                onTap: () => Get.off(Login()),
                text1: "Already have an account?",
                text2: "Sign in!!",
              ),
              Divider(color: Colors.deepPurple),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.google, color: Colors.blue[900]),
                  SizedBox(width: 20),
                  Icon(FontAwesomeIcons.facebook, color: Colors.orangeAccent),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
