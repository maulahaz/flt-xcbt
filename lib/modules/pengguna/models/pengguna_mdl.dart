class PenggunaModel {
  final String page, perPage, total, totalPages;
  final List<DataPengguna> data;

  PenggunaModel(
      {required this.page,
      required this.perPage,
      required this.total,
      required this.totalPages,
      required this.data});

  factory PenggunaModel.fromJson(Map<String, dynamic> json) => PenggunaModel(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data:
          List<DataPengguna>.from(json['data'].map((el) => DataPengguna.fromJson(el))));
}

class DataPengguna {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  DataPengguna(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.avatar});

  factory DataPengguna.fromJson(Map<String, dynamic> json) => DataPengguna(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      avatar: json['avatar']);
}

class PenggunaModelXXX {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  PenggunaModelXXX(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.avatar});

  factory PenggunaModelXXX.fromJson(Map<String, dynamic> json) => PenggunaModelXXX(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      avatar: json['avatar']);
}
