// import 'package:algorand_dart/algorand_dart.dart';
// import 'package:algorand_vote/services/algo_entity.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';

// class AlgorandController extends GetxController {
//   static AlgorandController instance = Get.find();

//   final Box<AccountEntity> accountBox;

//   final BehaviorSubject<Account> _accountSubject =
//       new BehaviorSubject<Account>();

//    accountBox = Hive.box<AccountEntity>('accounts');

//   /// Listen for account changes
//   Stream<Account> get accountStateChanges => _accountSubject.stream;

//   /// Get the current active account.
//   Account? get account => _accountSubject.value;

//   /// Init the account repo and load the wallets
//   Future<void> init() async {
//     final account = await accountBox.get(0)?.unwrap();
//     if (account == null) return;

//     _accountSubject.add(account);
//   }

// }
