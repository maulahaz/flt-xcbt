// import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../configs/all_configs.dart';
import '../../authorization/x_authorizations.dart';
import '../x_quizes.dart';

class QuizService {
//
  //--Get xx:
  // ========================================================================
  static Future<Either<String, ExamModel>> getExamByCateg(String category) async {
    var url = Uri.parse(BASE_URL + 'get-soal-ujian?kategori=$category');
    final authData = await AuthorizationService.getAuthData();
    var response = await http.get(url, headers: {
      'Quiz-Type': 'application/json',
      'Authorization': 'Bearer ${authData.accessToken}'
    });
    print('==>getExamByCateg '+url.toString());
    print(response.statusCode);
    print(response.body);
    // var examData = jsonDecode(response.body)['data'];
    // print(examData);
    if (response.statusCode == 200) {
      return Right(ExamModel.fromJson(response.body));
    } else {
      return Left('Fail : getExamByCateg');
    }
  }

  //--Get xx:
  // ========================================================================
  static Future<Either<String, String>> createExam() async {
    var url = Uri.parse(BASE_URL + 'create-ujian');
    final authData = await AuthorizationService.getAuthData();
    var response = await http.get(url, headers: {
      'Quiz-Type': 'application/json',
      'Authorization': 'Bearer ${authData.accessToken}'
    });
    // print('==>getExamByCateg '+url.toString());
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return Right('Success: Exam Created');
    } else {
      return Left('Fail : getExamByCateg');
    }
  }

}
