import 'package:cookmean/model/model_recipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class KoreanPage extends StatefulWidget {
  const KoreanPage({Key? key,required this.korean_Cook_Model}) : super(key: key);
  final Recipemodel korean_Cook_Model;
  @override
  State<KoreanPage> createState() => _KoreanPageState();
}

class _KoreanPageState extends State<KoreanPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.korean_Cook_Model.youtube,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
        showLiveFullscreenButton:true,
      ),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.korean_Cook_Model.title),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            YoutubePlayer(
        key: ObjectKey(_controller),
        controller: _controller,
        actionsPadding: const EdgeInsets.only(left: 16.0),
        bottomActions: [
          CurrentPosition(),
          const SizedBox(width: 10.0),
          ProgressBar(isExpanded: true),
          const SizedBox(width: 10.0),
          RemainingDuration(),
          //FullScreenButton(),
        ],
      ),
              Container(margin:EdgeInsets.fromLTRB(13, 30, 0, 0),child:Text('재료',style: TextStyle(letterSpacing:2.0,fontSize: 30,fontWeight: FontWeight.bold,),),),
              Container(margin:EdgeInsets.fromLTRB(15, 20, 0, 0),child:Text(widget.korean_Cook_Model.ingredient,style: TextStyle(letterSpacing:1.0,fontSize: 15,height: 1.5),),),
              Container(margin:EdgeInsets.fromLTRB(13, 30, 0, 0),child:Text('레시피',style: TextStyle(letterSpacing:2.0,fontSize: 30,fontWeight: FontWeight.bold,),),),
              Container(margin:EdgeInsets.fromLTRB(15, 20, 0, 0),child:Text(widget.korean_Cook_Model.recipe,style: TextStyle(letterSpacing:1.0,fontSize: 15,height: 1.5),),)



                    ],
                  )
    )
    );
  }
}





