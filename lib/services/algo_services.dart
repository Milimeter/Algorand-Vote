
import 'package:algorand_dart/algorand_dart.dart';
import 'package:algorand_vote/services/algo_repo.dart';

final algorand = Algorand(
  algodClient: AlgodClient(
    apiUrl: AlgoExplorer.TESTNET_ALGOD_API_URL,
    apiKey: '',
  ),
  indexerClient: IndexerClient(
    apiUrl: AlgoExplorer.TESTNET_INDEXER_API_URL,
    apiKey: '',
  ),
);

final accountRepository = AccountRepository();