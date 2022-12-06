import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomUserSheet extends StatefulWidget {
  const BottomUserSheet({Key? key}) : super(key: key);

  @override
  State<BottomUserSheet> createState() => _BottomUserSheetState();
}

class _BottomUserSheetState extends State<BottomUserSheet> {
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  String? content;
  DateTime? first;
  DateTime? last;

  Widget calendarText () {
    return  Row(
        children:const [
          SizedBox(width: 15,),
          Text("제조기간",style: TextStyle(fontSize: 18,color: Colors.cyan),),
          SizedBox(
            width: 110,
          ),
          Text("유통기한",style: TextStyle(fontSize: 18,color: Colors.cyan),),
        ]
    );
  }

  Widget calendarController () {
    DateTime dateTime = DateTime(2016, 8, 3, 17, 45);
    return Row(
        children: [
          const SizedBox(
            height: 180,
          ),
          Container(
            width: 100,
            child: TextField(
              controller: firstController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                ),
              ),
              onTap: () {
                CupertinoDatePicker(
                  initialDateTime: dateTime,
                  use24hFormat: true,
                  // This is called when the user changes the dateTime.
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() => dateTime = newDateTime);
                  },
                );
              },
            ),
          ),
          const SizedBox(
            width: 70,
          ),
          Container(
            width: 100,
            child: Expanded( child:TextField(
              controller: lastController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                ),
              ),
            ),
            ),
          ),
        ]
    );
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                child: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed :() {
                      showModalBottomSheet(context: context,
                        isScrollControlled: true,
                        builder: (_) {
                          return Container(
                            margin: EdgeInsets.fromLTRB(60, 30, 0, 0),
                            height: 430, width: 200,
                            alignment: Alignment.topLeft,
                              child:Column(children: [
                                calendarText(),
                                calendarController(),
                                  ],
                                ),
                          );
                        },
                      );
                    }
                ),
              )
          )
        ]
    );
  }
}

