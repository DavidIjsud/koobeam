import 'dart:convert';
import 'dart:developer';

import 'package:koobeam/api_request/data_source_general.dart';
import 'package:http/http.dart' as http;
import 'package:koobeam/api_request/dto_creator.dart';
import 'package:koobeam/api_request/exceptions_creator.dart';
import 'package:koobeam/modules/list_users/exceptions/no_internet_exception.dart';

abstract class GenericDTOs {}

abstract class GenericDTOMap implements GenericDTOs {
  bool isCorrectTheResponse(Map<String, dynamic> jsonResponse);
  bool isSuccessResponse(Map<String, dynamic> jsonResponse);
}

abstract class GenericListDTO implements GenericDTOs {}

class DataToRequest {
  final Map<String, dynamic>? body;
  final Map<String, String>? hehaders;
  final String url;

  DataToRequest({
    this.body,
    this.hehaders,
    required this.url,
  });
}

class DataSourceImpl implements DataSource {
  @override
  Future<Map<String, dynamic>>
      get<T extends GenericDTOs, NoSuccessResponseException extends Exception>(
          DataToRequest dataToRequest,
          {Map<String, String>? attributesPerformace}) async {
    String url = dataToRequest.url;

    Uri uri = Uri.parse(url);
    http.Response result;
    try {
      result = await http
          .get(
        uri,
        headers: dataToRequest.hehaders,
      )
          .timeout(const Duration(seconds: 120), onTimeout: () async {
        throw NoInternetException();
      });
    } on NoInternetException {
      throw NoInternetException();
    } on Exception catch (_) {
      log("Error on call the api ${_.toString()}");
      throw Exception(_.toString());
    }

    if (result.statusCode == 200) {
      final resultConverted = jsonDecode(result.body);
      if (resultConverted is List) {
        return {
          "status": true,
          "message": "Data Obtained",
          "data": resultConverted
              .map(
                (userLocation) => DtosCreator.checkDto<T>(userLocation) as T,
              )
              .toList(),
        };
      } else {
        Map<String, dynamic> responseMap = jsonDecode(result.body);
        log("Url $url and body ${result.body}");
        GenericDTOMap? dtoResponse =
            DtosCreator.checkDto<T>(responseMap) != null
                ? DtosCreator.checkDto<T>(responseMap) as GenericDTOMap
                : null;
        if (dtoResponse != null &&
            dtoResponse.isCorrectTheResponse(responseMap)) {
          if (dtoResponse.isSuccessResponse(responseMap)) {
            return {
              "status": true,
              "message": "Data Obtained",
              "data": dtoResponse
            };
          } else {
            throw ExceptionCreator.checkException<NoSuccessResponseException>();
          }
        } else {
          throw Exception("Data obtained is not correct to show");
        }
      }
    } else {
      throw ExceptionCreator.checkException<NoSuccessResponseException>();
    }
  }

  @override
  Future<Map<String, dynamic>>
      post<T extends GenericDTOs, NoSuccessResponseException extends Exception>(
          DataToRequest dataToRequest,
          {Map<String, String>? attributesPerformace}) async {
    String url = dataToRequest.url;

    Uri uri = Uri.parse(url);
    http.Response result;
    try {
      result = await http
          .post(
        uri,
        body: jsonEncode(dataToRequest.body),
        headers: dataToRequest.hehaders,
      )
          .timeout(const Duration(seconds: 120), onTimeout: () async {
        throw NoInternetException();
      });
    } on NoInternetException {
      throw NoInternetException();
    } on Exception catch (_) {
      log("Error on call the api ${_.toString()}");
      throw Exception(_.toString());
    }

    if (result.statusCode == 200 || result.statusCode == 201) {
      final resultConverted = jsonDecode(result.body);
      if (resultConverted is List) {
        return {
          "status": true,
          "message": "Data Obtained",
          "data": resultConverted
              .map(
                (userLocation) => DtosCreator.checkDto<T>(userLocation) as T,
              )
              .toList(),
        };
      } else {
        Map<String, dynamic> responseMap = jsonDecode(result.body);
        log("Url $url and body ${result.body}");
        GenericDTOMap? dtoResponse =
            DtosCreator.checkDto<T>(responseMap) != null
                ? DtosCreator.checkDto<T>(responseMap) as GenericDTOMap
                : null;
        if (dtoResponse != null &&
            dtoResponse.isCorrectTheResponse(responseMap)) {
          if (dtoResponse.isSuccessResponse(responseMap)) {
            return {
              "status": true,
              "message": "Data Obtained",
              "data": dtoResponse
            };
          } else {
            throw ExceptionCreator.checkException<NoSuccessResponseException>();
          }
        } else {
          throw Exception("Data obtained is not correct to show");
        }
      }
    } else {
      log("Status different 200 ${result.body} got, $url ${dataToRequest.body}");

      throw ExceptionCreator.checkException<NoSuccessResponseException>();
    }
  }
}
