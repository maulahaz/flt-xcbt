class DataUser {
  final List<UserModel> data;

  DataUser({required this.data});

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
      data: List.from(json['data'].map((usr) => UserModel.fromModel(usr))));
}

class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.avatar});

  factory UserModel.fromModel(Map<String, dynamic> json) => UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      avatar: json['avatar']);
}
