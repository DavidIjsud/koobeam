import 'package:koobeam/api_request/data_source_general.impl.dart';

abstract class DataSource {
  Future<Map<String, dynamic>>
      get<T extends GenericDTOs, NoSuccessResponseException extends Exception>(
          DataToRequest dataToRequest,
          {Map<String, String>? attributesPerformace});
  Future<Map<String, dynamic>> post<TypeDTO extends GenericDTOs,
          NoSuccessResponseException extends Exception>(
      DataToRequest dataToRequest,
      {Map<String, String>? attributesPerformace});
}
