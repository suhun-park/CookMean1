import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cookmean/user_community_page/userdeal/user_community_deal_write.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

import '../../widget/mainpage.dart';


List<String> writeSelection = <String>['거래페이지 글쓰기','동네 글쓰기'];
class UserViewWrite extends StatelessWidget {
  const UserViewWrite( {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text('쿡민글쓰기페이지',style: TextStyle(fontSize: 17),)),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(color: Colors.white,),
      ),
      body: UserWrite(),
    );
  }
}
class UserWrite extends StatefulWidget {
  const UserWrite({Key? key}) : super(key: key);

  @override
  State<UserWrite> createState() => _UserWriteState();
}
class _UserWriteState extends State<UserWrite> {
  String dropdownValue = writeSelection.first;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  String postTitle = "";
  String postText = "";
  String postPrice = "";
  List<XFile> _imageFileList = [];
  var count = 0;
  DateTime now = DateTime.now();

  Future<void> selectedImages() async {
    List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      setState(() {
        _imageFileList.addAll(selectedImages);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body:SafeArea(
        child:Container(child:SingleChildScrollView(
      scrollDirection: Axis.vertical,
       child: Column(
        children: [
          Container(
       alignment: Alignment.topLeft,
         child: DropdownButton(
            value: dropdownValue,
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
              if(dropdownValue != "거래페이지 글쓰기") {
                Get.to(UserViewWrite());
              }else{
                Get.to(UserDealWrite());
              }
            },
           items: writeSelection.map<DropdownMenuItem<String>>((String value) {
             return DropdownMenuItem<String>(
               value: value,
               child: Text(value),
             );
           }).toList(),

          ),
          ),
          Container(
            child: SizedBox(
                width: 1000, height: 90,
                child: Container(
                    child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                    child:Row(
                        children: [
                          Container(
                            margin:EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child:
                            FloatingActionButton(
                                child: Icon(Icons.add),
                                onPressed: ()async{selectedImages();}
                            ),
                          ),
                          SizedBox(width: 900,child:
                          GridView.builder(
                              itemCount: _imageFileList!.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
                              itemBuilder: (BuildContext context, int index){
                                return SizedBox(width: 900,child:
                                Container(
                                  margin:EdgeInsets.fromLTRB(14, 20, 20, 20),
                                  child: Image.file(File(_imageFileList![index].path),fit: BoxFit.cover,),
                                )
                                );
                              }),
                          ),

                        ]
                    )
                )
            ),
          ),
          ),
          TextField(
            controller: titleController,
            decoration:const InputDecoration(
              hintText: '제목',
              border : OutlineInputBorder(),
            ),
            maxLength: 10,
            onChanged: (value){
              setState(() {
                postTitle = value;
              });
            },
          ),
          TextField(
            controller: textController,
            decoration:const InputDecoration(
              hintText: '내용',
              border : OutlineInputBorder(),
            ),
            maxLength: 1000,
            maxLines: 10,
            onChanged: (value){
              setState(() {
                postText = value;
              });
            },
          ),
          TextField(
            controller: priceController,
            decoration:const InputDecoration(
              hintText: '가격',
              border : OutlineInputBorder(),
            ),
            maxLength: 20,
            maxLines: 1,
            onChanged: (value){
              setState(() {
                postPrice = value;
              });
            },
          ),
          FloatingActionButton(
              child: Text('보내기'),
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('cookRecipe')
                    .doc()
                    .set(
                  {
                    'Title': postTitle,
                    'Text': postText,
                    'Price': postPrice,
                    "now" : now,
                  },
                );

                for (int i = 1; i < _imageFileList.length; i++) {
                  final refImage = FirebaseStorage.instance
                      .ref()
                      .child('picked images')
                      .child('community${i}' + '.png');

                  if (refImage == 'community${i}'+'.png') {
                    ++i;
                    refImage.putFile(File(_imageFileList[i]!.path));
                  }
                }
                Get.to(MainPage());
              })
        ]),
        ),
        )
      ));
  }
}
