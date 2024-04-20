// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:sangeet/models/dbIndex.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class UserModals extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String display_name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String userid;
  @HiveField(4)
  String gender;
  @HiveField(5)
  String phonenumber;
  @HiveField(6)
  String img;
  UserModals({
    required this.id,
    required this.display_name,
    required this.email,
    required this.userid,
    required this.gender,
    required this.phonenumber,
    required this.img,
  });

  UserModals copyWith({
    String? id,
    String? display_name,
    String? email,
    String? userid,
    String? gender,
    String? phonenumber,
    String? img,
  }) {
    return UserModals(
      id: id ?? this.id,
      display_name: display_name ?? this.display_name,
      email: email ?? this.email,
      userid: userid ?? this.userid,
      gender: gender ?? this.gender,
      phonenumber: phonenumber ?? this.phonenumber,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'display_name': display_name,
      'email': email,
      'userid': userid,
      'gender': gender,
      'phonenumber': phonenumber,
      'img': img,
    };
  }

  factory UserModals.fromMap(Map<String, dynamic> map) {
    return UserModals(
      id: map['id'].toString(),
      display_name: map['display_name'].toString(),
      email: map['email'].toString(),
      userid: map['userid'].toString(),
      gender: map['gender'].toString(),
      phonenumber: map['phonenumber'].toString(),
      img: map['img'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModals.fromJson(String source) =>
      UserModals.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModals(id: $id, display_name: $display_name, email: $email, userid: $userid, gender: $gender, phonenumber: $phonenumber, img: $img)';
  }

  @override
  bool operator ==(covariant UserModals other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.display_name == display_name &&
        other.email == email &&
        other.userid == userid &&
        other.gender == gender &&
        other.phonenumber == phonenumber &&
        other.img == img;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        display_name.hashCode ^
        email.hashCode ^
        userid.hashCode ^
        gender.hashCode ^
        phonenumber.hashCode ^
        img.hashCode;
  }
}
