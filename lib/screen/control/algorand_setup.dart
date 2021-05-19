import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:algorand_vote/screen/drawer/home.dart';
import 'package:algorand_vote/services/bloc/wallet_bloc.dart';
import 'package:algorand_vote/widget/wallet_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class AlgorandSetup extends StatelessWidget {
  static String routeName = '/wallet';
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Wallets',
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
            ),
            SizedBox(height: 40),
            Text(
              'Create or import a wallet to start sending and receiving digital currency',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
               color: Colors.deepPurple,
              ),
            ),
            Spacer(),
            WalletCard(
              title: 'Create',
              subtitle: 'a new wallet',
              backgroundColor: Colors.purpleAccent,
              onTapped: () async {
                final result = await showOkCancelAlertDialog(
                  context: context,
                  title: 'Create new account',
                  message:
                      'This will remove your existing account. Make sure you backed up the passphrase before continuing or you will lose your account.',
                );

                if (result == OkCancelResult.ok) {
                  context.read<WalletBloc>().createWallet();
                  box.write("walletCreated", true);
                  Get.offAll(HomeScreen());
                }
              },
            ),
            SizedBox(height: 40),
            WalletCard(
              title: 'Import',
              subtitle: 'an existing wallet',
              textColor: Colors.white,
              backgroundColor: Colors.deepPurple,
              onTapped: () async {
                final result = await showOkCancelAlertDialog(
                  context: context,
                  title: 'Recover from Passphrase',
                  message:
                      'This will remove your existing account. Make sure you backed up the passphrase before continuing or you will lose your account.',
                );

                if (result == OkCancelResult.ok) {
                  final input = await showTextInputDialog(
                    textFields: [DialogTextField()],
                    context: context,
                    title: 'Recover from Passphrase',
                    message: 'Recover an account with a 25-word passphrase.',
                  );

                  if (input != null && input.length > 0) {
                    context.read<WalletBloc>().importWallet(input[0]);
                    box.write("walletCreated", true);
                  }
                }
              },
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
