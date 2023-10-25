
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge_dog_api/data/exception/http_exception.dart';
import 'package:flutter_challenge_dog_api/data/models/single_breed_random_model.dart';
import 'package:flutter_challenge_dog_api/data/repository/dog_repository.dart';




part 'fetch_random_breed_state.dart';

class FetchRandomBreedCubit extends Cubit<FetchRandomBreedState> {
  FetchRandomBreedCubit() : super(FetchRandomBreedInitial());
  final DogRepository dogRepository = DogRepositorImpl();

  fetchSingleRandomBreed() async {
    emit(FetchRandomBreedProgress());
    try {
      final response = await dogRepository.fetchSingleRandomBreed();
      emit(FetchRandomBreedSuccess(response: response));
    } on HttpException catch (e) {
      emit(FetchRandomBreedFailure(message: e));
    }
  }
}
