import 'package:flutter/material.dart';
import '../model/model_recipe.dart';
import '../page/american_food.dart';
import '../page/china_food.dart';
import '../page/japan_food.dart';
import '../page/korean_food.dart';


class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}


class HomeState extends State<Home> {
  int selectedIndex = 0;
  List<String> cookimage = ['assets/images/밥.png','assets/images/짜장면.png','assets/images/초밥.png','assets/images/스파게티.png',];
  List<String> cookname = ['한식','중식','일식','양식'];
  List pages = const [
    KoreanFood(),
    ChinaFood(),
    JapanFood(),
    AmericanFood()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width:100,
              child:ListView.separated(
                  padding: EdgeInsets.all(0),
                  itemCount: cookimage.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 50,);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex =index;
                        });
                      },
                      child: Container(
                        child: Row(
                          children: [
                            AnimatedContainer(duration: Duration(milliseconds: 500),
                            height: (selectedIndex == index)? 110 : 100,
                            color: Colors.transparent,),
                            Expanded(child: Container(
                              color: (selectedIndex ==index) ? Colors.orange.withOpacity(0.2) : Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 0,
                                ),
                                child:Column(
                                  children: [
                                    Image.asset(cookimage[index]),
                                    Text(cookname[index],style: TextStyle(fontWeight: FontWeight.bold,))
                                  ],
                                )
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
            )
            ),
            Expanded(child: pages.elementAt(selectedIndex))
          ],
        ),
      ),
    );

  }
}