class ImageListByBreedModel {
  List<String>? message;
  String? status;

  ImageListByBreedModel({this.message, this.status});

  ImageListByBreedModel.fromJson(Map<String, dynamic> json) {
    message = json['message'].cast<String>();
    status = json['status'];
  }

  
}