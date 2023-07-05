import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koobeam/modules/list_users/domain/entities/user_added.entity.dart';
import 'package:koobeam/modules/list_users/presentation/blocs/users/users_bloc.dart';
import 'package:koobeam/modules/list_users/presentation/pages/users_widgets/user_button.dart';

class PageAddUser extends StatefulWidget {
  const PageAddUser({super.key});

  @override
  State<PageAddUser> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PageAddUser> {
  late TextEditingController _textEditingControllerFirstName,
      _textEditingControllerLastName,
      _textEditingControllerUserName,
      _textEditingControllerEmail;

  @override
  void initState() {
    super.initState();
    _initTextControllers();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _listenStatesOnAddNewUSer();
    });
  }

  _listenStatesOnAddNewUSer() {
    context.read<UsersBloc>().stream.listen((state) {
      if (state is UserAddedSuccessfull) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("User added succesfull")));
      }
    });
  }

  _initTextControllers() {
    _textEditingControllerEmail = TextEditingController();
    _textEditingControllerFirstName = TextEditingController();
    _textEditingControllerLastName = TextEditingController();
    _textEditingControllerUserName = TextEditingController();
  }

  UserAddedEntity _buildUserToAdd() {
    return UserAddedEntity(
      firstName: _textEditingControllerFirstName.value.text,
      lastName: _textEditingControllerLastName.value.text,
      username: _textEditingControllerUserName.value.text,
      email: _textEditingControllerEmail.value.text,
    );
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
            context
                .read<UsersBloc>()
                .add(OnAddNewUSer(userAddedEntity: _buildUserToAdd()));
          },
          text: "Agregar usuario",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Add new user",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _textEditingControllerFirstName,
                      decoration: const InputDecoration(
                        hintText: "First Name",
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _textEditingControllerLastName,
                      decoration: const InputDecoration(
                        hintText: "Last Name",
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _textEditingControllerUserName,
                      decoration: const InputDecoration(
                        hintText: "User Name",
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _textEditingControllerEmail,
                      decoration: const InputDecoration(
                        hintText: "Email",
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
