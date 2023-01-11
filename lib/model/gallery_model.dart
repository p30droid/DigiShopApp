import 'package:json_annotation/json_annotation.dart';
part 'gallery_model.g.dart';
@JsonSerializable()
class Gallery {
  String? img;

  Gallery({this.img});


  factory Gallery.fromJson(Map<String, dynamic> json) => _$GalleryFromJson(json);
  Map<String, dynamic> toJson() => _$GalleryToJson(this);
}