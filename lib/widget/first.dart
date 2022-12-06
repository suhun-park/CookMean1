import 'package:cookmean/controller/mainpage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/home_screen.dart';
import 'mainpage.dart';

class First extends GetView<MainController> {
  const First({Key? key}) : super(key: key);

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
        home: MainPage(),
        getPages : [GetPage(name:'/Home',page: () =>  Home()),]
    );
  }
}
