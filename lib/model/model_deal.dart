import 'package:cloud_firestore/cloud_firestore.dart';

class DealModel {
  String? title;
  String? text;
  String? price;
  bool? like;
  Timestamp? date;
  String? location;
  String? nickname;
  int? number;
  String? id;

  DealModel(
      {this.title,
        this.text,
        this.price,
        this.like,
        this.date,
        this.location,
        this.nickname,
        this.number,
        this.id,
        });

  DealModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['text'];
    price = json['price'];
    like = json['like'];
    date = json['date'];
    location = json['location'];
    nickname = json['nickname'];
    number = json['number'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['text'] = text;
    data['price'] = price;
    data['like'] = like;
    data['date'] = date;
    data['location'] = location;
    data['nickname'] = nickname;
    data['number'] = number;
    data['id'] = id;
    return data;
  }
}