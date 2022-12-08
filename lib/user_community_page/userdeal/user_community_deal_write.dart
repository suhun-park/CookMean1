import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserDealWrite extends StatefulWidget {
  const UserDealWrite({Key? key}) : super(key: key);

  @override
  State<UserDealWrite> createState() => _UserDealWriteState();
}

class _UserDealWriteState extends State<UserDealWrite> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  TextEditingController titleController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String postTitle = "";
  String postText = "";
  String postPrice = "";
  List<XFile> _imageFileList = [];
  final ImagePicker _picker = ImagePicker();
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

    return Scaffold(
      body: Column(
        children: [

        ],

      ),
    );
  }
}
