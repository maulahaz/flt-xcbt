import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xcbt/configs/all_configs.dart';
import '../x_authorizations.dart';

class AuthorizationService {
//
  //--Get Authorization Data:
  // ========================================================================
  // static Future<dynamic> register(data) async {
  static Future<Either<String, AuthorizationModel>> register(data) async {
    var url = Uri.parse(BASE_URL + 'register');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Right(AuthorizationModel.fromJson(response.body));
    } else {
      return Left('Register Fail');
    }
    // if (response.statusCode == 200) {
    //   // var _dataJson = jsonDecode(response.body);
    //   // print(_dataJson);
    //   AuthorizationModel result = AuthorizationModel.fromJson(response.body);
    //   // print(result.toString());
    //   saveAuthData(result);

    //   return result;
    // } else {
    //   print('Error Connection');
    // }
    // } catch (e) {
    //   print(e.toString());
    //   throw Exception('Error Authorization/register ' + e.toString());
    // }
  }

  //--Login:
  // ========================================================================
  static Future<Either<String, AuthorizationModel>> login(
      Map<String, String> data) async {
    final response = await http.post(
      Uri.parse('${BASE_URL}/api/login'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      return Right(AuthorizationModel.fromJson(response.body));
    } else {
      return Left('Login Fail');
    }
  }

  //--Logout:
  // ========================================================================
  static Future<Either<String, String>> logout() async {
    final authData = await getAuthData();
    final response = await http.post(
      Uri.parse('${BASE_URL}/api/logout'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    if (response.statusCode == 200) {
      return const Right('Logout Success');
    } else {
      return const Left('Logout Fail');
    }
  }

  //--
  // ========================================================================
  static Future<void> saveAuthData(AuthorizationModel authResponseModel) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('auth_data', authResponseModel.toJson());
  }

  //--
  // ========================================================================
  static Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth_data');
  }

  //--
  // ========================================================================
  static Future<AuthorizationModel> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final authData = pref.getString('auth_data');
    return AuthorizationModel.fromJson(authData!);
  }
}
