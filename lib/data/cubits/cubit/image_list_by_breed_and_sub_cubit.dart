import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_challenge_dog_api/data/exception/http_exception.dart';
import 'package:flutter_challenge_dog_api/data/repository/dog_repository.dart';

import '../../models/image_list_by_breed.dart';

part 'image_list_by_breed_and_sub_state.dart';

class ImageListByBreedAndSubBreedCubit extends Cubit<ImageListByBreedAndSubState> {
  ImageListByBreedAndSubBreedCubit() : super(ImageListByBreedAndSubInitial());

  final DogRepository dogRepository = DogRepositorImpl();
  imageListByBreedAndSubBreed({required String selectedBreed, required String selectedSubBreed}) async {
    emit(ImageListByBreedAndSubProgress());
    try {
      final response = await dogRepository.fetchImageListByBreedAndSubBreed(
          selectedBreed: selectedBreed, selectedSubBreed: selectedSubBreed);
      emit(ImageListByBreedAndSubSuccess(response: response));
    } on HttpException catch (e) {
      emit(ImageListByBreedAndSubFailure(e));
    }
  }
}
