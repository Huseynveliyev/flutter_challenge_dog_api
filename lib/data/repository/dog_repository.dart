import 'package:flutter_challenge_dog_api/data/models/image_list_by_breed.dart';
import 'package:flutter_challenge_dog_api/data/models/single_breed_random_model.dart';
import 'package:flutter_challenge_dog_api/presentation/data/services/api.dart';




abstract class DogRepository {
  Future<SingleBreedRandomModel> fetchSingleRandomBreed();
  Future<ImageListByBreedModel> fetchDogsByBreeds({required String breed});
}

class DogRepositorImpl implements DogRepository {
  @override
  Future<ImageListByBreedModel> fetchDogsByBreeds({required String breed}) async {
    final ApiService apiService = ApiService();
    return await apiService.fetchDogsByBreeds(breed);
  }

  @override
  Future<SingleBreedRandomModel> fetchSingleRandomBreed() async {
    final ApiService apiService = ApiService();
    return await apiService.fetchSingleRandomBreed();
  }
}
