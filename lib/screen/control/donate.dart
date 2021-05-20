import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:algorand_vote/constants/asset_path.dart';
import 'package:algorand_vote/controller/algorand_controller.dart';
import 'package:algorand_vote/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Donate extends StatelessWidget {
  final String text1;
  final String text2;

  Donate({Key key, this.text1, this.text2}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AlgorandController _algorandController = Get.find();
  bool _validateAndSave() {
    final form = _formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget walletContainer() => Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue[200],
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(6),
                color: Colors.deepPurple,
                child: Text(
                  "Wallet Address",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              SelectableText(
                "FSCIJOKTVLQBHUTXUQHHOM5SJFZBXQ25G366EJRV3NGTEDVDBEOPVAHGZM",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
              ),
            ],
          ),
        );
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.deepPurple),
                  onPressed: () => Get.back(),
                ),
              ),
            ),
          ),
          Positioned(
            top: 55,
            left: 100,
            child: Text(
              "Donate Fund",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Container(
              height: size.height,
              width: size.width,
              margin: EdgeInsets.only(
                  top: size.height * 0.15, left: 9, right: 9, bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 60,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        image: DecorationImage(image: AssetImage(finegirl)),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      text1,
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      text2,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.deepPurple, size: 20),
                        Icon(Icons.star, color: Colors.deepPurple, size: 20),
                        Icon(Icons.star, color: Colors.deepPurple, size: 20),
                        Icon(Icons.star, color: Colors.deepPurple, size: 20),
                        Icon(Icons.star, color: Colors.blue, size: 20),
                      ],
                    ),
                    SizedBox(height: 10),
                    walletContainer(),
                    SizedBox(height: 30),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: TextFormField(
                          validator: (value) =>
                              value.isEmpty ? " Field Cannot be Empty" : null,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Input Amount",
                            prefixIcon: SizedBox(
                                height: 10, child: Image.asset(algorand)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 150,
            child: CustomButton(
              text: "Send",
              onTap: () async {
                if (_validateAndSave()) {
                  final result = await showOkCancelAlertDialog(
                    context: context,
                    title: 'Donate Algorand',
                    message:
                        'This will deduct the algorand value in your existing account.',
                  );

                  if (result == OkCancelResult.ok) {
                    //send algorand
                    var id = await _algorandController.createPayment(
                        "FSCIJOKTVLQBHUTXUQHHOM5SJFZBXQ25G366EJRV3NGTEDVDBEOPVAHGZM");
                    if (id == null) {
                      Get.snackbar("Error!", "Unable to make Transaction");
                    } else {
                      Get.snackbar("Success", "Transaction successful");
                    }
                  }
                }
                print("Validate Error");
              },
              bgColor: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
