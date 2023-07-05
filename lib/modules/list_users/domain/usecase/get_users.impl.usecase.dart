import 'package:koobeam/modules/list_users/data/repository/user.repository.dart';
import 'package:koobeam/modules/list_users/domain/entities/user.entity.dart';
import 'package:koobeam/modules/list_users/domain/entities/user_added.entity.dart';
import 'package:koobeam/modules/list_users/domain/usecase/get_users.usecase.dart';

class GetUserUseCaseImpl implements GetUsersUseCase {
  final UserRepository userRepository;

  const GetUserUseCaseImpl({
    required this.userRepository,
  });

  @override
  Future<List<UserEntity>> getListUserUseCase() async {
    return userRepository.getListUser();
  }

  @override
  Future<UserAddedEntity> addNewUserUseCase({
    required UserAddedEntity userAddedEntity,
  }) async {
    return await userRepository.addNewUser(userEntityToAdd: userAddedEntity);
  }
}
