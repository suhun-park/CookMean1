import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class custom_text_field extends StatefulWidget {
  const custom_text_field({Key? key}) : super(key: key);

  @override
  State<custom_text_field> createState() => _custom_text_fieldState();
}

class _custom_text_fieldState extends State<custom_text_field> {
  TextEditingController saveController = TextEditingController();
  String save = "";
  @override

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: TextField(
          controller: saveController,
          decoration:const InputDecoration(
            hintText: '유통기한저장',
            border : OutlineInputBorder(),
          ),
          maxLines: 1,
          onChanged: (value){
            setState(() {
              save = value;
            });
          },
        ),
      ),

    );
  }
}
