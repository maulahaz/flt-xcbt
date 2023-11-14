class PersonModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  PersonModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.avatar});

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
      id: json['id'],
      firstName: json['firstName'] ?? 'First name',
      lastName: json['lastName'] ?? 'Last name',
      email: json['email'],
      avatar: json['avatar'] ?? 'avatar.png') ;
}
