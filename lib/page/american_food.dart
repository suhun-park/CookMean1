import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/model_recipe.dart';
import '../page_menu/american_page.dart';



class AmericanFood extends StatefulWidget {
  const AmericanFood({Key? key}) : super(key: key);

  @override
  State<AmericanFood> createState() => _AmericanFoodState();
}

class _AmericanFoodState extends State<AmericanFood> {
  int selectedIndex= 0;
  static List<String> american_Cook_Title = [
    '[백종원레시피]집에서 크림 파스타쯤이야',
    '[백종원레시피]크리스피하게 구워내고 특급소스와 함께 하는 치킨 스테이크. 사랑하는 가족과 함께하세요. ',
    '[백종원레시피]집에서 만든 새우감바스?? 감바스 알 아히요',
    '[백종원레시피]토마토 주스로 스튜를 만든다고요? 집에 있는 재료만으로 도전!',
  ];
  static List<String> american_Cook_Image = [
    'assets/images/양식크림파스타.jpeg',
    'assets/images/양식치킨스테이크.jpeg',
    'assets/images/양식감바스.jpeg',
    'assets/images/양식토마토스튜.jpeg',
  ];
  static List<String> american_Cook_youtube = [
    '0bnFoRQebq0',
    'OgMi1KTPzJY',
    'jBdQ65yHB_U',
    '1Lc70M38LTk',
  ];
  static List<String> AmericanFood_Ingredient = [
    '*면 삶기 \n정수물 8과1/3컵(1.5L)  \n스파게티면 90g \n꽃소금 1큰술(12g) \n올리브유 약간 \n*베이컨크림파스타 \n베이컨 2줄(32g) \n양파 1/2개(125g) \n양송이 버섯 1과 1/2개(30g) \n밀가루 1/2큰술(5g) \n우유 1팩(200ml) \n버터 약1큰술(15g) \n올리브유 2큰술(14g) \n파르메산 치즈 2큰술(16g) \n꽃소금 1/6큰술(2g) \n삶은스파게티면 전량 \n후춧가루 적당량 \n파슬리가루 적당량',
    '*스테이크 재료 \n닭 다리살 400g \n소금 2g \n후추 2g \n마늘 11개(120g) \n감자 1개(150g) \n양파 1개(130g) \n버터 1.5큰술(25g) \n*스테이크소스 재료 \n버터 1큰술(10g) \n간 마늘 1/2큰술(10g) \n간장 1/4컵(40g) \n식초 3큰술(20g) \n설탕 1/2컵(45g) \n물 1/2컵(90g) \n후추 약간',
    '칵테일새우 大 사이즈(26/30) 10마리(100g) \n통마늘 15개(75g) \n양송이버섯 4개(80g) \n방울토마토 6개(60g) \n베트남 고추 5개(2g) \n올리브유 1컵(180ml) \n맛소금 약 1/5큰술(3g) \n후춧가루 약간 \n파슬리가루 약간 \n바게트 or 식빵 적당량',
    '토마토 1과1/2개(345g) \n감자 약 1/3개(70g) \n셀러리 약 1/3컵(40g) \n양파 1/2개(125g) \n식용유 약 6큰술(40g) \n돼지고기 뒷다리살(카레용) 200g \n물 약 4컵(700g) \n토마토 주스 약 2/3컵(100g) \n진간장 약 1과1/2큰술(14g) \n케첩 1과1/2큰술(30g) \n식초 약 1큰술(10g) \n맛소금 약 1/3큰술(4g) \n버터 약간 \n후춧가루 약간 \n파슬리 약간',
      ];
  static List<String> AmericanFood_recipe = [
    '*면 삶기 \n1. 냄비에 정수물, 꽃소금, 올리브유를 넣고 스파게티면 삶을 물을 끓인다. \n2. 물이 끓어오르면 면을 돌려서 펼쳐 넣고 붙지않도록 저어주면서 약 6분 정도 삶아 준비한다. \nTip: 크림파스타 농도 조절을 위해 면수는 버리지 않고 따로 보관해둔다.  \n3. 삶아진 스파게티면은 체에 밭쳐 건져낸다. \n*베이컨크림파스타 \n1. 베이컨은 두께 1cm 정도로 자르고, 양파는 가로, 세로 0.5cm 정도로 다져 준비한다. \n2. 양송이 한 개는 가로,세로 0.5cm 정도로 다지고, 반 개는 두께 0.5cm로 편 썰어 준비한다. \nTip: 슬라이스 4조각 정도만 보이게 편 썰어서 넣어준다. \n3. 프라이팬에 베이컨, 다진양파, 다진 양송이 버섯, 올리브유를 넣고 중 불에 볶는다.  \n4. 양파가 노릇해 질 때까지 충분히 볶는다. \n5. 양파에 색이 나면 버터를 넣어 볶고, 버터가 녹으면 우유, 편 썰은 양송이 버섯, 스파게티 면을 넣어 졸인다. \n6. 밀가루를 넣고 잘 풀어 주어 농도 조절을 한다. \n7. 불을 약 불로 줄인 후 꽃소금으로 간을 한다. \nTip: 소스 농도가 너무 되직하면 면수를 추가한다. \n8. 불을 끄고 파르메산 치즈를 골고루 뿌려 섞는다. \n9. 후춧가루를 뿌려준 후 접시에 담고 파슬리 가루를 뿌려 완성한다. \nTip: 기호에 따라 우유를 추가해 소스를 더 만들어 사용한다.',
    '*스테이크 만드는 법 \n1. 닭 다리 살은 키친타월을 이용하여 핏물을 제거하고 살 쪽에 소금, 후추 밑간하여 준비한다. \n2. 양파는 1cm 두께로 썰어 1/2크기로 자르고 감자는 0.5cm 정도로 편 썬다. \n3. 마늘은 꼭지를 제거하여 준비한다. \n4. 닭 다리 살 껍질 부분을 팬에 닿게 올리고 중불에서 튀겨지도록 익힌다. \n5. 닭기름이 나오기 시작하면 불을 약하게 줄인다. \n6. 프라이팬에 기름이 자작하게 생기면 감자, 마늘을 넣고 뚜껑을 덮어 익힌다. \n7. 감자가 절반 정도 익었을 때 양파를 넣고 익힌다. \n8. 구운 감자, 구운 마늘을 접시에 옮겨 담는다. \n9. 구운 양파의 1/2개를 접시에 옮겨 담고 나머지 1/2개는 가위를 이용하여 잘게 자른다. \n10. 닭 다리 살의 껍질 부분이 바삭하게 튀겨지면 기름을 절반 정도 닦아낸 후 버터 1 큰 술을 두르고 뒤집어 준다. \n11. 닭고기가 다 익으면 완성 접시에 옮겨 담는다. \n12. 구운 채소, 스테이크 소스를 곁들이고 스테이크 위에 버터 1/2 큰 술을 올려 마무리한다. \n*스테이크 소스 만드는 법 \n1. 닭 다리살 구운 팬에 남아있는 양파, 버터 1 큰 술, 간 마늘을 넣고 볶아준다. \n2. 마늘향이 올라오면 간장, 설탕, 식초, 물, 후춧가루를 넣어 중 불에서 농도나게 끓인다.',
    '1. 바게트와 식빵을 먹기 좋은 크기로 자르고, 팬에 노릇하게 구워 준비한다. \n2. 새우는 세척하고, 통마늘은 으깨주고, 양송이버섯은 4등분으로 썰어준다. \n3. 방울토마토는 꼭지를 떼고 세척하여 2등분으로 썰어준다. \n4. 팬에 올리브유를 넣어주고 으깬 통마늘, 부순 베트남 고추, 맛소금을 넣고 중약 불로 마늘 오일을 뽑아주며 노릇하게 색을 내준다. \n5. 새우, 양송이버섯, 방울토마토를 넣고 새우가 익을 때까지 끓여준다. \n6. 세팅 그릇에 담아 준 후, 후춧가루, 파슬리가루를 뿌려 완성해준다. \n7. 바게트 or 식빵을 구워 함께 곁들어 먹는다.',
    '1. 토마토, 양파는 약 2cm 길이로 깍뚝 썰기 한다. \n2. 감자는 껍질을 제거한 후 1.5cm 길이로 깍뚝 썰기 한다.  \n3. 셀러리 줄기는 0.5cm 두께로 송송 썬다. \n* 너무 두꺼운 부분은 길게 반으로 갈라 송송 썬다. \n4. 프라이팬에 식용유를 넣고 강불에 예열한다. \n5. 돼지고기를 넣고 튀기듯이 볶는다. \n6. 돼지고기가 전체적으로 노릇해지기 시작하면 양파를 넣고 고기가 완전히 노릇해질 때 까지 볶는다. \n7. 감자, 토마토, 셀러리를 넣고 볶는다. \n8. 물, 토마토 주스, 진간장, 케첩, 식초, 맛소금을 넣고 끓으면 중불로 줄여 약 15분 정도 끓인다.    \n* 매콤한 맛을 원한다면 이때 고운 고춧가루를 추가해도 좋다.    \n* 월계수 잎이 있다면 넣고 함께 끓여준다. \n9. 농도가 난 스튜를 그릇에 옮겨 담은 후 버터를 올린다. \n10. 후춧가루, 파슬리가루를 뿌려 완성한다.    \n* 기호에 맞게 밥이나 식빵과 함께 먹는다.',
     ];


  final List<Recipemodel> american_Cook_Data = List.generate(american_Cook_Title.length, (index) => Recipemodel(american_Cook_Title[index], american_Cook_Image[index],american_Cook_youtube[index],AmericanFood_Ingredient[index],AmericanFood_recipe[index]));

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: american_Cook_Title.length,
      itemBuilder: (context, index){
        return Card(
          color: Colors.orange.withOpacity(0.2),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AmericanPage(american_Cook_Model: american_Cook_Data[index],)));
            },
            child:Container(
              child: Column(
                children: [
                  SizedBox(
                    width: 500,
                    height: 200,
                    child:Image.asset(american_Cook_Image[index],fit:BoxFit.fill,width: 100,height: 100,),
                  ),
                  SizedBox(height: 10,),
                  Text(american_Cook_Title[index],),
                  SizedBox(height: 10,),
                ],

              ),
            ),

          ),
        );
      },
    );


  }
}
