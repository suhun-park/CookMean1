import 'package:cookmean/user_community_page/userdeal/user_community_deal_write.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';


import '../../controller/food_controller.dart';
import '../../controller/mainpage_controller.dart';
import '../../screen/user_screen.dart';
import '../../widget/mainpage.dart';
import '../../widget/menu_widget.dart';
import '../../widget/search_widget.dart';

class Deal extends GetView<MainController> {
  const Deal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> list = List.generate(10, (index) => 'Text $index');

    return Obx(
      () => Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: AppBar(
              title: const Text(
                "식품 나눔 거래",
                style: (TextStyle(
                  color: Colors.white,
                  fontFamily: "안동엄마까투리.dmg",
                )),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                  iconSize: 30,
                  onPressed: () {
                    showSearch(context: context, delegate: Search(list));
                  },
                ),
              ],
              backgroundColor: Colors.black,
              centerTitle: true,
            ),
          ),
          body: homeIndex(),
        bottomSheet: homeBottom(),
    ));
  }

  Widget homeIndex() {
    return

      Container(
        child: ListView.builder(
            itemCount: controller.image!.length,
            itemBuilder: (context, index) {
              return
                 Card(
                   elevation: 5,
                     child:GestureDetector(
                  child: ListTile(
                leading: Image.asset(controller.image!.elementAt(index), height: 100,width :80,fit: BoxFit.fill,),
                title: Text("${controller.title![index]}"),
                    subtitle: Text("${controller.contents![index]}"),
              )));
            }),
   );
  }

  Widget homeBottom() {
    List<BottomNavigationBarItem> bottomItems = const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.hail), label: "COOK"),
      BottomNavigationBarItem(
          icon: Icon(Icons.local_mall_outlined), label: "SHOPPING"),
      BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "DAY"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Person"),
    ];
    return BottomNavigationBar(
      onTap: controller.changeMainPageIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.cyanAccent,
      selectedFontSize: 12,
      unselectedFontSize: 10,
      currentIndex: controller.mainPageIndex.value,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: bottomItems,
    );
  }
}
