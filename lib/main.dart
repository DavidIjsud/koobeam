import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koobeam/api_request/data_source_general.impl.dart';
import 'package:koobeam/modules/list_users/data/repository/user_repository.impl.dart';
import 'package:koobeam/modules/list_users/domain/usecase/get_users.impl.usecase.dart';
import 'package:koobeam/modules/list_users/presentation/blocs/users/users_bloc.dart';
import 'package:koobeam/modules/list_users/presentation/pages/users.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GetUserUseCaseImpl userUseCaseImpl = GetUserUseCaseImpl(
    userRepository: UserRepositoryImpl(
      dataSource: DataSourceImpl(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersBloc(getUsersUseCase: userUseCaseImpl),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PageUsers(),
      ),
    );
  }
}
