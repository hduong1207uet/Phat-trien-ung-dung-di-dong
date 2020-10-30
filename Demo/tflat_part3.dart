
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_test_tflat/tflat_trang_chu.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class tflat_part3 extends StatefulWidget {
  @override
  _tflat_part3State createState() => _tflat_part3State();
}

class _tflat_part3State extends State<tflat_part3> {
  var map1 = new Map();
  int _groupValue = -1;

  @override
  void initState(){
    super.initState();
    map1.clear();
    final databaseReference = FirebaseDatabase.instance.reference().child("CauHoi/part1/1");
    databaseReference.once().then((DataSnapshot dataSnapshot) {
      setState(() {
        map1.addAll(dataSnapshot.value);
      });
    });
  } // end init state
  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
                leading: IconButton(
                      icon :Icon(Icons.arrow_back_ios),
                      onPressed: (){
                        Navigator.push(context ,
                            MaterialPageRoute(builder: (context)=> tflat_trang_chu())
                        );
                      },

                 ),
                title: Text("Part3 - 1/100"),
          ),

          body: Column(
            children: <Widget>[
              _myRadioButton(
                title: map1["cauA"].toString(),
                value: 02,
                onChanged: (newValue){
                  setState(() {
                    _groupValue = newValue;
                    print(_groupValue);
                  });
                },
              ),
              _myRadioButton(
                title: map1["cauB"].toString(),
                value: 11,
                onChanged: (newValue){
                     setState(() {
                       _groupValue = newValue;
                       print(_groupValue);
                     });
                },
              ),

            ],
          )


    );


  }
}
