import 'package:algorand_vote/a.dart';
import 'package:algorand_vote/database/entities.dart';
import 'package:equatable/equatable.dart';

import 'box_entity.dart';

part 'algorand_standard_asset_entity.g.dart';

@HiveType(
    typeId: algorandStandardAssetTypeId,
    adapterName: 'AlgorandStandardAssetAdapter')
class AlgorandStandardAssetEntity implements BoxEntity<AlgorandStandardAsset> {
  @HiveField(0)
   int id;

  @HiveField(1)
   String name;

  @HiveField(2)
   String unitName;

  @HiveField(3)
   int amount;

  @HiveField(4)
   int decimals;

  AlgorandStandardAssetEntity();

  AlgorandStandardAssetEntity.asset(AlgorandStandardAsset asset) {
    this.id = asset.id;
    this.name = asset.name;
    this.unitName = asset.unitName;
    this.amount = asset.amount;
    this.decimals = asset.decimals;
  }

  @override
  Future<AlgorandStandardAsset> unwrap() async {
    return AlgorandStandardAsset(
      id: id,
      name: name,
      unitName: unitName,
      amount: amount,
      decimals: decimals,
    );
  }
}

class AlgorandStandardAsset extends Equatable {
  final int id;
  final String name;
  final String unitName;
  final int amount;
  final int decimals;

  AlgorandStandardAsset({
     this.id,
     this.name,
     this.unitName,
     this.amount,
     this.decimals,
  });

  AlgorandStandardAsset copyWith({
    int amount,
  }) {
    return AlgorandStandardAsset(
      id: id,
      name: name,
      unitName: unitName,
      amount: amount ?? this.amount,
      decimals: decimals,
    );
  }

  @override
  List<Object> get props => [id, name, unitName, amount, decimals];
}
