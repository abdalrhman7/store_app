import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

import 'categories_models.dart';

part 'products_models.g.dart';

@HiveType(typeId: 0)
class ProductsModel extends Equatable {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  int? price;
  @HiveField(3)
  String? description;
  @HiveField(4)
  CategoriesModel? category;
  @HiveField(5)
  List<String>? images;

  ProductsModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.images});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'] != null
        ? CategoriesModel.fromJson(json['category'])
        : null;
    images = json['images'].cast<String>();
  }

  @override
  List<Object?> get props => [id, title, price, description, category, images];
}
