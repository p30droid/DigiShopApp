// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String?,
      catId: json['catId'] as String?,
      catName: json['catName'] as String?,
      title: json['title'] as String?,
      brand: json['brand'] as String?,
      garanti: json['garanti'] as String?,
      count: json['count'] as String?,
      shortDescription: json['shortDescription'] as String?,
      fullDescription: json['fullDescription'] as String?,
      special: json['special'] as String?,
      discount: json['discount'] as String?,
      rate: json['rate'] as String?,
      price: json['price'] as String?,
      icon: json['icon'] as String?,
      gallery: (json['gallery'] as List<dynamic>?)
          ?.map((e) => Gallery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'catId': instance.catId,
      'catName': instance.catName,
      'title': instance.title,
      'brand': instance.brand,
      'garanti': instance.garanti,
      'count': instance.count,
      'shortDescription': instance.shortDescription,
      'fullDescription': instance.fullDescription,
      'special': instance.special,
      'discount': instance.discount,
      'rate': instance.rate,
      'price': instance.price,
      'icon': instance.icon,
      'gallery': instance.gallery,
    };
