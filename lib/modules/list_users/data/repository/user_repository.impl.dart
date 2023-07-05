import 'package:koobeam/api_request/data_source_general.dart';
import 'package:koobeam/api_request/data_source_general.impl.dart';
import 'package:koobeam/modules/list_users/data/dtos/response_add.dto.dart';
import 'package:koobeam/modules/list_users/data/dtos/user.dto.dart';
import 'package:koobeam/modules/list_users/data/repository/user.repository.dart';
import 'package:koobeam/modules/list_users/domain/entities/user.entity.dart';
import 'package:koobeam/modules/list_users/domain/entities/user_added.entity.dart';
import 'package:koobeam/modules/list_users/exceptions/no_internet_exception.dart';

class UserRepositoryImpl implements UserRepository {
  final DataSource dataSource;

  UserRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<List<UserEntity>> getListUser() async {
    Map<String, dynamic> result =
        await dataSource.get<UsersDto, NoInternetException>(
      DataToRequest(
        url: 'https://jserver-api.herokuapp.com/users',
      ),
    );
    List<UsersDto> users = result['data'];

    return users
        .map((UsersDto user) => UserEntity(
              firstName: user.firstName,
              lastName: user.lastName,
              username: user.username,
              email: user.email,
              pictureUrl: user.pictureUrl,
            ))
        .toList();
  }

  @override
  Future<UserAddedEntity> addNewUser(
      {required UserAddedEntity userEntityToAdd}) async {
    Map<String, dynamic> result =
        await dataSource.post<ResponseAddDto, NoInternetException>(
      DataToRequest(
        url: 'https://jserver-api.herokuapp.com/users',
        body: userEntityToAdd.toJson(),
      ),
    );
    ResponseAddDto userAdded = result['data'];

    return UserAddedEntity(
      email: userAdded.email,
      firstName: userAdded.firstName,
      username: userAdded.username,
      lastName: userAdded.lastName,
    );
  }
}
