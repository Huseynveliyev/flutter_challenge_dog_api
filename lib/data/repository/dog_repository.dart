import 'package:flutter_challenge_dog_api/data/models/image_list_by_breed.dart';
import 'package:flutter_challenge_dog_api/data/models/single_breed_random_model.dart';
import 'package:flutter_challenge_dog_api/data/services/api.dart';

abstract class DogRepository {
  Future<SingleBreedRandomModel> fetchSingleRandomBreed();
  Future<ImageListByBreedModel> fetchDogsByBreeds();
  Future<SingleBreedRandomModel> fetchImageByBreedAndSub(
      {required String selectedBreed, required String selectedSubBreed});
  Future<ImageListByBreedModel> fetchImageListByBreedAndSubBreed(
      {required String selectedBreed, required String selectedSubBreed});
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

  @override
  Future<SingleBreedRandomModel> fetchImageByBreedAndSub(
      {required String selectedBreed, required String selectedSubBreed}) async {
    final ApiService apiService = ApiService();
    return await apiService.fetchImageByBreedAndSub(selectedBreed: selectedBreed, selectedSubBreed: selectedSubBreed);
  }
  
  @override
  Future<ImageListByBreedModel> fetchImageListByBreedAndSubBreed({required String selectedBreed, required String selectedSubBreed})async {
    final ApiService apiService = ApiService();
    return await apiService.fetchImageListByBreedAndSubBreed(selectedBreed: selectedBreed, selectedSubBreed: selectedSubBreed);
   
  }
}
