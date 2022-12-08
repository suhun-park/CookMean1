import 'package:cookmean/page/writepage/write_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/model_recipe.dart';
import '../page_menu/japan_page.dart';


class JapanFood extends StatefulWidget {
  const JapanFood({Key? key}) : super(key: key);

  @override
  State<JapanFood> createState() => _JapanFoodState();
}

class _JapanFoodState extends State<JapanFood> {
  int selectedIndex= 0;
  static List<String> japan_Cook_Title = [
    "[백종원레시피]경양식 돈가스를 만드는 두 가지 방법 (+버터 없이 돈가스소스 만들기!)",
    "[백종원레시피]연돈 볼카츠? 집에서 만들어 봅시다",
    '밖에서 사 먹는 맛! 볶음우동 만들어 보세요~',
    '이 카레의 주인공은 고기입니다. 고기 듬뿍 뒷다리살 카레',
  ];
  static List<String> japan_Cook_Image = [
    'assets/images/일식경양식.jpeg',
    'assets/images/일식연돈볼카츠.jpeg',
    'assets/images/일식볶음우동.jpeg',
    'assets/images/일식고기카레.jpeg',

  ];
  static List<String> japan_Cook_youtube = [
    "037o6vxm0es",
    "Js2p5JPj3XQ",
    'zRg4nxIv3j8',
    'LTVxirHWvh8',
  ];
  static List<String> JapanFood_Ingredient = [
    """"*돈가스 (일반 버전)\n돼지고기 등심(2cm 두께) 1장(120g)\n꽃소금 약간\n후춧가루 약간\n밀가루 적당량\n달걀 2개\n빵가루 적당량\n튀김용 식용유 적당량\n*돈가스 (물반죽 버전)\n돼지고기 등심(2cm 두께) 1장(120g)\n꽃소금 약간\n후춧가루 약간\n튀김가루 1/2컵(50g)\n물 1/3컵(60g)\n달걀 1개\n빵가루 적당량\n튀김용 식용유 적당량\n*돈가스 소스\n물 1과 2/3컵(300g)\n식용유 6큰술(42g)\n케첩 약 1/4컵(50g)\n황설탕 3큰술(36g)\n진간장 3큰술(30g)\n밀가루 2큰술(20g)\n식초 약 1과1/2큰술(14g)\n소고기 다시다 약간\nMSG 약간\n후춧가루 약간/n*1접시 세팅 재료\n양배추 채 한줌\n마요네즈 약간\n우스터소스 약간\n단무지 약간\n방울토마토 약간\n돈가스 """,
    """*볼카츠 \n다진 돼지고기 2컵(300g)/n 양파 약 1/2개(150g) \n빵가루 약 1/2컵(26g)\n 맛소금 약 1/6큰술(2g) \n달걀물 약 1/6컵(30g)\n 후춧가루 약간 \n튀김용 식용유 적당량 \n *튀김옷 밀가루 약 1/2컵(적당량)\n 달걀 약 2개(적당량) \n습식 빵가루 약 3컵(적당량) """,
    '*소스  \n진간장 2큰술(20g) \n식초 2/3큰술(7g) \n황설탕 1큰술(10g) \n물 ½컵(90g)  \n*볶음재료  \n식용유 3큰술(20g) \n양배추 ½컵(40g) \n양파 1/4개(40g) \n당근 20g \n돼지고기(등심) 50g \n대파 30g \n우동면 1개(200g) \n훈연멸치가루 적당량 \n쪽파 적당량 \n마요네즈 적당량',
    '5인분 기준  \n*뒷다리살카레 \n돼지고기뒷다리살 300g \n물 10컵(1.8L) \n양파 2개(500g) \n카레가루 1봉지(100g) \n당근 약 1/4개(67g) \n케첩 2큰술(40g) \n식용유 약 1/4컵(35g) \n진간장 2큰술(20g) \n버터 약 2큰술(20g) \n*1인분세팅 \n밥 1공기 \n뒷다리살카레 적당량',
  ];
  static List<String> JapanFood_recipe = [
    """*돈가스 (일반 버전)\n1. 등심에 꽃소금, 후춧가루를 앞뒤로 살짝 뿌려 밑간을 해준다.\n2. 등심을 비닐팩에 넣고 밀대로 두드려주며 넓게 펼쳐준 후, 칼집을 넣어 힘줄을 끊어준다.\n*가장자리 힘줄을 끊어주면 뒤틀림과 수축을 방지할 수 있다.\n3. 밀가루 - 달걀물 - 빵가루를 각각 다른 그릇에 담아 준비한다.\n*빵가루가 너무 말라있을 경우 스프레이를 이용하여 물을 뿌려 촉촉하게 만들어 준다.\n4. 넓게 펴준 등심에 밀가루를 골고루 묻힌 후, 달걀물을 묻혀주고, 빵가루로 덮은 후 꾹꾹 눌러 준비한다.\n*돈가스 (물반죽 버전)\n1. 등심에 꽃소금, 후춧가루를 앞뒤로 살짝 뿌려 밑간을 해준다.\n2. 등심을 비닐팩에 넣고 밀대로 두드려주며 넓게 펼쳐준 후, 칼집을 넣어 힘줄을 끊어준다.\n*가장자리 힘줄을 끊어주면 뒤틀림과 수축을 방지할 수 있다.\n3. 넓은 볼에 달걀, 튀김가루, 물을 넣어 물반죽을 만들어 준비한다.\n4. 넓게 펴준 등심에 물반죽을 묻힌 후, 빵가루로 덮은 후 꾹꾹 눌러 준비한다.\n*돈가스 튀기는 방법\n1. 깊은 팬에 식용유를 붓고 센 불에서 160~170도까지 예열을 시켜 준비한다.\n2. 튀김옷을 입힌 돈가스를 넣고 앞뒤로 노릇한 색이 나도록 약 3분 20~30초간 튀겨준다.\n*튀기는 중에 빵가루를 중간중간 걷어내 주어야 기름을 오래 사용할 수 있다.\n 3. 돈가스를 체에 세워 밭쳐 기름을 빼준다.\n *소스 만드는 법\n 1. 넓은 팬에 밀가루, 식용유를 넣고 약불에 브라운 루가 되도록 볶아준다.\n 2. 케첩, 황설탕, 진간장, 식초, 물을 넣고 루를 잘 풀어주며 저어 졸여준다.\n *소고기 다시다, MSG를 넣으면 기사식당 or 사 먹는 맛이 난다.\n 3. 돈가스 소스 농도가 잡히면 후춧가루를 넣고 섞은 후 완성한다.\n *돈가스 세팅하기\n 1. 양배추 채 샐러드, 단무지, 방울토마토를 올려준다.\n *양배추 채 샐러드 위에 마요네즈, 우스터소스를 뿌려 먹으면 좋다.\n 2. 세팅 접시에 돈가스를 올리고 소스를 부어 마무리한다.""",
    """1. 양파는 결 반대 방향으로 3등분 한 후 두께 0.3cm로 채썬다.\n   *너무 길게 썰면 부서질 수 있으니 최대한 잘게 잘라 준비한다. \n2. 채 썬 양파는 깊은 볼에 담아 뭉치지 않게 풀어 준비한다. \n  *양파를 기름에 볶아 사용하면 더욱 맛이 좋다. \n3. 양파가 담긴 볼에 다진 돼지고기를 넣고 골고루 섞는다.\n    *돼지고기는 살코기와 지방을 7:3 비율로 섞어 사용하면 더욱 맛이 좋다.\n 4. 양파와 고기가 섞이면 맛소금, 달걀물, 후춧가루를 넣고 섞은 후 빵가루를 넣고 섞는다. \n   *반죽이 너무 쳐져 성형이 힘들 경우 빵가루의 양을 늘려서 사용한다.\n 5. 반죽을 야구공보다 작은 사이즈로 뭉쳐 둥글 넙적하게 성형한다.\n 6. 튀김옷 용 달걀물은 알끈을 잘 풀어 움푹한 곳에 펼쳐 담고 밀가루, 빵가루도 움푹한 곳에 각각 펼쳐 담는다.\n 7. 멘치카츠 반죽을 밀가루, 달걀, 빵가루 순으로 골고루 입힌 후 다시 한번 넙적하게 누른다. \n8. 깊은 프라이팬에 멘치카츠가 잠길 정도의 기름을 넣고 170도로 예열한다. \n   *프라이팬의 사이즈에 따라 기름의 양을 조절한다. \n   *기름에 뜨는 빵가루는 탈 수 있으니 체를 이용하여 건져낸다. \n9. 기름이 예열되면 성형해둔 반죽의 빵가루를 가볍게 털어낸 후 기름에 넣고 중 약불로 줄여 약 7분~8분 정도 튀긴다.  """,
    '1. 양파, 당근은 채 썰고 대파, 쪽파는 송송 썰어 준비한다. \n2. 양배추는 1cm 정도 두께로 먹기 좋게 썬다. \n3. 훈연멸치는 내장을 제거하고 마른 팬에 볶아 믹서에 갈아준다. \n4. 팬에 기름, 대파를 넣고 열이 오르면 고기를 넣어 볶아준다. \n5. 고기가 노릇하게 익으면 양파, 당근, 양배추를 넣어 볶는다. \n6. 진간장, 황설탕, 식초, 물을 섞어 양념장을 만든다. \n7. 채소가 볶아지면 가운데에 면을 넣고 가장자리에 양념장을 둘러 중불에서 끓인다. \n8. 면이 풀어지면 불을 세게 켜고 볶아준다. \n9. 완성그릇에 볶음우동을 담고 마요네즈를 뿌려준다. \n10. 훈연멸치가루, 쪽파를 올려 마무리한다.',
    '1. 양파는 꼭지를 제거한 후 폭 1cm 길이 2cm 크기로 사각썰기하여 준비한다. \n2. 당근은 사방 1cm정도 길이로 작게 깍둑썰기 하여 준비한다. \n3.  돼지고기 뒷다리살은 사방 2cm 길이로 깍둑썰기 하여 준비한다.\n*이 때 돼지 비계 부분은 따로 잘게 잘라 준비한다. \n4. 깊은 프라이팬을 강불에 올린 후 식용유를 두른다. \n5. 잘게 잘라 둔 돼지 비계를 넣고 볶는다. \n6. 돼지 비계가 노릇하게 튀겨지면 돼지고기 살코기를 넣고 튀기듯이 볶는다. \n7. 고기가 전체적으로 노릇하게 튀겨지면 양파를 뚜껑 덮듯이 전체적으로 펼쳐 넣는다. \n8. 가볍게 뒤적이며 양파가 갈색나게 볶는다. \n9. 당근을 넣고 볶는다. \n10. 프라이팬 가장자리 쪽으로 진간장을 둘러 넣고 케첩을 넣어 새콤한 맛을 날린다.    \n *토마토나 토마토주스를 사용 할 경우 이때 함께 넣는다. \n11. 양념장이 눋어 붙으려고 하면 물을 넣고 끓기 시작하면 약 15분 이상 강불에 끓인다.    \n * 25~30분 정도 끓이면 맛이 더욱 좋다. \n12. 카레가루를 잘 풀어가며 넣고 농도나게 끓인다.  \n13. 농도가 맞춰지면 불을 끄고 버터를 넣어 섞는다. \n14. 그릇에 밥을 담고 카레를 얹어 완성한다.   \n *버터를 카레에 안 넣었을 경우 완성 그릇에 1조각을 함께 올려도 좋다.',
  ];


  final List<Recipemodel> japan_Cook_Data = List.generate(japan_Cook_Title.length, (index) => Recipemodel(japan_Cook_Title[index], japan_Cook_Image[index],japan_Cook_youtube[index],JapanFood_Ingredient[index],JapanFood_recipe[index]));

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.withOpacity(0.2),
      child:Column(
          children:[
            Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: japan_Cook_Title.length,
                  itemBuilder: (context, index) {
                    return Column(children: [Card(
                      color: Colors.orange.withOpacity(0.2),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  JapanPage(
                                    japan_Cook_Model: japan_Cook_Data[index],)));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 500,
                                height: 200,
                                child: Image.asset(
                                  japan_Cook_Image[index], fit: BoxFit.fill,
                                  width: 100,
                                  height: 100,),
                              ),
                              SizedBox(height: 10,),
                              Text(japan_Cook_Title[index],),
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