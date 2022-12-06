import 'package:cookmean/controller/mainpage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingIndex extends GetView<MainController> {
  const ShoppingIndex( {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String image = "";
    String title = "";
    image = Get.arguments[1];
    title = Get.arguments[0];
    return Scaffold(
    appBar: AppBar(
      title: Text("${title!}") ,backgroundColor: Colors.black,
    ),
        body:Container(
      color: Colors.white,
      child:Column(
              children: [
                Image.asset(image!),
                Text("${title!}",style: TextStyle(fontSize: 18,color: Colors.black)),
              ],
            ),
    ),
    );
  }
}
