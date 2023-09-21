import '../../domain/entities/geners.dart';

class GenersModel extends Geners{
  const GenersModel({required super.id, required super.name});
  
  factory GenersModel.fromJson(Map<String , dynamic> json){
    return GenersModel(id: json["id"], name: json["name"]);
  }
}