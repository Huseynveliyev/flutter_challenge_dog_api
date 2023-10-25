import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_challenge_dog_api/data/models/image_list_by_breed.dart';
import '../exception/http_exception.dart';
import '../repository/dog_repository.dart';




part 'fetch_dogs_by_breed_state.dart';

class FetchDogsByBreedCubit extends Cubit<FetchDogsByBreedState> {
  FetchDogsByBreedCubit() : super(FetchDogsByBreedInitial());

   final DogRepository dogRepository = DogRepositorImpl();
   fetchDogsByBreeds() async {
    emit(FetchDogsByBreedProgress());
    try {
      final response = await dogRepository.fetchDogsByBreeds();
      emit(FetchDogsByBreedSuccess(response: response));
    } on HttpException catch (e) {
      emit(FetchDogsByBreedFailure(message: e));
    }
  }
}
