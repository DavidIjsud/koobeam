part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class OnGetUsers implements UsersEvent {}

class OnAddNewUSer implements UsersEvent {
  final UserAddedEntity userAddedEntity;

  const OnAddNewUSer({
    required this.userAddedEntity,
  });
}
