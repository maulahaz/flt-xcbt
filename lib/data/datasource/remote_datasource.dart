import 'package:dio/dio.dart';
import 'package:xcbt/configs/all_configs.dart';
import 'package:xcbt/data/models/user_mdl.dart';

class RemoteDatasource {
  final dio = Dio(BaseOptions(baseUrl: BASE_URL));

  Future<List<UserModel>> fetchUsers() async {
    final response = await dio.get('users');
    print('response.data');
    List _users = response.data['data'];
    print(_users);
    return _users
        .map((el) => UserModel(
            id: el['id'],
            firstName: el['first_name'],
            lastName: el['last_name'],
            email: el['email'],
            avatar: el['avatar']))
        .toList();
  }

  Future<DataUser> getUsers() async {
    final response = await dio.get('/users');
    print('response.data');
    print(response.data);
    return DataUser.fromJson(response.data);
  }
}
