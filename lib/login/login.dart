import 'package:cookmean/controller/scan_controller.dart';
import 'package:cookmean/login/kakao_model.dart';
import 'package:cookmean/login/social_login.dart';
import 'package:cookmean/widget/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widget/first.dart';
import 'login.dart';

class Login extends GetView<ScanController> {
  const Login({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    final viewModel = KakaoModel(KakaoLogin());
    final controller = Get.put(ScanController());
    final loginFormkey = GlobalKey<FormState>();
    String id = "박수훈";
    String pwd = "12345";
    return
      Scaffold(
        body:SafeArea(child:
        Container(
          child:
          Form(
            key: loginFormkey,
            child:
            Center(
              child:
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset('assets/images/로그인이미지.png',scale: 2, ),
                  const SizedBox(
                    height: 70,
                  ),
                  SizedBox(width: 250,child:
                  TextFormField(
                      controller: controller.id,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "필수 입력해주세요!";
                        }
                        if(value != id){
                          return "아이디가 아닙니다!";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        counterText: '',
                        hintText: '아이디를 입력해주세요',
                        border: OutlineInputBorder(),
                      ),
                      maxLength: 10,
                      minLines: 1,
                      maxLines: 1,
                      onChanged: controller.idInput
                  ),
                  ),
                  const Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 10)),
                  SizedBox(
                    width: 250,
                    child:TextFormField(
                        controller: controller.pwd,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "필수 입력해주세요!";
                          }
                          if(value != pwd) {
                            return "비밀번호가 아닙니다!";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          counterText: '',
                          hintText: '비밀번호를 입력해주세요',
                          border: OutlineInputBorder(),
                        ),
                        maxLength: 10,
                        minLines: 1,
                        maxLines: 1,
                        onChanged: controller.pwdInput
                    ),
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 70, height: 20,
                      ),
                      Text("아이디 찾기"),
                      SizedBox(
                        width: 20,
                      ),
                      Text("비밀번호 찾기"),
                      SizedBox(
                        width: 20,
                      ),
                      Text("회원가입"),
                    ],
                  ),
                  Expanded(child:
                  IconButton(onPressed: () async{
                    await viewModel.login();
                    Get.to(MainPage());
                    }
                      ,icon:  Image.asset('assets/images/kakaologin.png',),iconSize:200)
                  ),
                ],
              ),
            ),
          ),
        ),
        ),
      );
  }
}