class SingleBreedRandomModel {
  String? message;
  String? status;

  SingleBreedRandomModel({this.message, this.status});

  SingleBreedRandomModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

 
}