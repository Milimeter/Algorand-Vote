import 'dart:typed_data';

import 'package:algorand_dart/algorand_dart.dart';
import 'package:algorand_vote/a.dart';
import 'package:algorand_vote/database/entities.dart';
import 'package:algorand_vote/database/entities/box_entity.dart';


part 'account_entity.g.dart';

@HiveType(typeId: accountTypeId, adapterName: 'AccountAdapter')
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
