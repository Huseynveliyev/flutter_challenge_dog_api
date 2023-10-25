import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../constant/config.dart';
import '../../presentation/widgets/dropdown/dropdown.dart';
import '../exception/http_exception.dart';
import '../logging/dio_interceptor.dart';
import '../models/image_list_by_breed.dart';
import '../models/single_breed_random_model.dart';

class ApiService {
  final Dio _dio = Dio();
  ApiService() {
    //add base url in dio package
    _dio.options.baseUrl = ApiConfigs.baseUrl;
   // add dio interceptor(logger) in dio package
    _dio.interceptors.add(DioInterceptor());
  }

//Fetch random image by breed
  Future<SingleBreedRandomModel> fetchSingleRandomBreed() async {
    try {
       
      // https://dog.ceo/api/breed/Affenpinscher/images/random
      //breeds/image/random
      final response = await _dio.get("breed/$selectedBreed/images/random");
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 200) {
        return SingleBreedRandomModel.fromJson(response.data);
      } else {
        throw HttpException(message: response.statusMessage ?? "HTTP Error");
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.data);
      }
      throw HttpException(message: e.message ?? '');
    }
  }


//Fetch image list by breed
Future<ImageListByBreedModel> fetchDogsByBreeds() async {
    try {
      final response = await _dio.get("/breed/$selectedBreed/images");
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 200) {
        return ImageListByBreedModel.fromJson(response.data) ;
      } else {
        throw HttpException(message: response.statusMessage ?? "HTTP Error");
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e.response?.data);
      }
      throw HttpException(message: e.message ?? '');
    }
  }
}
