import 'package:algorand_vote/services/algo_repo.dart';
import 'package:algorand_vote/services/bloc/wallet_event.dart';
import 'package:algorand_vote/services/bloc/wallet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final AccountRepository accountRepository;

  WalletBloc({this.accountRepository}) : super(WalletInitial());

  /// Start the wallet bloc
  void start() {
    add(WalletStarted());
  }

  /// Create a new wallet.
  void createWallet() {
    add(WalletCreateStarted());
  }

  /// Import an existing wallet.
  void importWallet(String passPhrase) {
    add(WalletImportStarted(passphrase: passPhrase));
  }

  @override
  Stream<WalletState> mapEventToState(WalletEvent event) async* {
    if (event is WalletCreateStarted) {
      final account = await accountRepository.createAccount();

      yield WalletCreateSuccess(account: account);
    } else if (event is WalletImportStarted) {
      final words = event.passphrase.trim().split(' ');
      final account = await accountRepository.importAccount(words);

      yield WalletRestoreSuccess(account: account);
    }
  }
}
