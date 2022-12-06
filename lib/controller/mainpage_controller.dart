import 'dart:ui';

import 'package:get/get.dart';

class MainController extends GetxController{
 RxInt mainPageIndex = 0.obs;
 void changeMainPageIndex (int index) {
  mainPageIndex(index);
 }
 final image = <String>[
  'assets/images/김치.jpeg',
  'assets/images/간장.jpeg',
  'assets/images/계란.jpeg',
  'assets/images/배추.jpeg',
  'assets/images/까나리젓.jpeg',
  'assets/images/소금.jpeg',
  'assets/images/시금치.jpeg',
  'assets/images/양파.jpeg',
 ].obs;
 final title = <String>[
  "김치 팝니다",
  "간장 팝니다",
  "계란 팝니다",
  "배추 팝니다",
  "까나리젓 팝니다",
  "소금 팝니다",
  "시금치 팝니다",
  "양파 팝니다",
 ].obs;
 final contents = <String>[
  "싱싱한 김치 팝니다",
  "질좋은 간장 팝니다",
  "싱싱한 계란 팝니다",
  "싱싱한 배추 팝니다",
  "질좋은 까나리젓 팝니다",
  "저염분 소금 팝니다",
  "싱싱한 시금치 팝니다",
  "싱싱한 양파 팝니다",

 ].obs;

}

