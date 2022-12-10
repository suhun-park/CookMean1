import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookmean/controller/like_controller.dart';
import 'package:cookmean/user_community_page/userview/user_community_viewpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../model/model_deal.dart';


class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);
  @override
  State<UserView> createState() => UserViewState();
}
class UserViewState extends State<UserView> {
  final controller = Get.put(LikeController());
  final curentindex = 0;
  final firestore = FirebaseFirestore.instance;

  Future<List<DealModel>> getCookMean() async {
    CollectionReference<Map<String, dynamic>> collectionReference =
    FirebaseFirestore.instance.collection("cookMeanUser");

    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await collectionReference.orderBy("date").get();

    List<DealModel> CookMeanList = [];

    for (var element in querySnapshot.docs) {
      final id = element.id;
      var data = element.data();
      data['id']= id;
      CookMeanList.add(DealModel.fromJson(data));
      print(element.data());
      var cc = CookMeanList[0].id;
    }
    return CookMeanList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              FutureBuilder<List<DealModel>>(
                  future: getCookMean(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Container(); // here
                    }
                    return FutureBuilder<List<DealModel>>(
                        future: getCookMean(),
                        builder: (BuildContext, snapshot) {
                          print(snapshot);
                          if (snapshot.connectionState != ConnectionState.done) {
                            // container
                          }
                          List<DealModel> list = snapshot.data!;
                          return ListView.builder(
                                shrinkWrap: true,
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                  String str = list[index]
                                      .date!
                                      .toString()
                                      .substring(18, 28);
                                  DateTime datetime =
                                  DateTime.fromMicrosecondsSinceEpoch(
                                      int.parse(str) * 1000000);
                                  String finalTime =
                                  DateFormat("HH:mm").format(datetime); //시간 포맷




                                  return Column(children: [
                                    SafeArea(
                                        child: Card(
                                            color: Colors.black12,
                                            child: Container(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Get.to(const ViewPage());
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            margin: const EdgeInsets
                                                                .fromLTRB(0, 8, 0, 8),
                                                            child: Text(
                                                                list[index].title!,
                                                                style: const TextStyle(
                                                                    fontSize: 15)),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        alignment: Alignment.bottomLeft,
                                                        child: Text(
                                                          list[index].text!,
                                                          style: const TextStyle(
                                                            fontSize: 15,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 80,
                                                        alignment: Alignment.bottomLeft,
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              list[index].nickname!,
                                                              style: const TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Text(
                                                              list[index].location!,
                                                              style: const TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                            SizedBox(
                                                              width: 220,
                                                            ),
                                                            Text(
                                                              finalTime.toString(),
                                                              style: const TextStyle(
                                                                  fontSize: 15),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: double.infinity,
                                                          child: Card(
                                                            color: Colors.black26,
                                                            child: Row(
                                                              children: [
                                                                const SizedBox(width:10,),
                                                                Text("공감",style: TextStyle(fontSize: 15),),
                                                                list[index].like!
                                                                    ? IconButton(
                                                                  color:
                                                                  Colors.red,
                                                                  onPressed:
                                                                      () async {
                                                                    setState(() {
                                                                       FirebaseFirestore.instance
                                                                            .collection('cookMeanUser')
                                                                            .doc(list[index].id)
                                                                            .update({'like': false}).then((value) => print(list[index].id),
                                                                            onError: (e) => print("Error updating document $e"));
                                                                    });

                                                                      print("docs");

                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .favorite),
                                                                )
                                                                    : IconButton(
                                                                  color:
                                                                  Colors.red,
                                                                  onPressed:
                                                                      () async {
                                                                    setState(() {
                                                                        FirebaseFirestore.instance
                                                                            .collection('cookMeanUser')
                                                                            .doc(list[index].id)
                                                                            .update({'like': true});
                                                                      }
                                                                    );
                                                                  },
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .favorite_border),
                                                                ),

                                                                TextButton(
                                                                    onPressed: () => Get.to(
                                                                        const ViewPage()),
                                                                    child:
                                                                    Text("댓글달기")),
                                                              ],
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                )))),
                                  ]);
                                },
                              );
                        });
                  }),
            ],
          ),
        ));
  }
}
