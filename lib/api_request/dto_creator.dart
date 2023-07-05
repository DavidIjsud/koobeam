import 'package:koobeam/api_request/data_source_general.impl.dart';
import 'package:koobeam/modules/list_users/data/dtos/response_add.dto.dart';
import 'package:koobeam/modules/list_users/data/dtos/user.dto.dart';

abstract class DtosCreator {
  static GenericDTOs? checkDto<T extends GenericDTOs>(
      Map<String, dynamic> response) {
    switch (T) {
      case UsersDto:
        return UsersDto.fromJson(response);
      case ResponseAddDto:
        return ResponseAddDto.fromJson(response);
      default:
        return null;
    }
  }
}
