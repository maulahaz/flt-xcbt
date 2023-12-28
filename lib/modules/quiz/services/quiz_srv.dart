// import 'dart:convert';

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../configs/all_configs.dart';
import '../../authorization/x_authorizations.dart';
import '../x_quizes.dart';

class QuizService {
//
  //--Get xx:
  // ========================================================================
  static Future<Either<String, ExamModel>> getExamByCateg(
      String category) async {
    var url = Uri.parse(BASE_URL + 'get-soal-ujian?kategori=$category');
    final authData = await AuthorizationService.getAuthData();
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData.accessToken}'
    });
    // print('==>getExamByCateg ' + url.toString());
    // print(response.statusCode);
    // print(response.body);
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
    var response = await http.post(url, headers: {
      'Content-Type': 'application/json',
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

  //--Get xx:
  // ========================================================================
  static Future<Either<String, String>> createExamByCategory(
      String category) async {
    var url = Uri.parse(BASE_URL + 'create-exam-by-category');
    final authData = await AuthorizationService.getAuthData();
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData.accessToken}'
      },
      body: jsonEncode({"category": category}),
    );
    // print('==>createExamByCategory '+url.toString());
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return Right('Success: Exam Created');
    } else {
      return Left('Fail : createExamByCategory');
    }
  }

  //--Get xx:
  // ========================================================================
  static Future<Either<String, String>> postExamAnswer(
      int soalId, String answer, String category) async {
    var url = Uri.parse(BASE_URL + 'jawab-soal-ujian');
    final authData = await AuthorizationService.getAuthData();
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData.accessToken}'
      },
      body: jsonEncode(
          {"soal_id": soalId, "jawaban": answer, "category": category}),
    );
    print("soal_id: $soalId , jawaban: $answer");
    print('==>postExamAnswer. URL: ' + url.toString());
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return Right('Success: Exam has been answered');
    } else {
      return Left('Fail : postExamAnswer');
    }
  }

  //--Get xx:
  // ========================================================================
  static Future<Either<String, String>> getExamResult(String category) async {
    var url = Uri.parse(BASE_URL + 'get-exam-result?category=$category');
    final authData = await AuthorizationService.getAuthData();
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData.accessToken}'
      },
    );
    // print("soal_id: $soalId , jawaban: $answer");
    // print('==>postExamAnswer. URL: '+url.toString());
    // print(response.statusCode);
    // print(response.body);
    var resBody = jsonDecode(response.body);
    var result = resBody["Result"];
    // print("Result is $result");
    if (response.statusCode == 200) {
      return Right("Result is $result");
    } else {
      return Left('Fail : getExamResult');
    }
  }
}
