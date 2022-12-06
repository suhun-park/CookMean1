import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Index extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  late final name = ''.obs;
  final nickname = ''.obs;
  final id = ''.obs;
  final pwd = ''.obs;

  void nameChange(value) {
      final name = value;
  }
  void nicknameChange(value) {
    final nickname = value;
  }
  void idChange(value) {
    final id = value;
  }
  void pwdChange(value) {
    final pwd = value;
  }
}
