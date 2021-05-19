import 'dart:typed_data';

import 'package:algorand_dart/algorand_dart.dart';
import 'package:hive/hive.dart';

class AccountEntity implements BoxEntity<Account> {
  @HiveField(0)
  String publicAddress;

  @HiveField(1)
  Uint8List privateKey;

  AccountEntity();

  AccountEntity.account(Account account, Uint8List privateKey) {
    this.publicAddress = account.publicAddress;
    this.privateKey = privateKey;
  }

  @override
  Future<Account> unwrap() async {
    return Account.fromSeed(this.privateKey);
  }
}

abstract class BoxEntity<T> {
  Future<T> unwrap();
}
