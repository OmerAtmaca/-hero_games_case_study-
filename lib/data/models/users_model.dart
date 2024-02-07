import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../api_services/firebase_service/firebase_base_model.dart';

class UsersModel extends FirebaseBaseModel<UsersModel> with IdModel {
  @override
  final String? id;
  final String? firstName;
  final String? lastName;
  final DateTime? birthday;
  final List<String>? hobbies;

  UsersModel(
      {this.id, this.birthday, this.firstName, this.lastName, this.hobbies});

  UsersModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    DateTime? birthday,
    List<String>? hobbies,
  }) {
    return UsersModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthday: birthday ?? this.birthday,
      hobbies: hobbies ?? this.hobbies,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'birthday': birthday,
      'hobbies': hobbies,
    };
  }

  factory UsersModel.fromMap(Map<String, dynamic> map) {
    return UsersModel(
        id: map['id'] != null ? map['id'] as String : null,
        firstName: map['firstName'] != null ? map['firstName'] as String : null,
        lastName: map['lastName'] != null ? map['lastName'] as String : null,
        birthday: map['birthday'] != null
            ? ((map['birthday'] as Timestamp).toDate())
            : null,
        hobbies: map["hobbies"] == null
            ? []
            : List<String>.from(map["hobbies"]!.map((x) => x)));
  }

  factory UsersModel.fromJson(String source) =>
      UsersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  UsersModel fromJson(Map<String, dynamic> json) {
    return UsersModel.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return toMap();
  }
}

class TimestampSerializer implements JsonConverter<DateTime, dynamic> {
  const TimestampSerializer();

  @override
  DateTime fromJson(dynamic timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
