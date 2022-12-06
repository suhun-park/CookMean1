import 'package:cookmean/shopping/index_shopping.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  ShoppingState createState() => ShoppingState();
}

class ShoppingState extends State<Shopping> {
  List image = [
    'assets/images/가리비.png',
    'assets/images/맛김치800g.png',
    'assets/images/비비고.png',
    'assets/images/새우딱새우.png',
    'assets/images/시원한배추김치.png',
    'assets/images/고등어구이.png',
  ];
  List title = [
    "[쿠팡] 남해안 산지직송 생물 홍가리비 (냉장)",
    "[쿠팡] [농협풍산김치]맛김치800g",
    "[쿠팡] [비비고]김치 볶음",
    "[마켓컬리] 은하수산 제주도 딱새우회 (냉동)",
    "[마켓컬리] [Kurly's] 시원한 배추 김치",
    "[마켓컬리] 렌지에 돌려먹는 고등어구이 (냉동)",
  ];
  List price = [
    "15,790원",
    "7,000원",
    "5,000원",
    "12,800원",
    "5,4000원",
    "6,000원",
  ];
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:
        SafeArea(child:
        Container(
          color: Colors.grey,
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: image!.length,
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                childAspectRatio: 1/1.5 , //item 의 가로 1, 세로 2 의 비율
                mainAxisSpacing: 30, //수평 Padding
                crossAxisSpacing: 20, //수직 Padding
              ),
              itemBuilder:  (BuildContext context, int index) {
                return Container(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() =>ShoppingIndex(),arguments: [title[index],image[index]]);
                    },
                    child:Column(
                      children: [
                        Container(
                          child:Image.asset(image!.elementAt(index),fit: BoxFit.fill,),
                          width: 300,height: 180,
                        ),
                        Expanded(
                          child:Container(
                            alignment: Alignment.center,
                            child: Text("${title[index]}",style: TextStyle(fontSize: 18,color: Colors.black,),),
                          ),
                        ),
                        Text("${price[index]}",style: TextStyle(fontSize: 17,color:Colors.red),),

                      ],
                    ),
                  ),
                );
              }
          ),
        ),
        ),
      );
  }
}