part of 'fetch_dogs_by_breed_cubit.dart';

sealed class FetchDogsByBreedState extends Equatable {
  const FetchDogsByBreedState();

  @override
  List<Object> get props => [];
}

final class FetchDogsByBreedInitial extends FetchDogsByBreedState {}
final class FetchDogsByBreedProgress extends FetchDogsByBreedState {}

final class FetchDogsByBreedSuccess extends FetchDogsByBreedState {
  final  ImageListByBreedModel response;

  const FetchDogsByBreedSuccess({required this.response});
  @override
  List<Object> get props => [response];
}

final class FetchDogsByBreedFailure extends FetchDogsByBreedState {
  final HttpException message;

  const FetchDogsByBreedFailure({required this.message});
  @override
  List<Object> get props => [message];
}
