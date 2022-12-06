import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LikeController extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final like = <bool>[].obs;

  void likeFalse() {
    FirebaseFirestore
        .instance
        .collection(
        "cookMeanUser")
        .doc(
        "community")
        .update({
      "like": false
    });
  }
  void likeTrue(){
    FirebaseFirestore
        .instance
        .collection(
        "cookMeanUser")
        .doc(
        "community")
        .update({
      "like": true
    });
  }
}