import 'package:koobeam/modules/list_users/domain/entities/user.entity.dart';
import 'package:koobeam/modules/list_users/domain/entities/user_added.entity.dart';

abstract class GetUsersUseCase {
  Future<List<UserEntity>> getListUserUseCase();
  Future<UserAddedEntity> addNewUserUseCase({
    required UserAddedEntity userAddedEntity,
  });
}
