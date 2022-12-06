import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../model/model_recipe.dart';
import '../model/model_deal.dart';
import 'mainpage.dart';

class Search extends SearchDelegate {
  final firestore = FirebaseFirestore.instance;

  Future<List<DealModel>> getCookMean() async {
    CollectionReference<Map<String, dynamic>> collectionReference =
    FirebaseFirestore.instance.collection("cookMeanUser");
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await collectionReference.orderBy("date").get();
    List<DealModel> CookMeanList = [];
    for (var element in querySnapshot.docs) {
      print(element.data());
      CookMeanList.add(
          DealModel.fromJson(element.data() as Map<String, dynamic>));
    }
    return CookMeanList;
  }



  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(icon: Icon(Icons.close),onPressed: (){query ="";},),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},);

  }
 late String selectedResult;
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: Text(selectedResult)
      )
    );
  }
  List<String> recentList =["김치","쿠팡"];
  List<String> queryResult = [];

  final List<String> listExample;
  Search(this.listExample);
  @override
  Widget buildSuggestions(BuildContext context) {
   List<String> suggestionList = [];
   query.isEmpty
    ? suggestionList = recentList
    : suggestionList.addAll(listExample.where((element) => element.contains(query)));

   return ListView.builder(
       itemCount: suggestionList.length,
       itemBuilder: (context,index) {
         return ListTile(
           title: Text(suggestionList[index]),
         );
       });
  }
  
}