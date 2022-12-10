import 'package:cookmean/controller/mainpage_controller.dart';
import 'package:cookmean/screen/home_screen.dart';
import 'package:cookmean/login/login.dart';
import 'package:cookmean/widget/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async {
  KakaoSdk.init(nativeAppKey: '5d4a5f37b27aaa09cdbf3919b1cd6d0b',javaScriptAppKey: '4ba29eb4e041175162ee882e4922a14e');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting().then((_) =>
  runApp(MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        initialBinding: BindingsBuilder((){
          Get.put(MainController());
        }),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Login(),
        getPages : [GetPage(name:'/Home',page: () =>  Home()),]
    );
  }
}








