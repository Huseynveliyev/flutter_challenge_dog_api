part of 'fetch_random_breed_cubit.dart';

sealed class FetchRandomBreedState extends Equatable {
  const FetchRandomBreedState();

  @override
  List<Object> get props => [];
}

final class FetchRandomBreedInitial extends FetchRandomBreedState {}

final class FetchRandomBreedProgress extends FetchRandomBreedState {}

final class FetchRandomBreedSuccess extends FetchRandomBreedState {
  final SingleBreedRandomModel response;

  const FetchRandomBreedSuccess({required this.response});
  @override
  List<Object> get props => [response];
}

final class FetchRandomBreedFailure extends FetchRandomBreedState {
  final HttpException message;

  const FetchRandomBreedFailure({required this.message});
  @override
  List<Object> get props => [message];
}
