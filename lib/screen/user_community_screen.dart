import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookmean/user_community_page/userview/user_community_view.dart';
import 'package:floatingpanel/floatingpanel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../model/model_recipe.dart';
import '../user_community_page/userdeal/user_community_deal.dart';
import '../user_community_page/userdeal/user_community_deal_write.dart';
import '../user_community_page/userview/user_community_write.dart';
import '../widget/mainpage.dart';
import '../login/login.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  CommunityState createState() => CommunityState();
}


class CommunityState extends State<Community> {
  final firestore = FirebaseFirestore.instance;



  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          UserView(),
          Container(
            height:double.infinity,
            width: double.infinity,
            alignment: Alignment.bottomRight,
            margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
            child: FloatingActionButton(
              child:SpeedDial(
                  icon: Icons.menu, //icon on Floating action button
                  activeIcon: Icons.close, //icon when menu is expanded on button
                  backgroundColor: Colors.deepOrangeAccent, //background color of button
                  foregroundColor: Colors.white, //font color, icon color in button
                  activeBackgroundColor: Colors.deepPurpleAccent, //background color when menu is expanded
                  activeForegroundColor: Colors.white,
                  visible: true,
                  buttonSize : const Size(80.0,80.0),
                  childrenButtonSize : const Size(80.0, 80.0),
                  closeManually: false,
                  curve: Curves.bounceIn,
                  overlayColor: Colors.black,
                  overlayOpacity: 0.5,
                  onOpen: () => print('OPENING DIAL'), // action when menu opens
                  onClose: () => print('DIAL CLOSED'),
                  elevation: 8.0, //shadow elevation of button
                  shape: CircleBorder(), //shape of button
                  children:[
                    SpeedDialChild(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.add),
                        onTap:() => Get.to(const UserViewWrite())
                    ),
                    SpeedDialChild(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      child: Image.asset('assets/images/거래.png',scale: 12),
                      onTap: ()=>Get.to(const Deal()),
                    ),
                  ]),
              onPressed: () {},

            ),

          )]);
  }
}