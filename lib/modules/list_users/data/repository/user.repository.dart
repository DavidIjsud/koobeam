import 'package:koobeam/modules/list_users/domain/entities/user.entity.dart';
import 'package:koobeam/modules/list_users/domain/entities/user_added.entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getListUser();
  Future<UserAddedEntity> addNewUser({
    required UserAddedEntity userEntityToAdd,
  });
}
