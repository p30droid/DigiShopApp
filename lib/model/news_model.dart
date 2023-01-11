
import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';
@JsonSerializable()
class News{

  String? id;
  String? title;
  String? icon;
  String? type;
  String? link;

  News({this.id, this.title, this.icon, this.type, this.link});


  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);


}