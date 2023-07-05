import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koobeam/modules/list_users/presentation/blocs/users/users_bloc.dart';
import 'package:koobeam/modules/list_users/presentation/pages/add_user.page.dart';
import 'package:koobeam/modules/list_users/presentation/pages/users_widgets/item_user.dart';
import 'package:koobeam/modules/list_users/presentation/pages/users_widgets/user_button.dart';

class PageUsers extends StatefulWidget {
  const PageUsers({super.key});

  @override
  State<PageUsers> createState() => _PageUsersState();
}

class _PageUsersState extends State<PageUsers> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UsersBloc>().add(OnGetUsers());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
        child: ButtonPrimary(
          isActive: true,
          width: MediaQuery.of(context).size.width * 0.8,
          height: 80,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return const PageAddUser();
            }));
          },
          text: "Agregar usuario",
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<UsersBloc, UsersState>(
          buildWhen: (previous, current) =>
              current is UsersGotSuccessfull || current is UsersInitial,
          builder: (context, state) {
            if (state is UsersGotSuccessfull) {
              return ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (_, int userIndex) {
                    bool isUserWithallValuesEmpties = context
                        .read<UsersBloc>()
                        .isUserAllValuesEmpty(state.users[userIndex]);
                    if (isUserWithallValuesEmpties) {
                      return Container();
                    }
                    return UserItem(
                      userEntity: state.users[userIndex],
                    );
                  });
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
