import 'package:hive_flutter/hive_flutter.dart';
part 'users_dto.g.dart';
@HiveType(typeId: 0)
class UserDto extends HiveObject {
  @HiveField(0)
  int? userId;

  @HiveField(1)
  int? id;

  @HiveField(2)
  String? title;

  @HiveField(3)
  String? body;

  UserDto({this.userId, this.id, this.title, this.body});

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
