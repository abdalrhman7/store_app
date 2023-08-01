// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsModelAdapter extends TypeAdapter<ProductsModel> {
  @override
  final int typeId = 0;

  @override
  ProductsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductsModel(
      id: fields[0] as int?,
      title: fields[1] as String?,
      price: fields[2] as int?,
      description: fields[3] as String?,
      category: fields[4] as CategoriesModel?,
      images: (fields[5] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductsModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
