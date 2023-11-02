import 'dart:convert';
import 'dart:math';

import 'package:flutter_demo_project/PostResponse.dart';
import 'package:flutter_demo_project/constant.dart';
import 'package:http/http.dart' as http;

class ApiService{


  Future<List<Welcome>?>getPost()async{
    try{


      var url=Uri.parse(ApiConstants.baseUrl+ApiConstants.endPoint);
      var response= await http.get(url);
      if(response.statusCode==200){
        final data = (json.decode(response.body));
       final List<Welcome> post = welcomeFromJson(response.body.toString());
        return post;

      }
    } catch(exception){

print(exception.toString() );

    }
  }
}