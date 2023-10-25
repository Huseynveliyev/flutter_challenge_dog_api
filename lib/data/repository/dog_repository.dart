import 'package:flutter_challenge_dog_api/data/models/image_list_by_breed.dart';
import 'package:flutter_challenge_dog_api/data/models/single_breed_random_model.dart';
import 'package:flutter_challenge_dog_api/data/services/api.dart';


abstract class DogRepository {
  Future<SingleBreedRandomModel> fetchSingleRandomBreed();
  Future<ImageListByBreedModel> fetchDogsByBreeds();
}

class DogRepositorImpl implements DogRepository {
  @override
  Future<ImageListByBreedModel> fetchDogsByBreeds() async {
    final ApiService apiService = ApiService();
    return await apiService.fetchDogsByBreeds();
  }

  @override
  Future<SingleBreedRandomModel> fetchSingleRandomBreed() async {
    final ApiService apiService = ApiService();
    return await apiService.fetchSingleRandomBreed();
  }
}
