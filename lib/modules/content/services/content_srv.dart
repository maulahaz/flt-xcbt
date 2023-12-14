import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../configs/all_configs.dart';
import '../../authorization/x_authorizations.dart';
import '../x_contents.dart';

class ContentService {
//
  //--Get Content Data:
  // ========================================================================
  static Future<Either<String, ContentModel>> getContentById(String id) async {
    var url = Uri.parse(BASE_URL + 'contents?id=$id');
    final authData = await AuthorizationService.getAuthData();
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.accessToken}'
    });
    print('==>getContentById');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return Right(ContentModel.fromJson(response.body));
    } else {
      return Left('Fail : GetContentById');
    }
  }
}
