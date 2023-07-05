import 'package:flutter/material.dart';
import 'package:koobeam/modules/list_users/domain/entities/user.entity.dart';

class UserItem extends StatelessWidget {
  final UserEntity userEntity;

  const UserItem({super.key, required this.userEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name : ${userEntity.firstName}"),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text("LastName : ${userEntity.lastName}"),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text("Email : ${userEntity.email}"),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text("UserName : ${userEntity.username}"),
                ],
              ),
              Expanded(child: Container()),
              Image.network(userEntity.pictureUrl!),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
