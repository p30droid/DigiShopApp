
import 'package:digi_shop_app/model/product_model.dart';

import 'data_model.dart';
import 'news_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'base_model.g.dart';
@JsonSerializable()
class BaseModel {
  List<News>? news;
  List<Product>? mobile;
  List<Product>? makeup;
  List<Product>? discount;
   List<Product>? AmazingOffer;
  Data? data;

  BaseModel({this.news,
    this.mobile,
    this.makeup,
    this.discount,
    this.AmazingOffer,
    this.data});


  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BaseModelToJson(this);

}