import "package:decksly/common/util/failures.dart";
import "package:decksly/domain/card_gallery/model/card_filter_params/card_filter_params.dart";
import "package:decksly/domain/card_gallery/model/cards_page/cards_page.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "card_gallery_state.freezed.dart";

@freezed
class CardGalleryState with _$CardGalleryState {
  const factory CardGalleryState.initial({required CardFilterParams cardFilterParams, required CardsPage page}) =
      _CardGalleryInitial;

  const factory CardGalleryState.fetching({required CardFilterParams cardFilterParams}) = _CardGalleryFetching;

  const factory CardGalleryState.localeChanged({required CardFilterParams cardFilterParams}) =
      _CardGalleryLocaleChanged;

  const factory CardGalleryState.fetched({required CardFilterParams cardFilterParams, required CardsPage page}) =
      _CardGalleryFetched;

  const factory CardGalleryState.failure({required CardFilterParams cardFilterParams, required Failure failure}) =
      _CardGalleryError;
}
