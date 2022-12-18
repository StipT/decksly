import 'package:decksly/common/exceptions.dart';
import 'package:decksly/common/network_info.dart';
import 'package:decksly/repository/remote_source/api/api_service.dart';
import 'package:decksly/repository/remote_source/api/dto/card_dto/card_dto.dart';
import 'package:injectable/injectable.dart';

abstract class CardsRepository {
  Future<List<CardDTO>> getCards(String language, int page);
}

@LazySingleton(as: CardsRepository)
class CardsRepositoryImpl extends CardsRepository {
  CardsRepositoryImpl(
    this._apiService,
    this._networkInfo,
  );

  final ApiService _apiService;
  final NetworkInfo _networkInfo;

  @override
  Future<List<CardDTO>> getCards(String language, int page) async {
    if (!await _networkInfo.isConnected) {
      throw NoInternetException();
    }
    final cardResponse = await _apiService.apiClient.getCards("en_US");
    return cardResponse.cards;
  }
}
