import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookmean/page/writepage/text_form.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../widget/mainpage.dart';




class WritePage extends StatelessWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('레시피 글쓰기'),backgroundColor: Colors.black,
      ),
      body: RecipeWrite(),
    );
  }
}
//바디부분
class RecipeWrite extends StatefulWidget {
  const RecipeWrite({Key? key}) : super(key: key);


  @override
  State<RecipeWrite> createState() => _RecipeWriteState();

}

class _RecipeWriteState extends State<RecipeWrite> {
  late Future <void> _intializeVideoPlayerFuture;
  late VideoPlayerController _controller;
  String netWork="";
  Future <void> videoAdd() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );
    if(result != null) {
      File pass = File(result.files.single.path.toString());
      Uint8List? fileBytes = result.files.first.bytes;
      String fileName = result.files.first.name;
      File fireUpload = File(result.files.single.path!);
      String netWork = fileName;

      await FirebaseStorage.instance.ref().child('uploads/$fileName').putFile(fireUpload);
      print(netWork);
    }
  }
  @override
  void initState() {
    _controller = VideoPlayerController.network('${netWork}');
    _intializeVideoPlayerFuture = _controller.initialize();
    super.initState();

  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Center(
          child:SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child:Column(
                children: [
                  Container(
                    width: double.infinity, height: 270,
                    child:FutureBuilder(
                      future: _intializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,

                            child: VideoPlayer(_controller),
                          );
                        } else {
                          print("안됨");
                          return
                            Container(
                              width: 50, height: 50,
                              child:FloatingActionButton(
                                  heroTag: '동영상',
                                  backgroundColor: Colors.grey,
                                  child: Icon(Icons.camera_alt,color: Colors.black,size: 10,),
                                  shape: RoundedRectangleBorder(),
                                  onPressed: ()async {
                                    await videoAdd();
                                  }
                              ),
                            );
                        }
                      },
                    ),

                  ),

                  SizedBox( height: 30,),

                  TextForm(), //텍스트폼 클래스

                ],
              ),
            ),
          ),
        )
    );
  }
}