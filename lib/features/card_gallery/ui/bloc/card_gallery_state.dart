part of 'card_gallery_bloc.dart';

@Freezed()
class CardGalleryState with _$CardGalleryState {
  const factory CardGalleryState.initial({required CardsPage page, required CardFilterParams cardFilterParams}) = _CardGalleryInitial;
  const factory CardGalleryState.fetching({required CardFilterParams cardFilterParams}) = _CardGalleryLoading;
  const factory CardGalleryState.loaded({required CardsPage page}) = _CardGalleryLoaded;
  const factory CardGalleryState.failure({required Failure failure}) = _CardGalleryError;
}
