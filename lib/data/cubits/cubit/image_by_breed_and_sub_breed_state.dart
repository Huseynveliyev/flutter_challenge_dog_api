part of 'image_by_breed_and_sub_breed_cubit.dart';

sealed class ImageByBreedAndSubBreedState extends Equatable {
  const ImageByBreedAndSubBreedState();

  @override
  List<Object> get props => [];
}

final class ImageByBreedAndSubBreedInitial extends ImageByBreedAndSubBreedState {}

final class ImageByBreedAndSubBreedProgress extends ImageByBreedAndSubBreedState {}

final class ImageByBreedAndSubBreedSuccess extends ImageByBreedAndSubBreedState {
  final SingleBreedRandomModel response;

  const ImageByBreedAndSubBreedSuccess({required this.response});
  @override
  List<Object> get props => [response];
}

final class ImageByBreedAndSubBreedFailure extends ImageByBreedAndSubBreedState {
  final HttpException message;

  const ImageByBreedAndSubBreedFailure({required this.message});
}
