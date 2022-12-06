import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookmean/page/writepage/write_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/model_recipe.dart';

import '../page_menu/korean_page.dart';


class KoreanFood extends StatefulWidget {
  const KoreanFood({Key? key}) : super(key: key);

  @override
  State<KoreanFood> createState() => _KoreanFoodState();
}

class _KoreanFoodState extends State<KoreanFood> {
  int selectedIndex= 0;

  static List<String> korean_Cook_Title = [
    '[백종원레시피]백종원 레시피',
    '[백종원레시피]백종원 된장찌개',
    '[백종원레시피]백종원 부대찌개',
    '[백종원레시피]백종원 소불고기',
  ];
  static List<String> korean_Cook_Image = [
    'assets/images/백종원레시피.jpeg',
    'assets/images/백종원된장찌개.jpeg',
    'assets/images/백종원부대찌개.jpeg',
    'assets/images/백종원소불고기.jpeg',
  ];
  static List<String> korean_Cook_youtube = [
    'DnQ09ZZCjCs',
    'ffuakdFmuh4',
    '8uwmFQH614M',
    'nVzwOOJLt24',
  ];
  static List<String> KoreanFood_Ingredient = [
    "돼지고기 120g \n쌀뜨물 380ml (약 2컵)\n자른 김치 150g\n다진마늘 30g (2큰술)\n대파 30g\n청양고추 10g\n홍고추 10g\n고운 고춧가루 30g (2큰술)\n굵은 고춧가루 30g (2큰술)\n국간장 15ml (1큰술)\n새우젓 15g (1큰술)",
    "된장 1/3컵(60g)\n물 약4컵(750mL)\n간마늘 1/2큰술(8g)\n육수용멸치 10마리(20g)\n애호박 1/2개(130g)\n양파 1/2개(80g)\n느타리버섯 1컵(80g)\n대파 2/3컵(60g)\n청양고추 2개(14g)\n홍고추 1/2개(7g)\n두부 1/2모(180g)",
    "물 3컵(540ml)\n통조림햄 1캔(200g)\n대파 1과 1/2대(150g)\n소시지 2개(95g)\n양파 1/4개(60g)\n신김치 약 1/3컵(50g)\n베이크드빈스 1과 1/2큰술(30g)\n체다슬라이스치즈 1장(20g)\n간마늘 1큰술(20g)\n굵은 고춧가루 2큰술(16g)\n고추장 약 1/2큰술(12g)\n된장 약 1/2큰술(12g)\n국간장 약 1큰술(12g)\n후춧가루 약간",
    "황설탕 2와1/2큰술(30g)\n물엿 1큰술(12g)\n간 마늘 1큰술(20g)\n진간장 5큰술(50g)\n후춧가루 약간\n참기름 3큰술(21g)\n소고기 불고기용 500g 양파 3/5개(150g)\n표고버섯 2개(40g)\n대파 약1대(80g)\n홍고추 1개(10g)\n통깨 약간",
  ];
  static List<String> KoreanFood_recipe = [
  "1. 대파와 고추는 송송 썰어 준비합니다.\n2. 냄비에 목살과 쌀뜨물을 넣고 충분히 끓여, 고기 육수를 우려냅니다.\n3. 고기 육수가 충분히 우러나면 김치와 다진마늘을 넣습니다.\n4. 국물이 끓어오르면 대파와 고추를 넣습니다.\n5. 고춧가루를 넣고 잘 섞습니다. \n굵은 고춧가루와 고운 고춧가루를 반씩 섞어 넣으면 더욱 좋습니다.\n6. 국간장과 새우젓을 넣고 잘 저어 줍니다.",
  "1. 애호박, 양파, 두부는 먹기 좋은 크기로 잘라 준비한다.\n2. 느타리버섯은 찢어서 준비한다.\n3. 청양고추, 홍고추, 대파는 1cm 정도 두께로 썰어 준비한다.\n4. 멸치는 머리, 내장을 제거하고 3등분 정도로 찢어 준비한다.\n5. 냄비에 손질한 멸치, 물, 양파를 넣어 끓인다.\n6. 육수가 끓으면 느타리버섯, 애호박, 간마늘, 된장을 넣는다.\n7. 된장 육수가 끓어오르면 대파, 청양고추, 홍고추를 넣어 끓인다.\n8. 찌개가 끓으면 두부를 넣고 1분 정도 끓여 완성한다.",
  "1. 대파는 길게 반 갈라 4cm 길이로 썬다.\n2. 양파는 두께 0.4cm로 채 썬다.\n3. 소시지 1개는 두께 0.4cm로  어슷썰기 하고, 나머지 1개는 길게 4등분 하여 3cm 정도 길이로 자른다.\n4. 통조림 햄 1/3개는 두께 0.4cm 정도로 편 썰고,1/3개는 두께 0.5cm 정도로 채 썬다.\n5. 나머지 1/3개의 통조림 햄은 비닐봉지에 넣고 손바닥으로 으깨어 준비한다.\n6. 냄비에 대파, 양파를 깔고 손질한 소시지와 햄을 올린다.\n7. 양념장 재료와 김치를 냄비에 넣고 베이크드빈스를 올린다.\n* 양념장을 한데 넣고 섞어서 넣어도 좋다.\n8. 물을 넣고 슬라이스치즈를 올린 후 강 불에 끓인다.\n9. 찌개가 끓으면 가스 버너로 옮겨 강불에 약 3분 정도 끓여 완성한다.\n* 라면을 넣을 경우 끓었을 때 물 1컵을 넣고 다시 끓으면 면을 넣어 익힌다.",
  "1. 깊은 볼에 한입 크기로 자른 소고기를 넣고 잘 풀어서 준비한다.\n2. 소고기에 황설탕, 물엿, 간 마늘을 넣고 골고루 버무려 약 10~20분 정도 재운다.\nTip: 설탕의 분자가 다른 양념류보다 크기 때문에 가장 먼저 넣어서 단맛을 배게 한다.\n3. 표고버섯은 기둥을 제거하고 두께 0.3cm 정도로 얇게 썬다.\n4. 대파, 홍고추는 두께 0.5cm 정도로 어슷썰어 준비한다.\n5. 양파는 꼭지를 제거하고 두께 0.5cm 정도로 채썰어 준비한다.\n6. 재워둔 소고기에 진간장을 넣고 고기가 부서지지 않도록 조심히 섞어준 후 양파, 대파, 홍고추, 표고버섯을 넣어 섞는다.\n7. 채소 위에 후춧가루, 참기름을 넣고 섞는다.\nTip: 다음날 사용한다면 대파만 넣어서 냉장 보관하여 사용 당일 나머지 채소를 넣어 조리한다.\n8. 팬을 강 불에 올려 예열하고 소불고기를 올려 재료를 집게나 젓가락으로 잘 풀어주면서 볶는다.\nTip: 기호에 따라 MSG 1/4큰술 정도를 넣어 볶는다.\n9. 완전히 익은 소불고기를 접시에 담고 통깨를 뿌려 완성한다.",
  ];


  final List<Recipemodel> korean_Cook_Data = List.generate(korean_Cook_Title.length, (index) => Recipemodel(korean_Cook_Title[index], korean_Cook_Image[index],korean_Cook_youtube[index],KoreanFood_Ingredient[index],KoreanFood_recipe[index]));


  @override
  Widget build(BuildContext context) {
    return
    Container(
      color: Colors.blue.withOpacity(0.2),
      child:Column(
        children:[
          Expanded(
           child: ListView.builder(
              shrinkWrap: true,
              itemCount: korean_Cook_Title.length,
              itemBuilder: (context, index) {
                return Column(children: [Card(
                  color: Colors.orange.withOpacity(0.2),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              KoreanPage(
                                korean_Cook_Model: korean_Cook_Data[index],)));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 500,
                            height: 200,
                            child: Image.asset(
                              korean_Cook_Image[index], fit: BoxFit.fill,
                              width: 100,
                              height: 100,),
                          ),
                          SizedBox(height: 10,),
                          Text(korean_Cook_Title[index],),
                          SizedBox(height: 10,),

                        ],

                      ),
                    ),

                  ),
                ),

                ],);
              },
            )

          ),
          Stack(
            children: [Row(
              mainAxisAlignment : MainAxisAlignment.end,

              children:[
                Text('광고'),
                Container(
                  margin: EdgeInsets.fromLTRB(70, 0, 10, 10),
                  child:
                  FloatingActionButton(
                    onPressed: () async{
                      Navigator.push( context,
                          MaterialPageRoute(builder: (context) => WritePage()));},
                    child :Icon(Icons.add),splashColor: Colors.white,backgroundColor: Colors.orange,
                  ),

                ),
              ],
            )
            ],
          ),
]
    ),
      );
  }
}
