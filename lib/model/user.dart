import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class User {
  final String? idUser;
  final String? name;
  final String? email;

  const User({
    this.idUser,
    @required this.name,
    @required this.email,
  });

  User copyWith({
    String? idUser,
    String? name,
    String? email,
    //String? lastMessageTime,
  }) =>
      User(
          idUser: idUser ?? this.idUser,
          name: name ?? this.name,
          email: email ?? this.email
          //lastMessageTime: lastMessageTime ?? this.lastMessageTime,
          );
  // static DateTime toDateTime(Timestamp value) {
  //   if (value == null) return null;
  //
  //   return value.toDate();
  // }
  //
  // static dynamic fromDateTimeToJson(DateTime date) {
  //   if (date == null) return null;
  //
  //   return date.toUtc();
  // }

  static User fromJson(Map<String, dynamic> json) => User(
        idUser: json['idUser'],
        name: json['name'],
        email: json['email'],
        //lastMessageTime: toDateTime(json['lastMessageTime']),
      );

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'name': name,
        'email': email,
        //'lastMessageTime': fromDateTimeToJson(lastMessageTime),
      };
}
