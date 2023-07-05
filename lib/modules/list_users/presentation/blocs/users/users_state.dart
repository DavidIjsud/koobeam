part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {}

class LoadingUsersState implements UsersState {}

class ErrorOnGetUsersState implements UsersState {}

class NoInternetState implements UsersState {}

class UsersGotSuccessfull implements UsersState {
  final List<UserEntity> users;

  const UsersGotSuccessfull({
    required this.users,
  });
}

class UserAddedSuccessfull implements UsersState {}

class ErrorOnAddNewUSer implements UsersState {}

class LoadingAddingNewUSer implements UsersState {}
