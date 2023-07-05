import 'package:koobeam/api_request/data_source_general.impl.dart';

class ResponseAddDto implements GenericDTOMap {
  int id;

  ResponseAddDto({required this.id});

  factory ResponseAddDto.fromJson(Map<String, dynamic> json) =>
      ResponseAddDto(id: json["id"]);

  Map<String, dynamic> toJson() => {};

  @override
  bool isCorrectTheResponse(Map<String, dynamic> jsonResponse) {
    return jsonResponse.containsKey("id");
  }

  @override
  bool isSuccessResponse(Map<String, dynamic> jsonResponse) {
    return true;
  }
}
