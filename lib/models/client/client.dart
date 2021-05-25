import 'dart:convert' as convert;


import 'package:flutter/widgets.dart';
import 'package:flutter_desktop/helpers/consts.dart';
import 'package:flutter_desktop/helpers/prefs.dart';

class Client extends ChangeNotifier {
  int id;
  String name;
  String genre;
  String email;
  String bi;
  DateTime birthDate;
  String phone;
  String pic;
  String password;
  String token;
  Client();

  Client.fromJSON(Map<String, dynamic> fromJSON) {
    Map json = fromJSON["data"]["client"];
    this.id = json['id'];
    this.name = json["name"];
    this.bi = json["bi"];
    this.email = json["email"];
    this.pic = json["pic"];
    this.password = json["password"];
    this.genre = json["genre"];
    this.phone = json["phone"];
    this.token = fromJSON["data"]["token"];
    this.birthDate = DateTime.tryParse(json["birthDate"]);
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data["id"] = this.id;
    data["name"] = this.name;
    data["bi"] = this.bi;
    data["email"] = this.email;
    data["pic"] = this.pic;
    data["password"] = this.password;
    data["genre"] = this.genre;
    data["phone"] = this.phone;
    data["token"] = this.token;

    // data["birthDate"] = this.birthDate;

    return data;
  }



  @override
  String toString() {
    return "Client(id: $id, name: $name, pic: $pic genre: $genre, email $email, bi: $bi, birthDate: $birthDate, phone: $phone, token: $token)";
  }
}