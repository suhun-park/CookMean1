import 'dart:convert';

import '../model/shopping_model.dart';
import 'package:http/http.dart' as http;

String _search ="사과";
Future<ShoppingModel> fetchInfo() async {
  var url = 'https://openapi.naver.com/v1/search/shop.json?query=${_search}';
  final response = await http.get(Uri.parse(url),headers: <String, String>{
    "X-Naver-client-Id": "U1ozlgnGGSuQSCSEOD_V",
    "X-Naver-Client-Secret": "pKcymRZ1r6",
    "Content-Type": "application/json",
  },
  );

  if (response.statusCode == 200) {
    //만약 서버가 ok응답을 반환하면, json을 파싱합니다
    print('응답했다');
    print(json.decode(response.body));
    return ShoppingModel.fromJson(json.decode(response.body));
  } else {
    //만약 응답이 ok가 아니면 에러를 던집니다.
    throw Exception('응답하지 못했습니다.');
  }
}