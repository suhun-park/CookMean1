import 'package:cookmean/page/writepage/write_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/model_recipe.dart';
import '../page_menu/china_page.dart';



class ChinaFood extends StatefulWidget {
  const ChinaFood({Key? key}) : super(key: key);

  @override
  State<ChinaFood> createState() => _ChinaFoodState();
}

class _ChinaFoodState extends State<ChinaFood> {
  int selectedIndex= 0;
  static List<String> china_Cook_Title = [
   '[백종원]중화제육면 1인분 만들기',
    '[이연복 유튜브] 밥이야? 안주야? 어디에 먹어도 맛있는 매콤한 고추 잡채!',
    '[이연복 유튜브] 중식하면 이것밖에 더 있어? 옛날 짬뽕! 이 레시피 하나면 집에서도 중국집 짬뽕을 만들 수 있다!',
    '[백종원] 직접 만든 짜장소스로 짜장떡볶이를 간단하게~',

  ];
  static List<String> china_Cook_Image = [
    'assets/images/중식중화제육면.jpeg',
    'assets/images/중식고추잡채.jpeg',
    'assets/images/중식옛날짬뽕.jpeg',
    'assets/images/중식짜장떡볶이.jpeg',
  ];
  static List<String> china_Cook_youtube = [
    'fEYJSPSGaLI',
    'sFLGovdEBr4',
    '3FBKcTumM5w',
    '7S9VN54ldnU',
  ];
  static List<String> ChinaFood_Ingredient = [
    '*중화제육소스 \n식용유 5큰술(35g) \n간돼지고기(후지) 1컵(150g) \n대파 1/2컵(40g) \n간마늘 1큰술(15g) \n진간장 1큰술(10g) \n황설탕 1과1/2큰술(15g) \n굵은고춧가루 1큰술(5g) \n고운고춧가루 1큰술(5g) \n된장 1큰술(15g) \n고추장 4큰술(60g) \n꽃소금 1/4큰술(2g) \nMSG 1/3큰술(3g) \n후춧가루 적당량 \n물 2컵(360g) \n*중화제육면 \n식용유 2큰술(20g) \n대파 1/3컵(30g) \n양파 1/3컵(40g) \n양배추 2/3컵(60g) \n애호박 2/3컵(60g) \n칼국수면 150g',
    '홍두깨살 160g (소고기) \n청피망\n홍피망청\n양고추\n표고버섯\n죽순채\n양파 \n전분\n계란\n식용유\n소금\n후추\n굴소스',
    '새우\n 돼지고기\n 애호박\n 배추\n 오징어(낙지)\n 바지락\n 중화면\n 청양고추 \n죽순\n 양송이\n목이버섯\n파, 마늘\n 양파\n청경채 \n고춧가루\n굴 소스\n치킨스톡\n진간장',
    '다진 돼지고기 2컵(320g) \n대파 1대(100g) \n양파 2개(360g) \n춘장 1개(300g) \n식용유 4/5컵(120g) \n간생강 1/3큰술(3g) \n설탕 3/5컵(90g) \n굴 소스 1/2컵(100g) \n진간장 1/3컵(60g) \nMSG 1큰술(10g) \n떡볶이 떡 200g \n어묵 2장(80g) \n대파 1/2대(60g) \n물 1과1/3컵(250ml) \n만능짜장소스 1/2컵(90g) \n고추장 2/3큰술(10g) \n설탕 1큰술(10g) \n삶은 달걀',
  ];
  static List<String> ChinaFood_recipe = [
    '*중화제육소스 \n1. 대파는 송송 썰어 준비한다. \n2. 프라이팬에 식용유를 두르고 대파를 넣어 파기름을 낸다. \n3. 파기름 향이 올라오면 돼지고기를 넣고 뭉치지 않게 풀어가며 볶는다. \n4. 고기 노릇하게 익으면 황설탕을 넣어 볶는다. \n5. 진간장을 넣어 향을 내준다. \n6. 된장, 고추장, 간마늘을 넣어 중약불에서 풀어가며 볶는다. \n7. 고춧가루를 넣어 가볍게 섞고 물, 후춧가루를 넣는다. \n8. 기호에 따라 미원을 넣고 농도나게 졸인다. \n9. 소금을 넣어 간을 맞춘다. \n*중화제육면 \n1. 끓는물에 칼국수면을 넣어 삶아낸다. \n2. 삶은 칼국수면은 찬물에 헹궈 준비한다. \n3. 헹궈 낸 면은 뜨거운 물에 토렴하여 준다. \n4. 프라이팬에 식용유를 두르고 달궈준다. \n5. 프라이팬에 달궈지면 양파, 대파를 넣고 그을려 지도록 볶는다. \n6. 애호박, 양배추를 넣어 볶아준다. \n7. 만들어 둔 중화제육소스를 넣고 중약불로 줄여 채소가 숨이 죽을 정도까지 볶아준다. \n8. 완성그릇에 면을 담고 볶아 둔 중화제육소스를 끼얹어 완성한다.',
    '1. 홍두깨살 160g을 결 반대로 채 썰어주고 물기를 꾹 짜줍니다. \n2. 채 썬 홍두깨살, 감자 전분 1스푼, 계란 적당히(영상 참조), 식용유 조금을 섞어주세요. \n3. 청피망 2개, 홍피망 1/2개, 양파 1/2개, 씨가 제거된 청양고추 2개, 표고버섯 2개,죽순채를 채 썰어주세요. \n4. 프라이팬에 기름을 두르고 중불에 달궈 준 후, 준비한 홍두깨살을 볶아주세요. \n5. 고기가 익으면 따로 그릇에 보관해주세요. \n6. 고추기름 2스푼, 고기 기름(5번에서 볶은 고기의 기름) 2스푼, 간장 1/2스푼, 소금 1/2스푼, 준비된 채소를 전부 넣고 채소의 숨이 죽을 때까지 볶아줍니다. \n7. 굴 소스 1.5스푼(식사용이라면 2.5스푼), 5번에 빼놓았던 고기를 넣고 채소와 함께 볶아주면 완성!',
    '1. 양파 1/4개. 양파 3잎, 호박 1/4개, 청경채 2개, 대파 1대와 청양고추 1개를 썰어주세요 \n2. 낙지, 돼지고기 50g을 큼직하게 썰어주세요. \n3. 프라이팬에 기름 3스푼, 파와 다진 마늘 반 스푼을 넣고 볶아주세요. \n4. 돼지고기와 청양고추를 프라이팬에 넣어주세요. \n5. 간장 1/2스푼과 청경채를 제외한 나머지 채소들을 넣고 볶아주세요. \n6. 채소가 어느 정도 익으면 고춧가루 2스푼과 물 약간(영상 참조) 넣고 조금 더 볶아주세요. \n7. 물 600mL를 추가로 프라이팬에 넣어주시고, 치킨파우더 1/2 스푼, 소금 1/3 스푼, 굴 소스 1.5 스푼, 바지락 7~8개, 준비된 새우와 낙지를 넣고 삶아 육수를 만들어주세요. \n8. 새로운 냄비에 물을 끓여주신 후, 중화면을 삶아주세요. (영상 참조) \n9. 7번 과정의 끓는 육수에 청경채를 살짝 데쳐주세요. \n10. 삶은 중화면 위에 육수를 부어주시면 완성~!',
    '1. 양파와 대파는 잘게 썰어 준다. \n2. 팬에 식용유를 두르고 대파를 넣고 수분이 날아갈 때까지 볶아준다. \n3. 파 기름 향이 올라오면 양파를 넣어 수분을 완전히 날려주고 노릇해질 때까지 볶아준다. \n4. 다진 돼지고기를 넣어 뭉치지 않게 풀어주며 볶아준다. \n5. 돼지고기가 적당히 익으면 간 생강을 넣어준다. \n6. 팬 한쪽에 진간장, 굴 소스를 넣고 눌어지도록 볶아주고, 설탕을 넣어준다. \n7. 춘장을 넣고 중불로 바닥이 눋지 않도록 계속 저어주며 튀겨 완성한다.    (깊은 맛을 원한다면 개인 취향에 맞게 MSG를 넣어준다.)  \n8. 밀폐용기에 담아 식혀서 냉장 보관한다. \n9. 대파는 송송 썰어 준비하고, 어묵은 먹기 좋은 크기로 잘라준다. \n10. 팬에 물, 고추장, 설탕, 짜장 소스를 넣고 풀어준다. \n11. 떡볶이 떡과 삶은 달걀을 넣고 끓여준다. \n12. 떡이 적당히 익으면 대파를 넣어준다. \n13. 마지막에 어묵을 넣고 끓여 간을 맞춰 완성한다.\n(만능 짜장 소스를 이용하여 간을 맞춰준다.)',
  ];


  final List<Recipemodel> china_Cook_Data = List.generate(china_Cook_Title.length, (index) => Recipemodel(china_Cook_Title[index], china_Cook_Image[index],china_Cook_youtube[index],ChinaFood_Ingredient[index],ChinaFood_recipe[index]));

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withOpacity(0.2),
      child:Column(
          children:[
            Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: china_Cook_Title.length,
                  itemBuilder: (context, index) {
                    return Column(children: [Card(
                      color: Colors.orange.withOpacity(0.2),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ChinaPage(
                                    china_Cook_Model: china_Cook_Data[index],)));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 500,
                                height: 200,
                                child: Image.asset(
                                  china_Cook_Image[index], fit: BoxFit.fill,
                                  width: 100,
                                  height: 100,),
                              ),
                              SizedBox(height: 10,),
                              Text(china_Cook_Title[index],),
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
    );}}