import 'dart:convert';
import 'dart:convert';

import 'package:cookmean/model/shopping_model.dart';
import 'package:cookmean/shopping/index_shopping.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:photofilters/utils/utils.dart';

import '../shopping/naver_api.dart';


class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  ShoppingState createState() => ShoppingState();
}


class ShoppingState extends State<Shopping> {
  Future<ShoppingModel>? shoppingServer;
  void initState() {
    super.initState();
    shoppingServer = fetchInfo();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:
        SafeArea(child:
        Column(children: [
          Expanded(child:
          FutureBuilder<ShoppingModel>(
            future: shoppingServer,
            builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.items?.length,
                    itemBuilder: (context,index){
                      ShoppingModel shopping  = snapshot.data!;
                      return
                        Column(children: [Card(
                           child:Column(
                           children: [SizedBox(
                              width: 500,
                              height: 200,
                              child: Image.network(
                                shopping.items![index].image.toString(), fit: BoxFit.fill,
                                width: 100,
                                height: 100,),
                            ),Row(children: [
                             const SizedBox(height: 10,),
                             Text(shopping.items![index].title.toString().replaceAll(RegExp('[^c-zC-Z0-9가-힣\\s]'), ''),),
                             Text(shopping.items![index].lprice.toString()),
                             const SizedBox(height: 10,),
                           ],)
                      ],
                          ),
                        ),
                        ],

                        );
                    });
              }else if(snapshot.hasError){
                return (Text("${snapshot.error}"));
              }
              return CircularProgressIndicator();
            },
          ),
          )
        ],
        )
        ),
      );
  }
}