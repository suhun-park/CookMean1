import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widget/mainpage.dart';

class TextForm extends StatefulWidget {
  const TextForm({Key? key}) : super(key: key);

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController ingredientController = TextEditingController();
  TextEditingController recipeController = TextEditingController();
  String postTitle = "";
  String postIngredient = "";
  String postRecipe = "";
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "제목은 비워둘 수 없습니다.";
                }
                return null;
              },
              decoration: const InputDecoration(
                counterText: '',
                hintText: '제목',
                border: OutlineInputBorder(),
              ),
              minLines: 1,
              maxLines: 5,
              maxLength: 20,
              onChanged: (value) {
                setState(() {
                  postTitle = value;
                });
              },
            ),
            TextFormField(
              controller: ingredientController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "필수 입력해주세요!";
                }
                return null;
              },
              decoration: const InputDecoration(
                counterText: '',
                hintText: '재료',
                border: OutlineInputBorder(),
              ),
              maxLength: 400,
              minLines: 5,
              maxLines: 50,
              onChanged: (value) {
                setState(() {
                  postIngredient = value;
                });
              },
            ),
            TextFormField(
              controller: recipeController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "필수 입력해주세요";
                }
                return null;
              },
              decoration: const InputDecoration(
                counterText: '',
                hintText: '레시피',
                border: OutlineInputBorder(),
              ),
              maxLength: 400,
              minLines: 5,
              maxLines: 50,
              onChanged: (value) {
                setState(() {
                  postRecipe = value;
                });
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                  child: Icon(Icons.add),
                  backgroundColor: Colors.orange,
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      Navigator.of(context).pop('입력되었습니다!');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                      await FirebaseFirestore.instance
                          .collection('cookRecipe')
                          .doc()
                          .set(
                        {
                          'Title': postTitle,
                          'Ingredient': postIngredient,
                          'Recipe': postRecipe,
                          "now": now,
                        },
                      );
                    }
                    ;
                  }),
            ),
          ],
        ));
  }
}
