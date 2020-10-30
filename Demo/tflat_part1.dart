import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_toeic_test_tflat/tflat_trang_chu.dart';
import 'package:flutter_toeic_test_tflat/tflat_kiem_tra_dap_an.dart';

//Widget
class tflat_part1 extends StatefulWidget{
     @override
     _tflat_part1 createState() => _tflat_part1();
}

//State of Widget
class _tflat_part1 extends State<tflat_part1> {

  //Dinh nghia cac bien
   int _groupValue = -1;
   var map1 = new Map();
   String dapAn = "";

  //Khuon mau Radio Button
   Widget _myRadioButton({String title, int value, Function onChanged}) {
     return RadioListTile(
       value: value,
       groupValue: _groupValue,
       onChanged: onChanged,
       title: Text(title),

     );
   }

   void KiemTraDapAn(int valueCheck){
       var dapAnCauHoi = int.parse(map1["dapAn"]);
       print(dapAnCauHoi);
       setState(() {
         switch (dapAnCauHoi){
           case 1: dapAn = "Đáp án : A"; break;
           case 2: dapAn = "Đáp án : B"; break;
           case 3: dapAn = "Đáp án : C"; break;
           case 4: dapAn = "Đáp án : D";
         }
       });
   }

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

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => tflat_trang_chu())
              );
            },
          ),
          title: Text("Part 1 (1/198)"),
        ),

        body:Column(
          children: <Widget>[

            new Image.asset(
              'assets/questions/part-1/question-1/image-part1-question1.png',
              width: 300,
              fit: BoxFit.cover,
            ),

            _myRadioButton(
              title: map1["cauA"].toString(),
              value: 1,
              onChanged: (newValue){
                setState(() {
                  _groupValue = newValue;
                  print(_groupValue);
                });
              },
            ),

            _myRadioButton(
              title: map1["cauB"].toString(),
              value: 2,
              onChanged: (newValue){
                setState(() {
                  _groupValue = newValue;
                  print(_groupValue);
                });
              },
            ),

            _myRadioButton(
              title: map1["cauC"].toString(),
              value: 3,
              onChanged: (newValue){
                setState(() {
                  _groupValue = newValue;
                  print(_groupValue);
                });
              },
            ),

            _myRadioButton(
              title: map1["cauD"].toString(),
              value: 4,
              onChanged: (newValue){
                setState(() {
                  _groupValue = newValue;
                  print(_groupValue);
                });
              },
            ),

            Text(
              dapAn , style: TextStyle(color: Colors.green ,fontSize: 18),
            ),

          ],
        ),

        //Bottom part - tu thanh chay Audio tro xuong
        bottomNavigationBar:
        Stack(
            children: [
              Container(
                height: 70,
                color: Colors.blueAccent,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 20,
                      color: Colors.blue,
                      child: Center(child: Text("Thanh chạy audio"),),
                    ),
                    Container(
                      height: 50,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[

                          Container(
                            width: 205,
                            child: Row(
                              textDirection: TextDirection.ltr,
                              children: [
                                IconButton(
                                  onPressed: (){},
                                  color: Colors.blue,
                                  icon: Icon(Icons.play_circle_outline),
                                ),
                                FlatButton(
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  padding: EdgeInsets.all(0.0),
                                  splashColor: Colors.blueAccent,
                                  onPressed: () {
                                           KiemTraDapAn(_groupValue);
                                  },
                                  child: Text(
                                    "Trả lời",
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                )

                              ],
                            ),
                          ),

                          Container(
                            width: 206,
                              child: Row(
                                textDirection: TextDirection.rtl,
                                children: [

                                  IconButton(
                                    onPressed: (){},
                                    color: Colors.blue,
                                    icon: Icon(Icons.skip_next),
                                  ),
                                  IconButton(
                                    onPressed: (){},
                                    color: Colors.blue,
                                    icon: Icon(Icons.skip_previous),
                                  ),
                                ],
                              ),
                            ),

                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]
        )

    );
  }
}



