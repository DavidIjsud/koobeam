import 'package:koobeam/api_request/data_source_general.impl.dart';

class ResponseAddDto implements GenericDTOMap {
  String firstName;
  String lastName;
  String username;
  String email;
  String pictureUrl;

  ResponseAddDto({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.pictureUrl,
  });

  factory ResponseAddDto.fromJson(Map<String, dynamic> json) => ResponseAddDto(
        firstName: json.containsKey("lastName") ? json["firstName"] : "",
        lastName: json.containsKey("lastName") ? json["lastName"] : "",
        username: json.containsKey("username") ? json["username"] : "",
        email: json.containsKey("email") ? json["email"] : "",
        pictureUrl: json.containsKey("pictureURL") ? json["pictureURL"] : "",
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
