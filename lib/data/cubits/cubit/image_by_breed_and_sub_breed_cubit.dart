import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_challenge_dog_api/data/cubits/fetch_dogs_by_breed_cubit.dart';
import 'package:flutter_challenge_dog_api/data/cubits/fetch_random_breed_cubit.dart';
import 'package:flutter_challenge_dog_api/data/repository/dog_repository.dart';

import '../../models/single_breed_random_model.dart';

part 'image_by_breed_and_sub_breed_state.dart';

class RandomImageByBreedAndSubBreedCubit extends Cubit<ImageByBreedAndSubBreedState> {
  RandomImageByBreedAndSubBreedCubit() : super(ImageByBreedAndSubBreedInitial());
  final DogRepository dogRepository = DogRepositorImpl();

  fetchImageByBreedAndSub({required String selectedBreed, required String selectedSubBreed}) async {
    emit(ImageByBreedAndSubBreedProgress());
    try {
      final response =
          await dogRepository.fetchImageByBreedAndSub(selectedBreed: selectedBreed, selectedSubBreed: selectedSubBreed);
      emit(ImageByBreedAndSubBreedSuccess(response: response));
    } on HttpException catch (e) {
      emit(ImageByBreedAndSubBreedFailure(message: e));
    }
  }
}
