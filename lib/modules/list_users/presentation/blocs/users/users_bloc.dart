import 'package:bloc/bloc.dart';
import 'package:koobeam/modules/list_users/domain/entities/user.entity.dart';
import 'package:koobeam/modules/list_users/domain/entities/user_added.entity.dart';
import 'package:koobeam/modules/list_users/domain/usecase/get_users.usecase.dart';
import 'package:koobeam/modules/list_users/exceptions/no_internet_exception.dart';
import 'package:meta/meta.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUseCase getUsersUseCase;

  UsersBloc({
    required this.getUsersUseCase,
  }) : super(UsersInitial()) {
    on<OnGetUsers>(_onGetUsers);
    on<OnAddNewUSer>(_onAddNewUser);
  }

  Future<void> _onAddNewUser(
      OnAddNewUSer event, Emitter<UsersState> emit) async {
    emit(LoadingAddingNewUSer());
    try {
      await getUsersUseCase.addNewUserUseCase(
        userAddedEntity: event.userAddedEntity,
      );
      emit(UserAddedSuccessfull());
    } on NoInternetException catch (_) {
      emit(NoInternetState());
    } catch (e) {
      emit(ErrorOnAddNewUSer());
    }
  }

  bool isUserAllValuesEmpty(UserEntity userEntity) {
    return userEntity.email!.isEmpty &&
        userEntity.firstName!.isEmpty &&
        userEntity.lastName!.isEmpty &&
        userEntity.pictureUrl!.isEmpty &&
        userEntity.username!.isNotEmpty;
  }

  Future<void> _onGetUsers(OnGetUsers event, Emitter<UsersState> emit) async {
    emit(LoadingUsersState());
    try {
      List<UserEntity> users = await getUsersUseCase.getListUserUseCase();
      emit(UsersGotSuccessfull(users: users));
    } on NoInternetException catch (_) {
      emit(NoInternetState());
    } catch (e) {
      emit(ErrorOnGetUsersState());
    }
  }
}
