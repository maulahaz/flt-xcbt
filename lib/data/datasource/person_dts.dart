import 'dart:convert';

import 'package:http/http.dart';
import 'package:xcbt/configs/all_configs.dart';
import 'package:xcbt/data/models/person_mdl.dart';

class PersonDatasource{

  Future<List<PersonModel>> getPerson() async{
    Response response = await get(Uri.parse(BASE_URL+'/users'));
    if(response.statusCode == 200){
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => PersonModel.fromJson(e)).toList();
    }else{
      throw Exception(response.reasonPhrase);
    }
  } 
}