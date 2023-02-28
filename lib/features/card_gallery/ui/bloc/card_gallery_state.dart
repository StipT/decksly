part of 'card_gallery_bloc.dart';

@Freezed()
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
