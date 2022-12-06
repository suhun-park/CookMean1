import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScanController extends GetxController {
  TextEditingController id = TextEditingController();
  TextEditingController pwd = TextEditingController();
  late final  idInput = ''.obs;
  final  pwdInput = ''.obs;
  void idScan(value) {
    final idInput = value;
  }
  void pwdScan(value) {
    final pwdInput = value;
  }
}