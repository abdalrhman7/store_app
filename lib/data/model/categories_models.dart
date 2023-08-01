import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'categories_models.g.dart';

@HiveType(typeId: 1)
class CategoriesModel extends Equatable {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? image;

  CategoriesModel({this.id, this.name, this.image});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  @override
  List<Object?> get props => [id, name, image];
}
