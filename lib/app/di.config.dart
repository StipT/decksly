// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../common/util/network_info.dart' as _i5;
import '../features/card_gallery/domain/repository/cards_repository.dart'
    as _i6;
import '../features/card_gallery/domain/usecase/fetch_cards_usecase.dart'
    as _i8;
import '../features/card_gallery/ui/bloc/card_gallery_bloc.dart' as _i10;
import '../features/deck_builder/ui/bloc/deck_builder_bloc.dart' as _i11;
import '../features/deck_selection/domain/repository/deck_repository.dart'
    as _i7;
import '../features/deck_selection/domain/usecase/fetch_deck_usecase.dart'
    as _i9;
import '../features/deck_selection/ui/bloc/deck_selection_bloc.dart' as _i12;
import '../repository/remote_source/api/api_service.dart' as _i3;
import 'util_module.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final utilModule = _$UtilModule();
  gh.factory<_i3.ApiService>(() => _i3.ApiServiceImpl());
  gh.lazySingleton<_i4.Connectivity>(() => utilModule.connectivity);
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i5.NetworkInfoImpl(get<_i4.Connectivity>()));
  gh.lazySingleton<_i6.CardsRepository>(() => _i6.CardsRepositoryImpl(
        get<_i3.ApiService>(),
        get<_i5.NetworkInfo>(),
      ));
  gh.lazySingleton<_i7.DeckRepository>(() => _i7.DeckRepositoryImpl(
        get<_i3.ApiService>(),
        get<_i5.NetworkInfo>(),
      ));
  gh.lazySingleton<_i8.FetchCardsUsecase>(
      () => _i8.FetchCardsUsecase(get<_i6.CardsRepository>()));
  gh.lazySingleton<_i9.FetchDeckUsecase>(
      () => _i9.FetchDeckUsecase(get<_i7.DeckRepository>()));
  gh.factory<_i10.CardGalleryBloc>(() => _i10.CardGalleryBloc(
        get<_i5.NetworkInfo>(),
        fetchCardsUsecase: get<_i8.FetchCardsUsecase>(),
      ));
  gh.factory<_i11.DeckBuilderBloc>(() => _i11.DeckBuilderBloc(
        get<_i5.NetworkInfo>(),
        fetchCardsUsecase: get<_i8.FetchCardsUsecase>(),
      ));
  gh.factory<_i12.DeckSelectionBloc>(
      () => _i12.DeckSelectionBloc(get<_i9.FetchDeckUsecase>()));
  return get;
}

class _$UtilModule extends _i13.UtilModule {}
