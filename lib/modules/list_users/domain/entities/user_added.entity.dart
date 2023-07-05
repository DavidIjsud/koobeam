class UserAddedEntity {
  String? firstName;
  String? lastName;
  String? username;
  String? email;

  UserAddedEntity({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "email": email,
      };
}
