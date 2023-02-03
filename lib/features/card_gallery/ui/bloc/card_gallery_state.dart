part of 'card_gallery_bloc.dart';

@Freezed()
class CardGalleryState with _$CardGalleryState {
  const factory CardGalleryState.initial({required CardsPage page, required CardFilterParams cardFilterParams}) = _CardGalleryInitial;
  const factory CardGalleryState.loading() = _CardGalleryLoading;
  const factory CardGalleryState.loaded({required CardsPage page, required CardFilterParams cardFilterParams}) = _CardGalleryLoaded;
  const factory CardGalleryState.error({required Failure failure}) = _CardGalleryError;
}
