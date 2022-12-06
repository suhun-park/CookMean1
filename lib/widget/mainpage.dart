import 'package:cookmean/controller/mainpage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screen/day_screen.dart';
import '../screen/home_screen.dart';
import '../screen/shopping_screen.dart';
import '../screen/user_community_screen.dart';
import 'menu_widget.dart';
import 'search_widget.dart';
import '../screen/user_screen.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final List<String> list = List.generate(10, (index) => 'Text $index');
    return Obx(() =>
        Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: AppBar(
                title: const Text(
                  "냉장고를 부탁해",
                  style: (TextStyle(
                    color: Colors.black, fontFamily: "안동엄마까투리.dmg",)),
                ),
                actions: <Widget>[
                  IconButton(
                      icon: const Icon(Icons.search),
                      color: Colors.black,
                      iconSize: 30,
                      onPressed: () {
                        showSearch(context: context, delegate: Search(list));
                      }),

                ],
                backgroundColor: Colors.white,
                centerTitle: true,

              ),),
            body: homeIndex(),
            bottomNavigationBar:homeBottom()));
  }
  Widget homeIndex() {
    return IndexedStack(
      index: controller.mainPageIndex.value,
      children: [
        Home(),
        Community(),
        Shopping(),
        const Day(),
        const User(),
      ],
    );
  }
  Widget homeBottom() {
    List<BottomNavigationBarItem> bottomItems = [
      BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
      BottomNavigationBarItem(icon: Icon(Icons.hail),label: "COMMUNITY"),
      BottomNavigationBarItem(icon: Icon(Icons.local_mall_outlined),label: "SHOPPING"),
      BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label:"DAY"),
      BottomNavigationBarItem(icon: Icon(Icons.person),label:"Person"),
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











