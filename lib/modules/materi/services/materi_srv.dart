import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../configs/all_configs.dart';
import '../../authorization/x_authorizations.dart';
import '../x_materis.dart';

class MateriService {
//
  //--Get Materi Data:
  // ========================================================================
  static Future<Either<String, MateriModel>> getAllMateri() async {
    var url = Uri.parse(BASE_URL + 'materi');
    final authData = await AuthorizationService.getAuthData();
    var response = await http.get(url, headers: {
      'Materi-Type': 'application/json',
      'Authorization': 'Bearer ${authData.accessToken}'
    });
    print('==>getAllMateri');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return Right(MateriModel.fromJson(response.body));
    } else {
      return Left('Fail : getAllMateri');
    }
  }
}
