import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

class Api{
Future<dynamic>get({required String url,@required String?token}) async{
  Map<String,String> headers={};
  if(token!=null){
    headers.addAll({'Authorization':'Bearer $token' });
  }
http.Response response=await http.get(Uri.parse(url));
if(response.statusCode==200){
  return jsonDecode(response.body);
}else{
  throw Exception("there is a problem with status code${response.statusCode}");
}
}
Future<dynamic>post({required String uri, @required dynamic body, @required String? token })async{
  Map<String,String> headers={};
  if(token!=null){
    headers.addAll({'Authorization':'Bearer $token' });
  }
  http.Response response= await http.post(Uri.parse(uri),body:body,headers: headers);
  print("url ${uri} body ${body} token ${token}");

  if (response.statusCode==200 || response.statusCode == 201) {
    Map<String,dynamic>data=jsonDecode(response.body);
    print(response.body);
    return data;
  }else{
    throw Exception("there is a problem with status code${response.statusCode} with body ${jsonDecode(response.body)}");
  }
}

Future<dynamic>put({required String uri, @required dynamic body, @required String? token })async{
  Map<String,String> headers={};
  headers.addAll({
    "Content-Type":"application/x-www-form-urlencoded"
  });
  if(token!=null){
    headers.addAll({'Authorization':'Bearer $token' });
  }
  print("url ${uri} body ${body} token ${token}");
  http.Response response= await http.put(Uri.parse(uri),body:body,headers: headers);
  if (response.statusCode==200) {
    Map<String,dynamic>data=jsonDecode(response.body);
    print(response.body);
    return data;
  }else{
    throw Exception("there is a problem with status code${response.statusCode} with body ${jsonDecode(response.body)}");
  }
}

}