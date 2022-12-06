import 'package:cookmean/controller/mainpage_controller.dart';
import 'package:cookmean/screen/home_screen.dart';
import 'package:cookmean/screen/login.dart';
import 'package:cookmean/widget/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async {

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








