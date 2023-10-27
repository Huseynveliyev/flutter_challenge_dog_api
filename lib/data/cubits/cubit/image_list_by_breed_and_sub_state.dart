part of 'image_list_by_breed_and_sub_cubit.dart';

sealed class ImageListByBreedAndSubState extends Equatable {
  const ImageListByBreedAndSubState();

  @override
  List<Object> get props => [];
}

final class ImageListByBreedAndSubInitial extends ImageListByBreedAndSubState {}

final class ImageListByBreedAndSubProgress extends ImageListByBreedAndSubState {}

final class ImageListByBreedAndSubSuccess extends ImageListByBreedAndSubState {
  final ImageListByBreedModel response;

  const ImageListByBreedAndSubSuccess({required this.response});
}

final class ImageListByBreedAndSubFailure extends ImageListByBreedAndSubState {
  final HttpException message;

  const ImageListByBreedAndSubFailure(this.message);
}
