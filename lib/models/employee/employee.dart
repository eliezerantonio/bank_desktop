import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:flutter_desktop/helpers/prefs.dart';

class Employee  extends ChangeNotifier{
  bool state;
  int id;
  String name;
  String genre;
  String email;
  String token;
  String password;
  int accessLevel;
  String updatedAt;
  String createdAt;

  Employee(
      {this.state,
      this.id,
      this.name,
      this.genre,
      this.email,
      this.token,
      this.password,
      this.accessLevel,
      this.updatedAt,
      this.createdAt});

  Employee.fromJson(Map<String, dynamic> fromJson) {
   final json= fromJson["data"]["employee"];
    state = json['state'];
    id = json['id'];
    name = json['name'];
    genre = json['genre'];
    email = json['email'];
    token = fromJson["data"]['token'];
    password = json['password'];
    accessLevel = json['accessLevel'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

    Employee.fromJsonPrefs(Map<String, dynamic> json) {
    state = json['state'];
    id = json['id'];
    name = json['name'];
    genre = json['genre'];
    email = json['email'];
    token = json['token'];
    password = json['password'];
    accessLevel = json['accessLevel'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['id'] = this.id;
    data['name'] = this.name;
    data['genre'] = this.genre;
    data['email'] = this.email;
    data['token'] = this.token;
    data['password'] = this.password;
    data['accessLevel'] = this.accessLevel;
    data['updatedAt'] = this.updatedAt;
    data['createdAt'] = this.createdAt;
    return data;
  }

  void save() {
    Map map = toJson();
    //convertendo objecto/map para String
    //
    String json = convert.json.encode(map);
    Prefs.setString("employee.prefs", json);
  }

  void clear() {
    Prefs.setString("employee.prefs", "");
    notifyListeners();
  }

  @override
  String toString() {
    return "EmployeeModel(id: $id, name: $name, email: $email, genre: $genre, token: $token,  state: $state, password: $password)";
  }



}