import 'package:koobeam/api_request/data_source_general.impl.dart';

class UsersDto implements GenericDTOMap {
  int id;
  String firstName;
  String lastName;
  String username;
  String email;
  String gender;
  String pictureUrl;
  String phone;
  DateTime birthday;
  String twitterHandle;

  UsersDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.gender,
    required this.pictureUrl,
    required this.phone,
    required this.birthday,
    required this.twitterHandle,
  });

  factory UsersDto.fromJson(Map<String, dynamic> json) => UsersDto(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        username: json["username"],
        email: json["email"],
        gender: json["gender"],
        pictureUrl: json["pictureURL"],
        phone: json["phone"],
        birthday: DateTime.parse(json["birthday"]),
        twitterHandle: json["twitterHandle"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "email": email,
      };

  @override
  bool isCorrectTheResponse(Map<String, dynamic> jsonResponse) {
    return jsonResponse.containsKey("id");
  }

  @override
  bool isSuccessResponse(Map<String, dynamic> jsonResponse) {
    return true;
  }
}
